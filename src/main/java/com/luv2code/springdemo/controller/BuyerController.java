package com.luv2code.springdemo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.dao.CartDAO;
import com.luv2code.springdemo.dao.JointableDAO;
import com.luv2code.springdemo.dao.MessageBuyerDAO;
import com.luv2code.springdemo.dao.OrderDAO;
import com.luv2code.springdemo.dao.PaymentDAO;
import com.luv2code.springdemo.dao.PinDAO;
import com.luv2code.springdemo.dao.ProductDAO;
import com.luv2code.springdemo.dao.ReviewDAO;
import com.luv2code.springdemo.dao.StateDAO;
import com.luv2code.springdemo.entity.Buyer;
import com.luv2code.springdemo.entity.Cart;
import com.luv2code.springdemo.entity.Jointable;
import com.luv2code.springdemo.entity.MessageBuyer;
import com.luv2code.springdemo.entity.MessageTransporter;
import com.luv2code.springdemo.entity.Orders;
import com.luv2code.springdemo.entity.Payment;
import com.luv2code.springdemo.entity.Pin;
import com.luv2code.springdemo.entity.Product;
import com.luv2code.springdemo.entity.ProductReview;
import com.luv2code.springdemo.entity.States;
import com.luv2code.springdemo.entity.Transporter;
import com.luv2code.springdemo.service.BuyerService;
import com.luv2code.springdemo.service.TransporterService;

@Controller
@RequestMapping("/buyer")
public class BuyerController {

	@Autowired
	private JointableDAO jointableDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private TransporterService transporterService;
	
	@Autowired
	private BuyerService buyerService;
	
	@Autowired
	private MessageBuyerDAO messageBuyerDAO;
	
	@Autowired
	private PinDAO pinDAO;
	
	@Autowired
	private StateDAO stateDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@GetMapping("/seeProducts")
	public String seeProducts(Model theModel) {
		
		List<Product> theProducts = productDAO.getAllProducts();
		theModel.addAttribute("pro",theProducts);
		return "list-buyer-products";
		
	}
	
	
	@RequestMapping("/furtherproceedpayment")
	public String furtherproceedpayment(@Valid @ModelAttribute("oid") Payment pay,BindingResult thbindingresults ,
			Model theModel)
	{
		if(thbindingresults.hasErrors())
		{
			Orders theOrders = orderDAO.getorderbyid(pay.getOid());
			Transporter r = transporterService.getTransporter(theOrders.getTuser());
			//theModel.addAttribute("oid",pay);
			int to_pamount = theOrders.getAmount();
			int to_samount = theOrders.getSamount();
			int to_amount = to_pamount + to_samount;
			theModel.addAttribute("TPA", to_amount);
			theModel.addAttribute("TSA",to_samount);
			theModel.addAttribute("TA",to_amount);
			theModel.addAttribute("A",r);
			return "payment-page";	
		}
		paymentDAO.savePay(pay);
		return "home";
		
	}
	
	
	
	@RequestMapping("/furtherproceed")
	public String furtherproceed(@Valid @ModelAttribute("ss") Orders theOrder,BindingResult theBindingResult,
			 
			Model theModel)
	{
		 
		if(theBindingResult.hasErrors())
		{
			List<Transporter> theTransporter = transporterService.getdistincttransporter();
			theModel.addAttribute("list",theTransporter);
			 return "proceeding";
		}
			
		
		
		
			List<Transporter> theTransporter = transporterService.getTransporterByState(theOrder.getState());
			Transporter r = new Transporter();
			for(Transporter temp : theTransporter)
			{
				r=temp;
				break;
			}
			//System.out.println("the value of d is now "+theOrder.getOrderDescription());
			theOrder.setTuser(r.getUserName());
			theOrder.setSamount(theOrder.getSww()*r.getPw());
			int to_pamount = theOrder.getAmount();
			int to_samount = theOrder.getSamount();
			int to_amount = to_pamount + to_samount;
			orderDAO.saveOrder(theOrder);
			int oid = theOrder.getOrderId();
			
			Payment pay = new Payment();
			pay.setOid(oid);
			theModel.addAttribute("oid",pay);
			theModel.addAttribute("TPA", to_amount);
			theModel.addAttribute("TSA",to_samount);
			theModel.addAttribute("TA",to_amount);
			theModel.addAttribute("A",r);
			//System.out.println("the value of d is after "+theOrder.getOrderDescription());
		    return "payment-page";
		
	}
	
	
	@RequestMapping("/backfromcart")
	public String backfromcart()
	{
		cartDAO.deleteAllCarts();	
		return "home";
		
	}
	
	
	
	@RequestMapping("/viewCart")
	public String viewCart(Model theModel)
	{
		List <Cart> theCarts = cartDAO.getCarts();
		
		int totalprice =0;
		int ccc=0;
		int totalweight =0;
		for(Cart temp : theCarts)
		{
			ccc++;
			totalprice += temp.getCartPrice();
			totalweight += temp.getWeight();
		}
		if(ccc==0)
		{
			System.out.println("OHHH this is executing");
			cartDAO.deleteAllCarts();
			return "home";
		}
		List<String> listz=new ArrayList<String>();  
		for(Cart temp : theCarts)
		{
			 int it = temp.getCartProductId();
			 Product ccct = productDAO.getProduct(it);
			 listz.add(ccct.getProductName());
		}
		theModel.addAttribute("pro",theCarts);
		theModel.addAttribute("tp",totalprice);
		theModel.addAttribute("tw",totalweight);
		theModel.addAttribute("list2",listz);
		return "view-cart";
	}
	
	@RequestMapping("/proceed")
	public String proceed(@RequestParam("tpp") int tpp,@RequestParam("tww") int tww,Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List <Cart> theCarts = cartDAO.getCarts();
		String d ="";
		int xxx=0;
		ArrayList<Integer> cars = new ArrayList<Integer>();
		
		for(Cart temp : theCarts)
		{
			
			int h = temp.getCartProductId();
			List<Jointable> theJointable = jointableDAO.getlisting(userName,h);
			
			for(Jointable te : theJointable)
			{
				xxx++;
				break;
			}
			if(xxx==0)
			{
				cars.add(h);
			}
			Product f = productDAO.getProduct(temp.getCartProductId());
			d+=f.getProductName() + " ";
			d+=temp.getQuantity()+" | ";
		}
		
		Orders theOrder = new Orders();
		
		
		long millis=System.currentTimeMillis();  
		java.sql.Date dated =new java.sql.Date(millis); 
		theOrder.setDate(dated);
		theOrder.setBuser(userName);
		theOrder.setOrderDescription(d);
		theOrder.setAmount(tpp);
		theOrder.setStatus(0);
		theOrder.setSww(tww);
		Buyer x = buyerService.getBuyer(userName);
		theOrder.setAddress(x.getAddress()+" "+x.getCity());
		theOrder.setState(x.getState());
		//System.out.println("the value of d "+d+" "+tpp+" "+tww);
		orderDAO.saveOrder(theOrder);
		
		
		
		/*Doubtful lines of codes*/
		int idoforder = theOrder.getOrderId();
		
		
		/* utlitiy code for jointable implementing */
		for(int i=0;i<cars.size();i++)
		{
			int  m = cars.get(i);
			jointableDAO.saves(userName,m,idoforder);
		}
		theModel.addAttribute("ss",theOrder);
		cartDAO.deleteAllCarts();
		List<States> theStates = stateDAO.getAllStates();
		theModel.addAttribute("statelist",theStates);
		List<Transporter> theTransporter = transporterService.getdistincttransporter();
		theModel.addAttribute("list",theTransporter);
		return "proceeding";
	}
	@RequestMapping("/addtocart")
	public String addtocart(@RequestParam("productIdd") int theId,Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		
		List <Cart> theCarts = cartDAO.getCarts();
		boolean x=false;
		int xx=1;
		int p = 0 ;
		for(Cart temp : theCarts)
		{
			if(temp.getCartProductId()==theId)
			{
				x=true;
				p = temp.getCartId();
				xx=2;
				break;
			}
		}
		if(xx==1)
		{
			Product tempProduct = productDAO.getProduct(theId);
			
			Cart theCart = new Cart();
			theCart.setCartBuyerUserName(userName);
			theCart.setCartProductId(theId);
			theCart.setQuantity(1);
			theCart.setWeight(tempProduct.getWeight());
			theCart.setCartPrice(tempProduct.getPrice());
			 
			cartDAO.saveCart(theCart);
			List<Product> theProducts = productDAO.getAllProducts();
			theModel.addAttribute("pro",theProducts);
		/*	List<Jointable> theJointable = jointableDAO.getlisting(userName,theId);
			int xxx=0;
			for(Jointable te : theJointable)
			{
				xxx++;
				break;
			}
			if(xxx==0)
			{
				jointableDAO.savelisting(userName,theId);
			}*/
			return "list-buyer-products";
		}
		else
		{
			Product tempProduct = productDAO.getProduct(theId);
			
			Cart theCart = cartDAO.getCart(p);
			theCart.setCartBuyerUserName(userName);
			theCart.setCartProductId(theId);
			theCart.setQuantity(theCart.getQuantity()+1);
			theCart.setWeight(theCart.getWeight()+tempProduct.getWeight());
			theCart.setCartPrice(theCart.getCartPrice()+tempProduct.getPrice());
			 
			cartDAO.saveCart(theCart);
			List<Product> theProducts = productDAO.getAllProducts();
			theModel.addAttribute("pro",theProducts);
			return "list-buyer-products";
		}
	}
	
	@RequestMapping("/seeOrders")
	public String seeOrders(Model theModel) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<Orders> theOrders = orderDAO.getorderbyuser(userName);
		theModel.addAttribute("alpha",theOrders);
		return "buyer-orders";
	}
	
	@RequestMapping("/writeReview")
	public String writeReview(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<Jointable> theJointable = jointableDAO.getByUser(userName);
		theModel.addAttribute("reviewmodel",theJointable);
		//List<Product> theProduct = productDAO.getEmptyList();
		List<String> listz=new ArrayList<String>();  
		for(Jointable t:theJointable)
		{
			int ii = t.getProductId();
			Product te = productDAO.getProduct(ii);
			String ll = te.getProductName();
			listz.add(ll);
		}
		theModel.addAttribute("list2",listz);
		return "review-form";
	}
	
	
	@RequestMapping("/proceedreview")
	public String proceedreview(@RequestParam("productId") int theId,@RequestParam("productname") String pn,Model theModel)
	{
		ProductReview newReview = new ProductReview();
		newReview.setProId(theId);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		newReview.setUser(userName);
		
		long millis=System.currentTimeMillis();  
		java.sql.Date dated =new java.sql.Date(millis);  
		newReview.setDate(dated);
		
		theModel.addAttribute("n",newReview);
		theModel.addAttribute("name",pn);
		return "write-review";
	}
	
	@RequestMapping("/reviewdone")
	public String reviewdone(@ModelAttribute("name") ProductReview newReview)
	{
		reviewDAO.saveNewReview(newReview);
		return "home";
	}
	
	@RequestMapping("/seereview")
	public String seereview(@RequestParam("productIdd") int theId,Model theModel)
	{
		List<ProductReview> thelists = reviewDAO.getallreviewbyid(theId);
		theModel.addAttribute("thelist",thelists);
		return "seereview";
	}
	
	@RequestMapping("/declineorderlast")
	public String declineorderlast()
	{
		
		int x = orderDAO.getlastOrdernull();
		orderDAO.deleteOrder(x);
		return "home";
	}
	
	@RequestMapping("/seepins")
	public String seepins(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<Pin> thepins = pinDAO.getallpins();
		List<Pin> thePins = pinDAO.getempty();
		for(Pin x:thepins)
		{
			int u = x.getOrderId();
			Orders a = orderDAO.getorderbyid(u);
			//System.out.println(userName + " : "+a.getBuser() );
			int y=0;
			int m = Math.min(userName.length(),a.getBuser().length());
			for(int i=0;i<m;i++)
			{
				if(userName.charAt(i)==a.getBuser().charAt(i))y++;
			}
			if(y==m)
			{
				//System.out.println( a.getBuser() );
				thePins.add(x);
			}
			
		}
		theModel.addAttribute("pinlist",thePins);
		return "pin";
	}
	
	@RequestMapping("/messageinsert")
	public String messageinsert(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		MessageBuyer n = new MessageBuyer();
		n.setBuser(userName);
		long millis=System.currentTimeMillis();  
		java.sql.Date dated =new java.sql.Date(millis);  
		n.setDate(dated);
		n.setStatus(0);
		theModel.addAttribute("x",n);
		return "support-buyer";
	}
	
	@RequestMapping("/inserting")
	public String inserting(@ModelAttribute("x") MessageBuyer temp,Model theModel)
	{
		messageBuyerDAO.saveit(temp);
		return "home";
		
	}
	
	@RequestMapping("/seeresponseadmin")
	public String seeresponseadmin(Model theModel)
	{
	
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<MessageBuyer> a = messageBuyerDAO.getlistbystatusanduser(1,userName);
		theModel.addAttribute("x",a);
		return "r_b";	
	}
}









