package springmvc.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springmvc.Utils.SecurityUtils;
import springmvc.dto.BookDTO;
import springmvc.dto.CategoryDTO;
import springmvc.dto.MyUser;
import springmvc.service.IBookService;
import springmvc.service.ICategoryService;

@Controller(value = "productControllerOfWeb")
@RequestMapping(value = "/web")
public class BookController {
	
	@Autowired
	private ICategoryService iCategoryService;
	
	@Autowired
	private IBookService bookService;
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView productsPage(@RequestParam("page") int page, @RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("/web/books");
		
		Pageable pageable = new PageRequest(page-1, limit);
		int totalPages= (int) Math.ceil((double) bookService.getTotalItem() / limit);
		mav.addObject("totalPages", totalPages);
		int currentPage = page;
		mav.addObject("currentPage", currentPage);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listDTO = bookService.findAllPage(pageable);
		
		MyUser myUser = SecurityUtils.getPrincipal();
		Long id ;
		if (myUser == null) {
			id = null;
		}else {
			id = myUser.getId();
		}
		mav.addObject("userId", id);
		mav.addObject("categorys", lists);
		mav.addObject("books", listDTO);
		return mav;
	}
	
	@RequestMapping(value = "/product/{id}" , method = RequestMethod.GET)
	public ModelAndView productDetailsPage(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("/web/bookdetails");
		
		BookDTO bookDTO  =bookService.findById(id);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		
        MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		
		mav.addObject("userId", idUser);
		mav.addObject("categorys", lists);
        mav.addObject("bookId", bookDTO);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public ModelAndView showCategorys() {
		ModelAndView mav = new ModelAndView("/web/books");
		
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listDTO = bookService.findAll();
		MyUser myUser = SecurityUtils.getPrincipal();
		Long id ;
		if (myUser == null) {
			id = null;
		}else {
			id = myUser.getId();
		}
		mav.addObject("userId", id);
		mav.addObject("categorys", lists);
		mav.addObject("books", listDTO);
		
		return mav;

	}
	@RequestMapping(value="/category/{id}" , method = RequestMethod.GET)
	public ModelAndView showBookByCategory(@PathVariable Long id , @RequestParam("page") int page, @RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("/web/category");
		
		Pageable pageable = new PageRequest(page-1, limit);
		int totalPages= (int) Math.ceil((double) bookService.getTotalItem() / limit);
		mav.addObject("totalPages", totalPages);
		int currentPage = page;
		mav.addObject("currentPage", currentPage);
		mav.addObject("idCategory", id);
		
		List<BookDTO> listDTO = bookService.showBookByCategory(id , pageable);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		
		if(listDTO.size() == 0) {
			mav.addObject("message", "Sản phẩm hiện tại đã hết");
		}else {
		mav.addObject("books", listDTO);
		}
		mav.addObject("categorys", lists);
		
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser ;
		if (myUser == null) {
			idUser = null;
		}else {
			idUser = myUser.getId();
		}
		mav.addObject("userId", idUser);
		return mav;
	}
	

}
