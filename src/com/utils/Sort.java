package com.utils;

import java.util.Comparator;

import com.domain.Product;

public class Sort implements Comparator<Product> {
	@Override
	public int compare(Product p1, Product p2) {
		return p1.getProductId().compareTo(p2.getProductId());
	}
}
