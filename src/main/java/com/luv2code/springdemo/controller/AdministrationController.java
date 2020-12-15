package com.luv2code.springdemo.controller;

import java.util.List;
import java.util.Random;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.dao.MessageBuyerDAO;
import com.luv2code.springdemo.dao.MessageTransporterDAO;
import com.luv2code.springdemo.dao.OrderDAO;
import com.luv2code.springdemo.dao.PaymentDAO;
import com.luv2code.springdemo.dao.PinDAO;
import com.luv2code.springdemo.dao.ProductDAO;
import com.luv2code.springdemo.dao.ReviewDAO;
import com.luv2code.springdemo.dao.StateDAO;
import com.luv2code.springdemo.entity.Buyer;
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
@RequestMapping("/administration")
public class AdministrationController {
	
	// inject the DAO
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private StateDAO stateDAO;
	
	@Autowired
	private PinDAO pinDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	
	@Autowired
	private MessageTransporterDAO messageTransporterDAO;
	
	@Autowired
	private BuyerService buyerDAO;
	
	@Autowired
	private TransporterService transporterDAO;
	@Autowired
	private MessageBuyerDAO messageBuyerDAO;
	@Autowired 
	private PaymentDAO paymentDAO;
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}	
	@RequestMapping("/addTheProductCategory")
	public String addTheProductCategory(Model theModel)
	{
		return "home";
	}
	
	@RequestMapping("/addNewProduct")
	public String addNewProduct(Model theModel)
	{
		Product theProduct = new Product();
		theModel.addAttribute("pro",theProduct);
		return "add-product";
	}
	@RequestMapping("/saveNewProduct")
	public String saveNewProduct(@Valid @ModelAttribute("pro") Product theProduct,BindingResult thbindingresults)
	{
		if(thbindingresults.hasErrors())
		{
			return "add-product";	
		}
		productDAO.saveProduct(theProduct);
		return "home";
	}
	@RequestMapping("/listAllProduct")
	public String listAllProduct(Model theModel)
	{
		List<Product> theProducts = productDAO.getAllProducts();
		theModel.addAttribute("pro",theProducts);
		return "list-admin-products";
		
	}
	
	@RequestMapping("/updateProductForm")
	public String updateProductForm(@RequestParam("productIdd") int theId,Model theModel)
	{
		Product theProduct = productDAO.getProduct(theId);
		theModel.addAttribute("pro",theProduct);
		return "add-product";
		
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("productIdd") int theId,Model theModel)
	{
		productDAO.deleteProduct(theId);
		return "home";
		
	}
	@RequestMapping("/seeUnverifiedOrders")
	public String seeUnverifiedOrders(Model theModel)
	{
		List<Orders> theOrders = orderDAO.getOrdersWithStatus(0);
		theModel.addAttribute("ord",theOrders);
		return "admin-unverified-orders";
	}
	@RequestMapping("/verifyit")
	public String verifyit(@RequestParam("productIdd") int theId,Model theModel)
	{
	
		Payment thePay = paymentDAO.getpay(theId);
		theModel.addAttribute("pro",thePay);
		theModel.addAttribute("xx",thePay.getOid());
		return "verification-payment-page";
		
	}
	@RequestMapping("/successverified")
	String successverified(@RequestParam("OrderID") int theId)
	{
		orderDAO.changeOrder(theId,1);
		// code to generate pin string 
			
			String  p ="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			int ll = p.length();
			String x="";
			Random rand = new Random(); 
			for(int i=0;i<8;i++)
			{
				int temp = rand.nextInt(ll);
				x+=p.charAt(temp);
			}
			Pin thepin = new Pin();
			thepin.setOrderId(theId);
			thepin.setPin(x);
			pinDAO.savethepin(thepin);
		// code ends
		
		
		
		
		
		
		return "home";	
	}
	@RequestMapping("/deniedverified")
	String deniedverified(@RequestParam("OrderID") int theId)
	{
		orderDAO.deleteOrder(theId);
		return "home";	
	}
	
	@RequestMapping("/seeMidOrders")
	public String seeMidOrders(Model theModel)
	{
		List<Orders> theOrders = orderDAO.getOrdersWithStatus(1);
		theModel.addAttribute("ord",theOrders);
		return "admin-temp-orders";
	}
	
	@RequestMapping("/seeDoneOrders")
	public String seeDoneOrders(Model theModel)
	{
		List<Orders> theOrders = orderDAO.getOrdersWithStatus(2);
		theModel.addAttribute("ord",theOrders);
		return "admin-temp-orders";
	}
	@RequestMapping("/seeallstates")
	public String seeallstates(Model theModel)
	{
		List<States> theOrders = stateDAO.getAllStates();
		theModel.addAttribute("ord",theOrders);
		return "all-states-admin";
	}
	@RequestMapping("/addNewState")
	public String addNewState(Model theModel)
	{
		States theStates = new States();
		theModel.addAttribute("ord",theStates);
		return "add-state";
	}
	
	
	@RequestMapping("/proceedaddstate")
	public String proceedaddstate(@Valid @ModelAttribute("ord") States theState, 
			BindingResult theBindingResult, 
			Model theModel)
	{
		
		if (theBindingResult.hasErrors()) {
			States theStates = new States();
			theModel.addAttribute("ord",theStates);
			return "add-state";
		}
		else
		{
			
			if(stateDAO.getifstate(theState.getState()))
			{
				States theStates = new States();
				theModel.addAttribute("ord",theStates);
			
				theModel.addAttribute("exisits","State Already Exsists");
				return "add-state";
			}
			else
			{
				stateDAO.saveState(theState);
				return "home";
			}
			 
		}
		
	}
	
	
	
	@RequestMapping("/seereview")
	public String seereview(@RequestParam("productIdd") int theId,Model theModel)
	{
		List<ProductReview> thelists = reviewDAO.getallreviewbyid(theId);
		theModel.addAttribute("thelist",thelists);
		return "seereviewadmin";
	}
	
	
	
	@RequestMapping("/responsemessageb")
	public String responsemessageb(Model theModel)
	{
		List<MessageBuyer> thelist = messageBuyerDAO.getalllist();
		theModel.addAttribute("x",thelist);
		return "response-buyer";
	}
	
	@RequestMapping("/responsemessaget")
	public String responsemessaget(Model theModel)
	{
		List<MessageTransporter> thelist = messageTransporterDAO.getalllist();
		theModel.addAttribute("x",thelist);
		return "response-transporter";
	}
	@RequestMapping("/writebuyer")
	public String writebuyer(@RequestParam("productIdd") int theId,Model theModel)
	{
		MessageBuyer a = messageBuyerDAO.getbyId(theId);
		a.setStatus(1);
		theModel.addAttribute("x",a);
		return "form-write-buyer";
	}
	
	@RequestMapping("/buyerresponsedone")
	public String buyerresponsedone(@ModelAttribute("x") MessageBuyer m)
	{
		messageBuyerDAO.saveit(m);
		return "home";
	}
	
	@RequestMapping("/writetransporter")
	public String writetransporter(@RequestParam("productIdd") int theId,Model theModel)
	{
		MessageTransporter a = messageTransporterDAO.getbyId(theId);
		a.setStatus(1);
		theModel.addAttribute("x",a);
		return "form-write-transporter";
	}
	@RequestMapping("/transporterresponsedone")
	public String transporterresponsedone(@ModelAttribute("x") MessageTransporter m)
	{
		messageTransporterDAO.saveit(m);
		return "home";
	}
	@RequestMapping("/seeallbuyers")
	public String seeallbuyers(Model theModel)
	{
		List<Buyer>all = buyerDAO.getBuyers();
		theModel.addAttribute("m",all);
		return "all-buyer";
	}
	@RequestMapping("/seealltransporters")
	public String seealltransporters(Model theModel)
	{
		List<Transporter> all = transporterDAO.gettransporters();
		theModel.addAttribute("m",all);
		return "all-transporter";
	}
}
