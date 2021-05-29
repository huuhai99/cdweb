package springmvc.service;

import springmvc.dto.CartDTO;

public interface ICartService {

	public CartDTO saveCart(Long id,CartDTO cartDTO);
	public CartDTO showCartByUser(Long id);
}
