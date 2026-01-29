package com.demo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Book;
import com.demo.service.BookService;

@Controller
public class UpdateBookController {
	
	@Autowired
	private BookService bs;
	
	@GetMapping(value = "/updateBook")
	public ModelAndView m6(ModelAndView m) {
		m.setViewName("updateBook");
		return m;
	}
	
	@PostMapping("/updateBook/req")
	public ModelAndView updateBook(ModelAndView m,int id,String name,String category, String description,Double price,
	        MultipartFile image) throws IOException {
		System.out.println(description);

	    Book b = new Book();
	    b.setId(id);
	    b.setName(name);
	    b.setCategory(category);
	    b.setDescription(description);

	    if (price != null) {
	        b.setPrice(price);
	    } else {
	        b.setPrice(bs.findById(id).getPrice()); // keep old price
	    }

	    if (image == null || image.getSize() == 0) {
	        b.setImage(bs.findImageById(id));
	    } else {
	        b.setImage(image.getBytes());
	    }

	    Book b1 = bs.save(b);
	    m.addObject("msg", b1 != null ? "Book updated successfully" : "Book not updated");
	    m.setViewName("index");
	    return m;
	}
}
