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
 * Servlet implementation class CreerVilleServlet
 */
@WebServlet("/CreerVilleServlet")
public class CreerVilleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreerVilleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String codeCommune = request.getParameter("codeCommune");
		String nomCommune = request.getParameter("nomCommune");
		String codePostal = request.getParameter("codePostal");
		String libelle = request.getParameter("libelle");
		String ligne = request.getParameter("ligne5");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		 HttpSession session = request.getSession();
		 RestTemplate restTemplate = new RestTemplate();
		 Ville ville = new Ville();
		 ville.setCode_commune_INSEE(codeCommune);
		 ville.setNom_commune(nomCommune);
		 ville.setCode_postal(codePostal);
		 ville.setLibelle_acheminement(libelle);
		 ville.setLigne_5(ligne);
		 ville.setLatitude(latitude);
		 ville.setLongitude(longitude);
		
		 String answer = restTemplate.postForObject("http://127.0.0.1:8181/insertVille", ville,String.class);
		 System.out.println(answer);
		 
		 
		 session.setAttribute("nomCommune", nomCommune);
		
		 
		 RequestDispatcher dispat = request.getRequestDispatcher("ajoutVille.jsp");
		 dispat.forward(request, response);
		 
		
		
	}

}
