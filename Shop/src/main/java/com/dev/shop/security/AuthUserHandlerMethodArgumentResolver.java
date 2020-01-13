package com.dev.shop.security;

import org.springframework.core.MethodParameter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class AuthUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

    @Override
    public Object resolveArgument(
        MethodParameter parameter, 
        ModelAndViewContainer mavContainer,
        NativeWebRequest webRequest, 
        WebDataBinderFactory binderFactory) throws Exception {

        Object principal = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null ) {
            principal = authentication.getPrincipal();
        }

        if(principal == null || principal.getClass() == String .class) {
            return null;
        }

        return principal;
    }

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        AuthUser authUser = parameter.getParameterAnnotation(AuthUser.class);
        if(authUser==null) {
            return false;
        }

        if(parameter.getParameterType().equals(SecurityUser.class)==false) { 
            return false;
        }
        
        return true;
    }
}
