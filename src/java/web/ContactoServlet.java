package web;

import dao.ContactoDAO;
import modelo.Contacto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="ContactoServlet", urlPatterns={"/contactos"})
public class ContactoServlet extends HttpServlet {

    private final ContactoDAO dao = new ContactoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.equals("list")) {
            List<Contacto> lista = dao.listar();
            req.setAttribute("lista", lista);
            req.getRequestDispatcher("/views/lista.jsp").forward(req, resp);
        } else if (action.equals("new")) {
            req.setAttribute("contacto", new Contacto());
            req.getRequestDispatcher("/views/form.jsp").forward(req, resp);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Contacto c = dao.obtener(id);
            req.setAttribute("contacto", c);
            req.getRequestDispatcher("/views/form.jsp").forward(req, resp);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.eliminar(id);
            resp.sendRedirect(req.getContextPath() + "/contactos");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String idStr = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        String email  = req.getParameter("email");
        String telefono = req.getParameter("telefono");

        if (idStr == null || idStr.isBlank()) {
            dao.insertar(new Contacto(nombre, email, telefono));
        } else {
            int id = Integer.parseInt(idStr);
            dao.actualizar(new Contacto(id, nombre, email, telefono));
        }
        resp.sendRedirect(req.getContextPath() + "/contactos");
    }
}
