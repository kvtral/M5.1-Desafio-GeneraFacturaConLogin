package com.edutecno.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProcesaFactura
 * tiene la responsabilida de recibir los datos mediante el request desde index.jsp
 * los procesa y los envia al servlet GeneraFactura mediante request.getRequestDispatcher("/generaFactura").forward(request, response);
 */
@WebServlet("/procesaFactura")//ruta o path para acceder al servlet, mapping
public class ProcesaFactura extends HttpServlet {
	private static final long serialVersionUID = 1L;//serializacion para encontrar la clase en codigo bit

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nombre,empresa,rut,direccion,ciudad,pais;
		
		//requiriendo los datos a traves del request
		nombre = request.getParameter("nombre");
		empresa = request.getParameter("empresa");
		rut = request.getParameter("rut");
		direccion = request.getParameter("direccion");
		ciudad =request.getParameter("ciudad");
		pais = request.getParameter("pais");
		
		Integer cantValvulas, cantTurbo, cantFrenos, cantRefri, cantPlumas;
		//requiriendo los datos a traves del request y convirtiendolos
		cantValvulas = Integer.parseInt(request.getParameter("valvulas"));
		cantTurbo = Integer.parseInt(request.getParameter("turbo"));
		cantFrenos = Integer.parseInt(request.getParameter("frenos"));
		cantRefri = Integer.parseInt(request.getParameter("refri"));
		cantPlumas = Integer.parseInt(request.getParameter("plumas"));
		
		//almacenar estaticamente el valor de los precios como si los estuvieramos consultando a la base de datos
		Integer precioValvulas, precioTurbo, precioFreno, precioRefri, precioPlumas;
		precioValvulas = 120000;
		precioTurbo = 1700000;
		precioFreno = 760000;
		precioRefri = 2300000;
		precioPlumas = 10000;
		
		Integer valorTotal = 
				(
						(cantValvulas * precioValvulas)+
						(cantTurbo * precioTurbo)+
						(cantFrenos * precioFreno)+
						(cantRefri * precioRefri)+
						(cantPlumas * precioPlumas)
				);
		
		//seteo de los datos para ser despachados y ser enviados en el request
		request.setAttribute("nombre",nombre); //setAttribute(identificador,valor)
		request.setAttribute("empresa",empresa);
		request.setAttribute("rut",rut);
		request.setAttribute("direccion",direccion);
		request.setAttribute("ciudad",ciudad);
		request.setAttribute("pais",pais);
		
		request.setAttribute("precioTotalValvulas", cantValvulas * precioValvulas);
		request.setAttribute("precioTotalTurbos", cantTurbo * precioTurbo);
		request.setAttribute("precioTotalFrenos", cantFrenos * precioFreno);
		request.setAttribute("precioTotalRefri", cantRefri * precioRefri);
		request.setAttribute("precioTotalPlumas", cantPlumas * precioPlumas);
		
		request.setAttribute("cantValvulas", cantValvulas);
		request.setAttribute("cantTurbo", cantTurbo);
		request.setAttribute("cantFrenos", cantFrenos);
		request.setAttribute("cantRefri", cantRefri);
		request.setAttribute("cantPlumas", cantPlumas);
		
		request.setAttribute("valorTotal", valorTotal);
		
		//despachando los datos mediante el request, y enviando el request y el response
		request.getRequestDispatcher("/generaFactura").forward(request, response);
	}

}
