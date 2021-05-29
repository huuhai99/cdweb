package springmvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.entity.CartEntity;

public interface CartRepository extends JpaRepository<CartEntity, Long>{

}
