package com.luv2code.springdemo.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luv2code.springdemo.entity.Buyer;
import com.luv2code.springdemo.entity.Transporter;
import com.luv2code.springdemo.service.BuyerService;
import com.luv2code.springdemo.service.TransporterService;
import com.luv2code.springdemo.user.CrmUser;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	
	@Autowired
	private UserDetailsManager userDetailsManager;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	private Logger logger = Logger.getLogger(getClass().getName());
	
	@Autowired
	private BuyerService buyerService;
	
	@Autowired
	private TransporterService transporterService;
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}	
	
	@RequestMapping("/beginFinalRegistrationProcess")
	public String beginFinalRegistrationProcess(Model theModel)
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		String userName = user.getUsername();
		Buyer theBuyer = buyerService.getBuyer(userName);
		theModel.addAttribute("buyers",theBuyer);
		List<Transporter> theTransporter = transporterService.getdistincttransporter();
		theModel.addAttribute("list",theTransporter);
		return "Complete-Registration";
	}
	@RequestMapping("/finalProcessRegistration")
	public String finalProcessRegistration(@Valid @ModelAttribute("buyers") Buyer theBuyer, 
				BindingResult theBindingResult, 
				Model theModel)
	{
		if (theBindingResult.hasErrors()) {

			
			//theModel.addAttribute("registrationError", "User name/password can not be empty.");

			//logger.warning("User name/password can not be empty.");
			List<Transporter> theTransporter = transporterService.getdistincttransporter();
			theModel.addAttribute("list",theTransporter);
			return "Complete-Registration";	
		}
		else
		{
			
			buyerService.saveBuyer(theBuyer);
			
			return "home";
		}
		
	}
	
	@GetMapping("/showRegistrationForm")
	public String showMyLoginPage(Model theModel) {
		
		theModel.addAttribute("crmUser", new CrmUser());
		
		return "registration-form";
		
	}

	@PostMapping("/processRegistrationForm")
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
			
			return "registration-form";	
		}
		
		// check the database if user already exists
		boolean userExists = doesUserExist(userName);
		
		if (userExists) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");
			
			return "registration-form";			
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
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_BUYER");

        // create user object (from Spring Security framework)
        User tempUser = new User(userName, encodedPassword, authorities);

        // save user in the database
        userDetailsManager.createUser(tempUser);	
        
        Buyer theBuyer = new Buyer();
        theBuyer.setId(userName);
         
        buyerService.saveBuyer(theBuyer);
        
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

}
