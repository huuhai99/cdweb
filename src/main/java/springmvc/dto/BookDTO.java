package springmvc.dto;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class BookDTO extends AbstractDTO {

	@NotNull(message = "Khong duoc de trong")
	@NotBlank(message = "Khong duoc de trong")
	private String name;

	private double price;

	private Date productionDay;
	private String issuingCompany;
	private String size;
	private String coverType;
	private Long numberOfPages;
	private String sku;
	private String productDescription;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private MultipartFile profileImage1;
	private MultipartFile profileImage2;
	private String status;
	private Long categoryId;
	private String categoryName;
	

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String path;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getProductionDay() {
		return productionDay;
	}

	public void setProductionDay(Date productionDay) {
		this.productionDay = productionDay;
	}

	public String getIssuingCompany() {
		return issuingCompany;
	}

	public void setIssuingCompany(String issuingCompany) {
		this.issuingCompany = issuingCompany;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getCoverType() {
		return coverType;
	}

	public void setCoverType(String coverType) {
		this.coverType = coverType;
	}

	public Long getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(Long numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public MultipartFile getProfileImage2() {
		return profileImage2;
	}

	public void setProfileImage2(MultipartFile profileImage2) {
		this.profileImage2 = profileImage2;
	}

	public MultipartFile getProfileImage1() {
		return profileImage1;
	}

	public void setProfileImage1(MultipartFile profileImage1) {
		this.profileImage1 = profileImage1;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "BookDTO [name=" + name + ", price=" + price + ", productionDay=" + productionDay + ", issuingCompany="
				+ issuingCompany + ", size=" + size + ", coverType=" + coverType + ", numberOfPages=" + numberOfPages
				+ ", sku=" + sku + ", productDescription=" + productDescription + ", img1=" + img1 + ", img2=" + img2
				+ ", img3=" + img3 + ", img4=" + img4 + ", profileImage1=" + profileImage1 + ", profileImage2="
				+ profileImage2 + ", status=" + status + ", categoryId=" + categoryId + ", categoryName=" + categoryName
				+ ", path=" + path + "]";
	}

	
}
