package com.luv2code.springsecurity.demo.validation;



import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class UserAlreadyExsistConstraintValidator implements ConstraintValidator<validEmail,String> {
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
			return false;
	}

}
