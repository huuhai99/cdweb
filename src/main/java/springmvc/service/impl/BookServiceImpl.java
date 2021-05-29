package springmvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import springmvc.converter.BookConverter;
import springmvc.dto.BookDTO;
import springmvc.entity.BookEntity;
import springmvc.entity.CategoryEntity;
import springmvc.repository.BookRepository;
import springmvc.repository.CategoryRepository;
import springmvc.service.IBookService;

@Service
public class BookServiceImpl implements IBookService {
		@Autowired
		private BookRepository bookRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	private BookConverter bookConverter = new BookConverter();

	@Override
	public List<BookDTO> findAll() {
		List<BookEntity> listBooks = bookRepository.findAll();
		List<BookDTO> dtos = new ArrayList<>();
		for (BookEntity item : listBooks) {
			CategoryEntity categoryEntity = item.getCategory();
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setCategoryName(categoryEntity.getName());
			dtos.add(bookDTO);
		}
		return dtos;
	}

	@Override
	@Transactional
	public BookDTO updateBook(BookDTO bookDTO) {
		BookEntity bookEntity = bookRepository.findOne(bookDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<BookDTO, BookEntity>() {
			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
			}
		});
		modelMapper.map(bookDTO, bookEntity);
		return bookConverter.converterToDTO(bookRepository.save(bookEntity));
	}

	@Override
	@Transactional
	public BookDTO saveBook(BookDTO bookDTO) {
		BookEntity entity = bookConverter.converterToEntity(bookDTO);
		if (bookDTO.getCategoryId() != null) {
			CategoryEntity categoryEntity = categoryRepository.findOne(bookDTO.getCategoryId());
			entity.setCategory(categoryEntity);
		}
		BookEntity bookEntity = bookRepository.save(entity);
		return bookConverter.converterToDTO(bookEntity);
	}
	@Override
	public BookDTO findById(Long id) {
		return bookConverter.converterToDTO(bookRepository.findOne(id));
	}

	@Override
	@Transactional
	public void deleteBooks(Long[] ids) {
		for (Long item : ids) {
			bookRepository.delete(item);
		}
		
	}

	@Override
	public List<BookDTO> showBookByCategory(Long id ,Pageable pageable) {
		CategoryEntity categoryEntity = categoryRepository.findOne(id);
		List<BookEntity> listBooks = bookRepository.findAll(pageable).getContent();
		List<BookDTO> dtos = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			if(bookDTO.getCategoryId() == categoryEntity.getId()) {
				dtos.add(bookDTO);
			}			
		}
		return dtos;
	}

	@Override
	public List<BookDTO> findAllPage(Pageable pageable) {
		List<BookEntity> listBooks = bookRepository.findAll(pageable).getContent();
		List<BookDTO> dtos = new ArrayList<>();
		for (BookEntity item : listBooks) {
			CategoryEntity categoryEntity = item.getCategory();
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setCategoryName(categoryEntity.getName());
			dtos.add(bookDTO);
		}
		return dtos;
	}

	@Override
	public int  getTotalItem() {
		return (int) bookRepository.count();
	}

	@Override
	public List<BookDTO> findAllOrderByPriceASC() {
		List<BookEntity> listBooks = bookRepository.findAllOrderByPriceASC();
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	public List<BookDTO> findAllOrderByPriceDESC() {
		List<BookEntity> listBooks = bookRepository.findAllOrderByPriceDESC();
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	@Transactional
	public List<BookDTO> findByNameAndCategoryAndPage(String name , String categoryName, Pageable pageable) {
		List<BookEntity> listBooks = bookRepository.findByNameAndCategoryAndPage(name , categoryName , pageable);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	@Transactional
	public List<BookDTO> findByName(String name) {
		List<BookEntity> listBooks = bookRepository.findByName(name);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	@Transactional
	public List<BookDTO> findByIssuingcompany(String issuingcompany) {
		List<BookEntity> listBooks = bookRepository.findByIssuingcompany(issuingcompany);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

}
