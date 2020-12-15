package com.luv2code.springsecurity.demo.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = EmailConstraintValidator.class)
@Target({ElementType.METHOD,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface validEmail {
	//default error message
			public String message() default "*invalid email format";
			//default groups
			public Class<?>[] groups() default {};
			//default payloads
			public Class<? extends Payload>[] payload() default {};
}
