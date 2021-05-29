package springmvc.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
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

@Controller
@RequestMapping(value = "/web")
public class SearchController {

	@Autowired
	private ICategoryService iCategoryService;
	
	@Autowired
	private IBookService bookService;
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView productsPage(
			@RequestParam("name") String name , 
			@RequestParam("categoryName") String categoryName,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "limit", required = false, defaultValue = "4") int limit) {
		ModelAndView mav = new ModelAndView("/web/search");
		
		
		Pageable pageable = new PageRequest(page-1, limit);
		int totalPages= (int) Math.ceil((double) bookService.getTotalItem() / limit);
		mav.addObject("totalPages", totalPages);
		int currentPage = page;
		mav.addObject("currentPage", currentPage);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listDTO = bookService.findAllPage(pageable);
		
		List<BookDTO> listsSearch = bookService.findByNameAndCategoryAndPage(name , categoryName , pageable);
		
		if(listsSearch.size() == 0) {
			mav.addObject("message", "Sản phẩm hiện tại đã hết");
			
		}else {
			mav.addObject("listsSearch", listsSearch);
		}
		
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
}
