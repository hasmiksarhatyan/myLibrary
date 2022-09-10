package servlet;

import lombok.SneakyThrows;
import manager.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = "/users/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddUserServlet extends HttpServlet {
    private UserManager userManager = new UserManager();
    private static final String IMAGE_PATH = "C:\\Users\\User\\IdeaProjects\\myLibrary\\projectimages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/addUser.jsp").forward(req, resp);
    }

    @SneakyThrows
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (userManager.getByEmail(email) != null) {
            req.setAttribute("msg", "User already exists");
            req.getRequestDispatcher("/WEB-INF/addUser.jsp").forward(req,resp);
        } else {
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            String password = req.getParameter("password");
            Part picPart = req.getPart("image");
            String fileName = null;
            if (picPart.getSize() != 0) {
                long nanoTime = System.nanoTime();
                fileName = nanoTime + "_" + picPart.getSubmittedFileName();
                picPart.write(IMAGE_PATH + fileName);
            }
            User user = User.builder()
                    .name(name)
                    .surname(surname)
                    .email(email)
                    .password(password)
                    .image(fileName)
                    .build();
            userManager.add(user);
            resp.sendRedirect("/login");
        }
    }
}

