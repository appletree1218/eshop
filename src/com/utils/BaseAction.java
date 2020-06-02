package com.utils;

import java.lang.reflect.ParameterizedType;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	public static final String LIST = "list";
	public static final String ADD = "add";
	public static final String UPDATE = "update";
	public static final String DELETE = "delete";
	public static final String ACTION2ACTION = "action2action";
	
	private Class clazz;
	private T t;
	
	public T getModel() {
		return this.t;
	}
	
	public BaseAction() {
		try {
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			this.clazz = (Class) type.getActualTypeArguments()[0];
			this.t = (T) this.clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}
}
