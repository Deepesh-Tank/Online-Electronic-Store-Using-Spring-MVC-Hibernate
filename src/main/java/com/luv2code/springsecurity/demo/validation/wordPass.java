package com.luv2code.springsecurity.demo.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;

import javax.validation.Constraint;
import javax.validation.Payload;



@Constraint(validatedBy = PasswordConstraintValidator.class)
@Target({ElementType.METHOD,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface wordPass {
		//default error message
		public String message() default "not in required format : Must be of Length > 7 And contain special character ! @ # $ and atleast one uppercase and lowercase alphabet";
		//default groups
		public Class<?>[] groups() default {};
		//default payloads
		public Class<? extends Payload>[] payload() default {};
}
