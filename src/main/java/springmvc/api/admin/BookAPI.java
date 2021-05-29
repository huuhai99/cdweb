package springmvc.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.BookDTO;
import springmvc.service.IBookService;

@RestController
@RequestMapping(value = "/api/book")
public class BookAPI {

	@Autowired
	private IBookService bookService;

	@PostMapping
	public BookDTO saveBook( @RequestBody BookDTO bookDTO) {
		return bookService.saveBook(bookDTO);
	}
	
	@PutMapping
	public BookDTO updateBook(@RequestBody BookDTO bookDTO) {
		return bookService.updateBook(bookDTO);
	}
	
	@DeleteMapping
	public void deleteBook(@RequestBody BookDTO bookDTO) {
		 bookService.deleteBooks(bookDTO.getIds());
	}
	
	@RequestMapping(value = "/find/{id}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<BookDTO> find(@PathVariable("id") Long id) {
		try {
			return new ResponseEntity<BookDTO>(bookService.findById(id), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<BookDTO>(HttpStatus.BAD_REQUEST);
		}
	}

}
