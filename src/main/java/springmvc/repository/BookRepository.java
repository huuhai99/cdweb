package springmvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import springmvc.entity.BookEntity;

@Repository
public interface BookRepository extends JpaRepository<BookEntity, Long> {

	@Query(value = "SELECT e.* FROM book e ORDER BY e.price asc LIMIT 7" , nativeQuery = true)
	public List<BookEntity> findAllOrderByPriceASC();
	
	@Query(value = "SELECT e.* FROM book e ORDER BY e.price desc LIMIT 7" , nativeQuery = true)
	public List<BookEntity> findAllOrderByPriceDESC();
	
	@Query(value="SELECT b.* FROM book b , category c where b.name LIKE %?1% AND c.name LIKE %?2% ORDER BY ?#{#pageable} ",nativeQuery = true )
	List<BookEntity> findByNameAndCategoryAndPage(String name , String categoryName, Pageable pageable);
	
	@Query(value="SELECT b.* FROM book b  where b.name LIKE %?1%" ,nativeQuery = true )
	List<BookEntity> findByName(String name);
	
	@Query(value="SELECT * FROM book where issuingcompany=?1" ,nativeQuery = true)
	List<BookEntity> findByIssuingcompany(String issuingcompany);
	
}
