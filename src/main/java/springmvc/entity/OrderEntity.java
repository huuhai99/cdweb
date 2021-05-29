package springmvc.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name ="orders")
public class OrderEntity extends BaseEntity{

	@Column(name = "amount")
	private Long amount;

	@Column(name = "name")
	private String name ;
	
	@Column(name = "productname")
	private String productName ;
	
	@Column(name = "address")
	private String address;
	
	@Column(name ="email")
	private String email;
	
	@Column(name ="totalprice")
	private double totalPrice;
	
	@Column(name ="totalamount")
	private double totalAmount;
	
	@Column(name = "phonenumber")
	private String phoneNumber;
	// trang thái
	@ManyToMany(mappedBy = "orderEntities")
	private List<BookEntity> bookEntities  = new ArrayList<>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usersid")
	private UserEntity user;

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	
	

	
	
	
	
}
