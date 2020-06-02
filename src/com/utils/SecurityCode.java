package com.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpSession;

public class SecurityCode {
	public static ByteArrayInputStream getSecurityCode(HttpSession session){
		int width = 100;
		int height = 30;
		
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		Color color = g.getColor();
		
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		
		StringBuilder sb = new StringBuilder();
		
		for(char c = 'A';c <= 'Z';c++){
			if(c != 'O' && c != 'I'){
				sb.append(c+",");
			}
			
		}
		
		for(char c = 'a';c <= 'z';c++){
			if(c != 'o' && c != 'l' ){
				sb.append(c+",");
			}
			
		}
		
		for(int i = 2;i < 10;i++){
			if(i == 9){
				sb.append(i);
			}else{
				sb.append(i+",");
			}
		}
		
		String[] s = sb.toString().split(",");

		StringBuilder temp = new StringBuilder();
		
		for(int i = 0;i < 4;i++){
			int index = new Random().nextInt(100)%s.length;
			
			temp.append(s[index]);
			g.setColor(new Color(new Random().nextFloat(), new Random().nextFloat(), new Random().nextFloat()));
			g.setFont(new Font("宋体", Font.BOLD, 25));
			g.drawString(s[index], i*25, 25);
		}

		for( int i = 0;i < 6;i++ ){
			g.setColor(new Color(new Random().nextFloat(), new Random().nextFloat(), new Random().nextFloat()));
			g.drawLine(new Random().nextInt(width), new Random().nextInt(height), new Random().nextInt(width), new Random().nextInt(height));
		}
		
		g.setColor(color);
		
		session.setAttribute("temp", temp.toString());
		
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ByteArrayInputStream inputStream = null;
		
		try {
			ImageOutputStream imageOutputStream = ImageIO.createImageOutputStream(output);
			ImageIO.write(image, "jpeg", imageOutputStream);
			imageOutputStream.close();
			inputStream = new ByteArrayInputStream(output.toByteArray());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return inputStream;
	}
}
