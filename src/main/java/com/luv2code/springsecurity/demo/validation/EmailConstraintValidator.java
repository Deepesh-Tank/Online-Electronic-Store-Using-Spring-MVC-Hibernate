package com.luv2code.springsecurity.demo.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class EmailConstraintValidator implements ConstraintValidator<validEmail,String> {

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(value==null)
		{
			return true;
		}
		int f = 0 ;
		int s = 0;
		for(int i=0;i<value.length();i++)
		{
			if(s==0&&value.charAt(i)=='@')
			{
				f++;
				s=1;
			}
			else if(s==1)
			{
				s++;
			}
			else if(s==2&&value.charAt(i)=='.')
			{
				s++;
				f++;
			}
		}
		if(f==2)
			return true;
		else
			return false;
	}
	

}
