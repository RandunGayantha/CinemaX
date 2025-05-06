package cinema.controller.com;

import cinema.dao.com.FilmAdminDAO;
import cinema.dao.com.AdminDetailsDAO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/adminView")
public class AdminViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("films".equals(action)) {
            request.setAttribute("films", new FilmAdminDAO().getAllFilms());
            request.getRequestDispatcher("viewFilms.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            new FilmAdminDAO().deleteFilm(id);
            response.sendRedirect("adminView?action=films");
        } else if ("customers".equals(action)) {
            request.setAttribute("customers", new AdminDetailsDAO().getAllCustomers());
            request.getRequestDispatcher("viewCustomers.jsp").forward(request, response);
        } else if ("bookings".equals(action)) {
            request.setAttribute("bookings", new AdminDetailsDAO().getAllBookings());
            request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
        } else if ("payments".equals(action)) {
            request.setAttribute("payments", new AdminDetailsDAO().getAllPayments());
            request.getRequestDispatcher("viewPayments.jsp").forward(request, response);
        }
    }
}
