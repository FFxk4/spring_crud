package proselyte.service;

import proselyte.dao.BookDao;
import proselyte.model.Book;

import java.util.List;
import javax.transaction.Transactional;

public class BookServiceImpl implements BookService
{

	private BookDao bookDao;

	@Override
	@Transactional
	public void addBook(Book book)
	{
		bookDao.addBook(book);
	}

	@Override
	@Transactional
	public void updateBook(Book book)
	{
		bookDao.updateBook(book);
	}

	@Override
	@Transactional
	public void removeBook(int id)
	{
		bookDao.removeBook(id);
	}

	@Override
	@Transactional
	public Book getBookById(int id)
	{
		return bookDao.getBookById(id);
	}

	@Override
	@Transactional
	public List<Book> listBooks()
	{
		return bookDao.listBooks();
	}

	public void setBookDao(BookDao bookDao)
	{
		this.bookDao = bookDao;
	}
}
