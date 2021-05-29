package springmvc.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Utils.SecurityUtils;
import springmvc.converter.CartConverter;
import springmvc.dto.CartDTO;
import springmvc.entity.BookEntity;
import springmvc.entity.CartEntity;
import springmvc.entity.UserEntity;
import springmvc.repository.BookRepository;
import springmvc.repository.CartRepository;
import springmvc.repository.UserRepository;
import springmvc.service.ICartService;

@Service
public class CartServiceImpl implements ICartService {
	
	@Autowired
	private BookRepository bookRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartRepository cartRepositpry;
	
	private CartConverter cartConverter = new CartConverter();

	@Override
	@Transactional
	public CartDTO saveCart(Long id ,CartDTO cartDTO) {
		CartEntity cartEntity = cartConverter.converterToEntity(cartDTO);
		BookEntity bookEntity = bookRepository.findOne(id);
		Long idUser =  SecurityUtils.getPrincipal().getId();
		UserEntity userEntity = userRepository.findOne(idUser);
		if(bookEntity != null) {
			cartEntity.setName(bookEntity.getName());
			cartEntity.setAmount(cartDTO.getAmount());
			cartEntity.setPrice(bookEntity.getPrice());
			cartEntity.setUserEntity(userEntity);
		}
		CartEntity entity = cartRepositpry.save(cartEntity);
		return cartConverter.converterToDTO(entity);
	}

	@Override
	public CartDTO showCartByUser(Long id) {
		List<CartEntity> listCart = cartRepositpry.findAll();
		
		return null;
	}

}
