package com.edutecno.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProcesaLogin
 */
@WebServlet("/procesaLogin")
public class ProcesaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String LOGIN = "user";
	private final String PASS = "pass";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestLogin = request.getParameter("login"); 
		String requestPass = request.getParameter("pass");
		String nombreUsuario = "Alvaro J. Carrillanca";
		
		PrintWriter out = response.getWriter();
		
		if (!LOGIN.contentEquals(requestLogin) || !PASS.contentEquals(requestPass)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('usuario o password incorrectos');");
			out.println("location='index.jsp';");
			out.println("</script>");
		} else {			
			
			HttpSession session = request.getSession(true);
	
			session.setAttribute("requestLogin", requestLogin);
			session.setAttribute("nombre", nombreUsuario);
			session.setMaxInactiveInterval(0);
			
			Cookie cookie = new Cookie(requestLogin,"2022");
			
			cookie.setMaxAge(7000);
			cookie.setDomain("www.fullstackjava.com");
			cookie.setHttpOnly(true);//
			cookie.setComment("cookie generada en procesa login");
			cookie.setPath("/procesaLogin");
			
			response.addCookie(cookie); 
			
			request.getRequestDispatcher("ingresoValores.jsp").forward(request, response);
		}
	}
}
