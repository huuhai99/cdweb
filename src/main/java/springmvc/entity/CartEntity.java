package springmvc.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class CartEntity extends BaseEntity {

	@Column(name = "name")
	private String name;
	
	@Column(name = "image")
	private String image;
	
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "totalprice")
	private double totalPrice;
	
	@Column(name ="totalamount")
	private double totalAmount;
	
	@Column(name = "amount")
	private Integer amount;
	
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "cartEntity")
	private List<BookEntity> bookEntities = new ArrayList<>();

	
	@OneToOne
    @JoinColumn(name = "userid", referencedColumnName = "id")
    private UserEntity userEntity;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public List<BookEntity> getBookEntities() {
		return bookEntities;
	}

	public void setBookEntities(List<BookEntity> bookEntities) {
		this.bookEntities = bookEntities;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	
	
	
	
}
