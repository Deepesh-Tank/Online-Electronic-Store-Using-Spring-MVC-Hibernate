package com.luv2code.springdemo.controller;


import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.dao.MessageTransporterDAO;
import com.luv2code.springdemo.dao.OrderDAO;
import com.luv2code.springdemo.dao.PinDAO;
import com.luv2code.springdemo.dao.StateDAO;
import com.luv2code.springdemo.entity.MessageBuyer;
import com.luv2code.springdemo.entity.MessageTransporter;
import com.luv2code.springdemo.entity.Orders;
import com.luv2code.springdemo.entity.Pin;
import com.luv2code.springdemo.entity.States;
import com.luv2code.springdemo.entity.Transporter;
import com.luv2code.springdemo.paramsobjects.PinObject;
import com.luv2code.springdemo.service.TransporterService;
import com.luv2code.springdemo.user.CrmUser;

@Controller
@RequestMapping("/transportation")
public class TransporationController {
	
	@Autowired
	private StateDAO stateDAO;
	
	@Autowired
	private UserDetailsManager userDetailsManager;
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private PinDAO pinDAO;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	private Logger logger = Logger.getLogger(getClass().getName());
	
	
	@Autowired
	private TransporterService transporterService;
	
	@Autowired
	private MessageTransporterDAO messageTransporterDAO;
	
	
	@RequestMapping("/seeActiveTransportationOrders")
	public String seeActiveTransportationOrders(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<Orders> theOrders = orderDAO.getOrdersWithStatusandtuser(1,userName);
		theModel.addAttribute("prot",theOrders);
		return "transport-active-orders";
	}
	
	@RequestMapping("/confirmit")
	public String confirmit(@RequestParam("productIdd") int theId,Model theModel)
	{
		
		/* new code*/
		PinObject the = new PinObject();
		the.setOrderId(theId);
		theModel.addAttribute("x",the);
		return "code-pin";
		
		/*end here*/
		/*orderDAO.changeOrder(theId,2);
		return "home";*/
	}
	
	@RequestMapping("/checkpin")
	public String checkpin(@ModelAttribute("x") PinObject theIds,Model theModel)
	{
		Pin actualpin = pinDAO.getorderbypin(theIds.getOrderId());
		//System.out.println(theIds.getPin().length());
		//System.out.println(actualpin.getPin().length());
		String a = theIds.getPin() ;
		String b = actualpin.getPin() ;
		//System.out.println(a);
		//System.out.println(b);
		
		if(a.length()!=b.length())
		{
			//System.out.println("NOT EQUAL");
			theModel.addAttribute("x",theIds);
			return "code-pin";
		}
		
		int c=0;
		for(int i=0;i<8;i++)
		{
			if(a.charAt(i)==b.charAt(i))
			{
				c++;
			}
		}
		if(c!=8)
		{
			//System.out.println("NOT EQUAL");
			//System.out.println(theIds.getOrderId());
			theModel.addAttribute("x",theIds);
			return "code-pin";
		}
		else
		{
			orderDAO.changeOrder(theIds.getOrderId(),2);
			pinDAO.deletebyorderid(theIds.getOrderId());
			return "home";
		}
		 
	}
	@RequestMapping("/seeAllTransportationOrders")
	public String seeAllTransportationOrders(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<Orders> theOrders = orderDAO.getOrdersWithStatusandtuser(2,userName);
		theModel.addAttribute("prot",theOrders);
		return "transport-done-orders";
	}
	
	@RequestMapping("/updateTransportationDetails")
	public String updateTransportationDetails(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		Transporter theTransporter = transporterService.getTransporter(userName);
		theModel.addAttribute("transport",theTransporter);
		List<States> theStates = stateDAO.getAllStates();
		theModel.addAttribute("statelist",theStates);
		return "Transportation-form";
	}
	
	@RequestMapping("/updateDetailsTransport")
	public String updateDetailsTransport(@Valid @ModelAttribute("transport") Transporter theTransporter, 
			BindingResult theBindingResult, 
			Model theModel)
	{
		if (theBindingResult.hasErrors()) {

			
			//theModel.addAttribute("registrationError", "User name/password can not be empty.");

			//logger.warning("User name/password can not be empty.");
			List<States> theStates = stateDAO.getAllStates();
			theModel.addAttribute("statelist",theStates);
			
			return "Transportation-form";
		}
		else
		{
			//System.out.println("THIS LINE IS EXECUTED  "+theTransporter.getState());
			if(theTransporter.getState()=="")
			{
				List<States> theStates = stateDAO.getAllStates();
				theModel.addAttribute("statelist",theStates);
				theModel.addAttribute("StateError", "State can not be empty.");
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				User user = (User)authentication.getPrincipal();
				System.out.println("THIS LINE IS EXECUTED NOW");
				String userName = user.getUsername();
				Transporter theTransporters = transporterService.getTransporter(userName);
				theModel.addAttribute("transport",theTransporters);
				return "Transportation-form";
			}
			transporterService.saveTransporter(theTransporter);
			return "home";
		}
		
	}
	
	@RequestMapping("/showRegistrationFormTransport")
	public String showRegistrationFormTransport(Model theModel)
	{
		theModel.addAttribute("crmUser", new CrmUser());
		
		return "registration-form-2";
	}
	
	
	
	
	
	@PostMapping("/processRegistrationFormTransport")
	public String processRegistrationForm(
				@Valid @ModelAttribute("crmUser") CrmUser theCrmUser, 
				BindingResult theBindingResult,
				Model theModel) {
						
		String userName = theCrmUser.getUserName();
		
		logger.info("Processing registration form for: " + userName);
		System.out.println(theBindingResult);
		// form validation
		if (theBindingResult.hasErrors()) {

			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name/password can not be empty.");

			logger.warning("User name/password can not be empty.");
			
			return "registration-form";	
		}
		String theCode = theCrmUser.getPassword();
		boolean result = true;
		if(theCode.length()<=7)
		{
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("lengtherror", "Password length must be greater > 7 ");

			logger.warning("Password length must be greater > 7 ");
			
			return "registration-form";	
		}
		boolean flag = true;
		for(int i=0;i< theCode.length();i++)
		{
			if(theCode.charAt(i)=='@'||theCode.charAt(i)=='!'||theCode.charAt(i)=='$'||theCode.charAt(i)=='#')
			{
				flag = false;
			}
		}
		if(flag==true)
		{
			result= false;
		}
		flag=true;
		for(int i=0;i< theCode.length();i++)
		{
			if(theCode.charAt(i)>=97&&theCode.charAt(i)<=122)
			{
				flag = false;
			}
		}
		if(flag==true)
		{
			result= false;
		}
		flag=true;
		for(int i=0;i< theCode.length();i++)
		{
			if(theCode.charAt(i)>=65&&theCode.charAt(i)<=90)
			{
				flag = false;
			}
		}
		if(flag==true)
		{
			result= false;
		}
		flag=true;
		for(int i=0;i< theCode.length();i++)
		{
			if(theCode.charAt(i)>=48&&theCode.charAt(i)<=57)
			{
				flag = false;
			}
		}
		if(flag==true)
		{
			result= false;
		}
		if(result==false)
		{
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("charactererror", "Must Contain at least one special character(! @ # $) , one Uppercase alphabet , one Lowercase alphabet and one numerical value");

			logger.warning("Must Contain at least one special character(! @ # $) , one Uppercase alphabet , one Lowercase alphabet and one numerical value");
			
			return "registration-form-2";	
		}
		
		// check the database if user already exists
		boolean userExists = doesUserExist(userName);
		
		if (userExists) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");
			
			return "registration-form-2";			
		}
		
		//
		// whew ... we passed all of the validation checks!
		// let's get down to business!!!
		//
		
		// encrypt the password
        String encodedPassword = passwordEncoder.encode(theCrmUser.getPassword());

        // prepend the encoding algorithm id
        encodedPassword = "{bcrypt}" + encodedPassword;
                 
		// give user default role of "employee"
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_TRANSPORT");

        // create user object (from Spring Security framework)
        User tempUser = new User(userName, encodedPassword, authorities);

        // save user in the database
        userDetailsManager.createUser(tempUser);	
        Transporter theBuyer = new Transporter();
        theBuyer.setUserName(userName);
        theBuyer.setAddress(" ");
        
        transporterService.saveTransporter(theBuyer);
        logger.info("Successfully created user: " + userName);
        
        return "fancy-login";		
	}
	
	private boolean doesUserExist(String userName) {
		
		logger.info("Checking if user exists: " + userName);
		
		// check the database if the user already exists
		boolean exists = userDetailsManager.userExists(userName);
		
		logger.info("User: " + userName + ", exists: " + exists);
		
		return exists;
	}
	
	
	@RequestMapping("/messageinsert")
	public String messageinsert(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		MessageTransporter n = new MessageTransporter();
		n.setTuser(userName);
		long millis=System.currentTimeMillis();  
		java.sql.Date dated =new java.sql.Date(millis);  
		n.setDate(dated);
		n.setStatus(0);
		theModel.addAttribute("x",n);
		return "support-transporter";
	}
	
	@RequestMapping("/inserting")
	public String inserting(@ModelAttribute("x") MessageTransporter temp,Model theModel)
	{
		messageTransporterDAO.saveit(temp);
		return "home";
		
	}
	@RequestMapping("/seeresponseadmin")
	public String seeresponseadmin(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		List<MessageTransporter> a = messageTransporterDAO.getlistbystatusanduser(1,userName);
		theModel.addAttribute("x",a);
		return "r-t";	
	}
}
