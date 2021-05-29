package springmvc.api.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import springmvc.dto.BookDTO;
import springmvc.service.IBookService;
import springmvc.service.ICategoryService;

@RestController
@RequestMapping(value = "/web/api/search")
public class SearchAPI {
	@Autowired
	private ICategoryService iCategoryService;
	
	@Autowired
	private IBookService bookService;
	
	@PostMapping
	@ResponseBody
	public List<BookDTO> nameAutoComplete(@RequestParam("name") String name){
		ModelAndView mav = new ModelAndView("/web/bookdetails");
		List<BookDTO> listsName = bookService.findByName(name);
		Long id = null;
		for (BookDTO item : listsName) {
			 id = item.getId();
		}
		
		mav.addObject("bookId", id);
		
		return listsName;
	}
	@PostMapping("/issuingcompany")
	@ResponseBody
	public List<BookDTO> issuingcompanySearch(@RequestParam("issuingcompany") String issuingcompany){
		ModelAndView mav = new ModelAndView();
		List<BookDTO> lists = bookService.findByIssuingcompany(issuingcompany);
		
		return lists;
	}
}
