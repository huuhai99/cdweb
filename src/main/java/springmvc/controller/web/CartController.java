package springmvc.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.service.ICartService;
import springmvc.service.IUserService;

@Controller(value = "cartControllerOfWeb")
@RequestMapping(value = "/web")
public class CartController {
	
	@Autowired
	private ICartService cartService;
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("/web/cart");
		return mav;
	}	
//	@RequestMapping(value ="/addCart/{id}" , method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView addCart(@PathVariable long id, HttpServletRequest request) {
//		System.out.println(request.getRequestURL().toString());
//		ModelAndView mav = new ModelAndView("/web/home");
//		Long userId = SecurityUtils.getPrincipal().getId();
//		//tim book
//		//set book vao cart
//		// tim user
//		// set user vao cart
//		// luu cart
//		if(userId == null) {
//			mav.addObject("message", "Chua dang nhap");
//			
//		}else {
//			CartDTO cartDTO = new CartDTO();
//			cartDTO.setUserId(userId);
//			cartService.saveCart(id, cartDTO);
//			
//		}
//		return mav;
//	}

}
