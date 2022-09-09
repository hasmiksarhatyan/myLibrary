package servlet;

import lombok.SneakyThrows;
import manager.AuthorManager;
import manager.BookManager;
import model.Book;
import model.Author;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/books/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddBookServlet extends HttpServlet {
    private AuthorManager authorManager = new AuthorManager();
    private BookManager bookManager = new BookManager();
    private static final String IMAGE_PATH = "C:\\Users\\User\\IdeaProjects\\myLibrary\\projectimages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<Author> all = authorManager.getAll();
            req.setAttribute("authors", all);
            req.getRequestDispatcher("/WEB-INF/addBook.jsp").forward(req, resp);
        }

    @SneakyThrows
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        int authorId = Integer.parseInt(req.getParameter("authorId"));
        Double price = Double.parseDouble(req.getParameter("price"));
        Part picPart = req.getPart("image");
        String fileName = null;
        if (picPart.getSize() != 0) {
            long nanoTime = System.nanoTime();
            fileName = nanoTime + "_" + picPart.getSubmittedFileName();
            picPart.write(IMAGE_PATH + fileName);
        }
        Book book = Book.builder()
                .title(title)
                .description(description)
                .price(price)
                .author(authorManager.getById(authorId))
                .image(fileName)
                .build();
        bookManager.add(book);
        resp.sendRedirect("/books");
    }
}

