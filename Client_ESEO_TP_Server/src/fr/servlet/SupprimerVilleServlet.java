package fr.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.client.RestTemplate;

import fr.eseo.Ville;

/**
 * Servlet implementation class SupprimerVilleServlet
 */
@WebServlet("/SupprimerVilleServlet")
public class SupprimerVilleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerVilleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String codeVilleASupprimer = request.getParameter("ville");
		
		 
		RestTemplate restTemplate = new RestTemplate();
		 
		
		restTemplate.delete("http://127.0.0.1:8181/deleteVille?code_commune="+codeVilleASupprimer);
		
		 
		RequestDispatcher dispat = request.getRequestDispatcher("deleteReponse.jsp");
		dispat.forward(request, response);
	}

}
