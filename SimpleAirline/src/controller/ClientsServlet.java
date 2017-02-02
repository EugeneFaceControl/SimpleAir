package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ClientDao;
import model.Client;
import model.Destination;

@WebServlet("/clients")
public class ClientsServlet extends HttpServlet {
	private static final long serialVersionUID = 1213213L;
	private static String INSERT_OR_EDIT = "/user.jsp";
	private static String LIST_USER = "/listUser.jsp";
	private static String DESTINATION = "/destination.jsp";
	private static String MORE = "/more.jsp";
	private static String AGE = "/age.jsp";
	private ClientDao dao = new ClientDao();

	public ClientsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.setContentType("text/html; charset=UTF-8");
		// request.setCharacterEncoding("UTF-8");
		String forward = "";
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("clientId"));
			System.out.println("Delete id:" + id);
			dao.deleteClient(id);
			forward = LIST_USER;
			request.setAttribute("clients", dao.getAllClients());
		} else if (action.equalsIgnoreCase("deleteDestination")) {
			int id = Integer.parseInt(request.getParameter("destinationId"));
			System.out.println("Delete id:" + id);
			dao.deleteDestination(id);
			forward = LIST_USER;
			request.setAttribute("destinations", dao.getAllDestinations());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			int id = Integer.parseInt(request.getParameter("clientId"));
			Client cln = dao.getClientById(id);
			request.setAttribute("destinations", dao.getAllDestinations());
			request.setAttribute("client", cln);
		} else if (action.equalsIgnoreCase("editDestination")) {
			forward = DESTINATION;
			int id = Integer.parseInt(request.getParameter("destinationId"));
			Destination destination = dao.getDestinationById(id);
			request.setAttribute("destination", destination);
		} else if (action.equalsIgnoreCase("listUser")) {
			forward = LIST_USER;
			request.setAttribute("clients", dao.getAllClients());
			request.setAttribute("destinations", dao.getAllDestinations());
		} else if (action.equalsIgnoreCase("addDestination")) {
			forward = DESTINATION;
			System.out.println("Well");
		} else if (action.equalsIgnoreCase("more")) {
			forward = MORE;
			int id = Integer.parseInt(request.getParameter("clientId"));
			Client client = dao.getClientById(id);
			request.setAttribute("client", client);
			
		} else if (action.equalsIgnoreCase("agePage")) {
			forward = AGE;
			String age = request.getParameter("age");
			request.setAttribute("clients", dao.getAllFromAge(age));
			
		} else {
			forward = INSERT_OR_EDIT;
			request.setAttribute("destinations", dao.getAllDestinations());
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.setContentType("text/html; charset=UTF-8");
		// request.setCharacterEncoding("UTF-8");
		Client cln = new Client();

		cln.setFirstName(request.getParameter("firstName"));
		cln.setLastName(request.getParameter("lastName"));
		try {
			Date orderDate = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("orderDate"));
			cln.setOrderDate(orderDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			Date departureDate = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("departureDate"));
			cln.setDepartureDate(departureDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cln.setMobPhone(request.getParameter("mobPhone"));
		cln.setAddress(request.getParameter("address"));
		cln.setEmail(request.getParameter("email"));
		cln.setSeries(request.getParameter("series"));
		cln.setNum(request.getParameter("number"));
		// String cost = request.getParameter("cost");
		// String cost = null;
		// String destination = request.getParameter("destination");
		// if(destination.equals("Saint Peterburg")){
		// cost = "20";
		// } else if(destination.equals("London")){
		// cost = "40";
		// }
		// cln.setCost(Integer.parseInt(cost));
		cln.setDestination(request.getParameter("destination"));
		String dest = request.getParameter("destination");

		int cost = dao.getCostFromDestination(dest);
		String age = request.getParameter("age");
		cln.setAge(age);
		if (age.equalsIgnoreCase("Child")) {
			cost = cost * 75 / 100;
		} else if (age.equalsIgnoreCase("Infant")) {
			cost = cost / 10;
		} else {

		}
		cln.setCost(cost);
		String id = request.getParameter("clientId");
		if (id == null || id.isEmpty()) {
			dao.addUser(cln);
		} else {
			cln.setClientId(Integer.parseInt(id));
			dao.updateClient(cln);
		}

//		Destination destination = new Destination();
//		destination.setDestinationName(request.getParameter("destinationName"));
//		String destcost = request.getParameter("costDestination");
//		destination.setCost(Integer.parseInt(destcost));
//		String detinationId = request.getParameter("destinationId");
//		if (detinationId == null || detinationId.isEmpty()) {
////			 dao.addDestination(destination);
//		} else {
//			destination.setDestinationId(Integer.parseInt(detinationId));
//			dao.updateDestination(destination);
//		}

		RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
		request.setAttribute("clients", dao.getAllClients());
		request.setAttribute("destinations", dao.getAllDestinations());
		view.forward(request, response);
	}
}
