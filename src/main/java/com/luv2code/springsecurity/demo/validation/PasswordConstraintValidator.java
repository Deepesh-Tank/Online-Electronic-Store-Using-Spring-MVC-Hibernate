package com.luv2code.springsecurity.demo.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordConstraintValidator implements ConstraintValidator<wordPass,String> {

	@Override
	public boolean isValid(String theCode, ConstraintValidatorContext theConstraintValidatorContext) {
		// TODO Auto-generated method stub
		boolean result = true;
		if(theCode.length()<=7)
		{
			result = false;
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
		return result;
	}
	
}
