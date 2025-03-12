package com.scm.ERROR;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/error-handler")  // MUST MATCH web.xml location!
public class ErrorHandlerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String message = (String) request.getAttribute("javax.servlet.error.message");

        // Store attributes for JSP
        request.setAttribute("statusCode", statusCode);
        request.setAttribute("message", message != null ? message : "Something went wrong!");
        
        // Forward request to error.jsp
        request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
    }
}
