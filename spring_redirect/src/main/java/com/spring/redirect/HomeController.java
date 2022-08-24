package com.spring.redirect;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value="/redirect")
	public String redirect(HttpServletRequest request, RedirectAttributes rttr) {
		String url  = "redirect:/target";
		
		rttr.addAttribute("data", request.getParameter("data"));
		
		rttr.addFlashAttribute("data", 1234);
		
		return url;
	}
	
	@RequestMapping(value="/target")
	public String target(HttpServletRequest request, Model model) {
		String url = "final";
		
		return url;
	}
	
}
