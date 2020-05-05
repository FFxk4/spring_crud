package proselyte.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import proselyte.model.Book;
import proselyte.service.BookService;

@Controller
public class BookController
{
	private BookService bookService;

	@RequestMapping("/books")
	public String listBooks(Model model)
	{
		model.addAttribute("book", new Book());
		model.addAttribute("listBooks", bookService.listBooks());

		return "books";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book)
	{
		if(book.getId() == 0)
		{
			bookService.addBook(book);
		}
		else bookService.updateBook(book);

		return "redirect:/books";
	}

	@RequestMapping("/remove/{id}")
	public String removeBook(@PathVariable("id") int id)
	{
		bookService.removeBook(id);
		return "redirect:/books";
	}

	@RequestMapping("edit/{id}")
	public String editBook(@PathVariable("id") int id, Model model)
	{
		model.addAttribute("book", bookService.getBookById(id));
		model.addAttribute("listBooks", bookService.listBooks());

		return "books";
	}

	@RequestMapping("/bookdata/{id}")
	public String bookData(@PathVariable("id") int id, Model model)
	{
		model.addAttribute("book", bookService.getBookById(id));

		return "bookdata";
	}

	@Autowired
	public void setBookService(BookService bookService)
	{
		this.bookService = bookService;
	}
}
