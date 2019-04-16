package com.nsa.evolve.constraint;

import org.passay.*;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.Arrays;

public class PasswordConstraintValidator implements ConstraintValidator<ValidPassword, String> {

    @Override
    public void initialize(ValidPassword arg0) {
    }

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        PasswordValidator validator = new PasswordValidator(Arrays.asList(
                new LengthRule(10, 127),
                new UppercaseCharacterRule(1),
                new DigitCharacterRule(1),
                new LowercaseCharacterRule(1)));


        RuleResult result = validator.validate(new PasswordData(password));
        if (result.isValid()) {
            return true;
        }
        context.disableDefaultConstraintViolation();
        context.buildConstraintViolationWithTemplate("Your password must have: " +
                "  At least 10 characters, " +
                "  At least 1 lower case letter, " +
                "  At least 1 upper case letter, " +
                "  At least 1 digit")
                .addConstraintViolation();
        return false;
    }
}


