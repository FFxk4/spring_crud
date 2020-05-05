package proselyte.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import proselyte.model.Book;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao
{
	private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

	private SessionFactory sessionFactory;

	@Override
	public void addBook(Book book)
	{
		Session session = sessionFactory.getCurrentSession();
		session.persist(book);
		logger.info("Book saved: " + book);
	}

	@Override
	public void updateBook(Book book)
	{
		Session session = sessionFactory.getCurrentSession();
		session.update(book);
		logger.info("Book updated: " + book);
	}

	@Override
	public void removeBook(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Book book = session.load(Book.class, id);
		if (book != null)
		{
			session.delete(book);

		}
		logger.info("Book deleted: " + book);
	}

	@Override
	public Book getBookById(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Book book = session.load(Book.class, id);
		logger.info("Book loaded: " + book);
		return book;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Book> listBooks()
	{

		Session session = sessionFactory.getCurrentSession();
		List<Book> books = session.createQuery("from Book").list();
		for (Book book : books)
		{
			logger.info("Book list: " + book);
		}
		return books;
	}

	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
}
