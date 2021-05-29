package springmvc.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.CartDTO;
import springmvc.service.ICartService;

@RestController
@RequestMapping(value = "/api")
public class CartAPI {

	@Autowired
	private ICartService cartService;

	@PostMapping("/carts/{id}")
	public CartDTO saveCart(@PathVariable Long id, CartDTO cartDTO) {
		return cartService.saveCart(id, cartDTO);

	}

}
