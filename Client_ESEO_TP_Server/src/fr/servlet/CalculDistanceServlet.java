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
 * Servlet implementation class CalculDistanceServlet
 */
@WebServlet("/CalculDistanceServlet")
public class CalculDistanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculDistanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//valeurs récupérées
		String codeVille1 = request.getParameter("ville1");
		String codeVille2 = request.getParameter("ville2");
		
		HttpSession session = request.getSession();
		RestTemplate restTemplate = new RestTemplate();
		
		//ville1
		
		Ville[] villes1 = restTemplate.getForObject("http://127.0.0.1:8181/ville?filtre=Code_Commune_INSEE&value="+codeVille1,Ville[].class);
		String nomVille1 = villes1[0].getNom_commune();
		String latitude1 = villes1[0].getLatitude();
		String longitude1 = villes1[0].getLongitude();
		session.setAttribute("nomVille1", nomVille1);
		
		//ville2
		
		Ville[] villes2 = restTemplate.getForObject("http://127.0.0.1:8181/ville?filtre=Code_Commune_INSEE&value="+codeVille2,Ville[].class);
		String nomVille2 = villes2[0].getNom_commune();
		String latitude2 = villes2[0].getLatitude();
		String longitude2 = villes2[0].getLongitude();
		session.setAttribute("nomVille2", nomVille2);
		
		//Calcul de distance entre deux villes
		
		float lat_a=Float.parseFloat(latitude1);
		float lng_a=Float.parseFloat(longitude1);
		float lat_b=Float.parseFloat(latitude2);
		float lng_b=Float.parseFloat(longitude2);
		
		float pk = (float) (180/3.14169);
		 
	    float a1 = lat_a / pk;
	    float a2 = lng_a / pk;
	    float b1 = lat_b / pk;
	    float b2 = lng_b / pk;
	 
	    float t1 = (float) (Math.cos(a1)*Math.cos(a2)*Math.cos(b1)*Math.cos(b2));
	    float t2 = (float) (Math.cos(a1)*Math.sin(a2)*Math.cos(b1)*Math.sin(b2));
	    float t3 = (float) (Math.sin(a1)*Math.sin(b1));
	    double tt = Math.acos(t1 + t2 + t3);
	 
	    float distance =  (float) (6366000*tt/1000);
	    
	    session.setAttribute("distance", distance);
		 
		 RequestDispatcher dispat = request.getRequestDispatcher("distanceReponse.jsp");
		 dispat.forward(request, response);
		
	}

}
