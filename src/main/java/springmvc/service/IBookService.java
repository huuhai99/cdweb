package springmvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import springmvc.dto.BookDTO;
import springmvc.entity.BookEntity;

public interface IBookService {
	public List<BookDTO> findAll();
	public BookDTO updateBook(BookDTO bookDTO);
	public BookDTO saveBook(BookDTO bookDTO);
	public BookDTO findById(Long id);
	public void deleteBooks(Long[] ids);
	public List<BookDTO> showBookByCategory(Long id , Pageable pageable);
	public List<BookDTO> findAllPage(Pageable pageable);
	public int getTotalItem();
	public List<BookDTO> findAllOrderByPriceASC();
	public List<BookDTO> findAllOrderByPriceDESC();
	public List<BookDTO> findByNameAndCategoryAndPage(String name , String categoryName , Pageable pageable);
	public List<BookDTO> findByName(String name);
	public List<BookDTO> findByIssuingcompany(String issuingcompany);
}
