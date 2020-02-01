package com.dev.shop.model.product.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {

	private int product_id;
	private int category;
	private String product_name;
	private int price;
	private String description;
	private String picture_url;
	private int brand;
	private MultipartFile file1;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", category=" + category + ", product_name=" + product_name
				+ ", price=" + price + ", description=" + description + ", picture_url=" + picture_url + ", brand="
				+ brand + ", file1=" + file1 + "]";
	}
	
	
}
