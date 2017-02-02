package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Client;
import model.Destination;
import utils.DbUtils;

public class ClientDao {
	private Connection connection;

	public ClientDao() {
		connection = DbUtils.getConnection();
	}

	public void addUser(Client cln) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO " + "userdb.client(first_name,last_name,order_date,departure_date,mob_phone,address,"
							+ "email,series,num, cost, destination, age) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, cln.getFirstName());
			preparedStatement.setString(2, cln.getLastName());
			preparedStatement.setDate(3, new java.sql.Date(cln.getOrderDate().getTime()));
			preparedStatement.setDate(4, new java.sql.Date(cln.getDepartureDate().getTime()));
			preparedStatement.setString(5, cln.getMobPhone());
			preparedStatement.setString(6, cln.getAddress());
			preparedStatement.setString(7, cln.getEmail());
			preparedStatement.setString(8, cln.getSeries());
			preparedStatement.setString(9, cln.getNumber());
			preparedStatement.setInt(10, cln.getCost());
			preparedStatement.setString(11, cln.getDestination());
			preparedStatement.setString(12, cln.getAge());
			
			preparedStatement.executeUpdate();
			System.out.println("All good");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}

	public void addDestination(Destination destination){
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO "
					+ "userdb.destination(destination_name, cost) VALUES (?, ?)");
			preparedStatement.setString(1, destination.getDestinationName());
			preparedStatement.setInt(2, destination.getCost());
			preparedStatement.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} catch(NullPointerException e){
			e.printStackTrace();
		}
	}

	public void deleteClient(int clnId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("DELETE FROM userdb.client WHERE client_id=?");

			preparedStatement.setInt(1, clnId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteDestination(int destinationId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("DELETE FROM userdb.destination WHERE destination_id=?");

			preparedStatement.setInt(1, destinationId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateClient(Client cln) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE userdb.client SET first_name=?,last_name=?,"
							+ "order_date=?,departure_date=?, mob_phone=?,address=?,email=?,"
							+ "series=?,num=?,cost=?,destination=?, age=? WHERE client_id=?");
			preparedStatement.setString(1, cln.getFirstName());
			preparedStatement.setString(2, cln.getLastName());
			preparedStatement.setDate(3, new java.sql.Date(cln.getOrderDate().getTime()));
			preparedStatement.setDate(4, new java.sql.Date(cln.getDepartureDate().getTime()));
			preparedStatement.setString(5, cln.getMobPhone());
			preparedStatement.setString(6, cln.getEmail());
			preparedStatement.setString(7, cln.getAddress());
			preparedStatement.setString(8, cln.getSeries());
			preparedStatement.setString(9, cln.getNumber());
			preparedStatement.setInt(10, cln.getCost());
			preparedStatement.setString(11, cln.getDestination());
			preparedStatement.setString(12, cln.getAge());
			preparedStatement.setInt(13, cln.getClientId());

			preparedStatement.executeUpdate();
			System.out.println("All good");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateDestination(Destination destination){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE userdb.destination SET destination_name=?, cost WHERE destination_id=?");
			preparedStatement.setString(1, destination.getDestinationName());
			preparedStatement.setInt(2, destination.getCost());
			preparedStatement.setInt(3, destination.getDestinationId());
			
			preparedStatement.executeUpdate();
			System.out.println("Updating destination");
		} catch(SQLException e){
			e.printStackTrace();
		}
	}

	public Client getClientById(int id) {
		Client clnt = new Client();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM userdb.client WHERE client_id=?");

			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				clnt.setClientId(rs.getInt("client_id"));
				clnt.setFirstName(rs.getString("first_name"));
				clnt.setLastName(rs.getString("last_name"));
				clnt.setOrderDate(rs.getDate("order_date"));
				clnt.setDepartureDate(rs.getDate("departure_date"));
				clnt.setMobPhone(rs.getString("mob_phone"));
				clnt.setEmail(rs.getString("email"));
				clnt.setAddress(rs.getString("address"));
				clnt.setSeries(rs.getString("series"));
				clnt.setNum(rs.getString("num"));
				clnt.setCost(rs.getInt("cost"));
				clnt.setDestination(rs.getString("destination"));
				clnt.setAge(rs.getString("age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clnt;
	}
	
	public Destination getDestinationById(int id){
		Destination destination = new Destination();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM userdb.destination WHERE destination_id=?");
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				destination.setDestinationId(rs.getInt("destination_id"));
				destination.setDestinationName(rs.getString("destination_name"));
				destination.setCost(rs.getInt("cost"));
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return destination;
	}

	public int getCostFromDestination(String destinationName){
		Client cost = new Client();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT cost FROM userdb.destination WHERE destination_name=?");
			preparedStatement.setString(1, destinationName);
			
			
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				cost.setCost(rs.getInt("cost"));
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return cost.getCost();
	}
	
	public List<Client> getAllFromAge(String age){
		List<Client> clients = new ArrayList<Client>();
		
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM userdb.client WHERE age=?");
			preparedStatement.setString(1, age);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Client client = new Client();
				client.setClientId(rs.getInt("client_id"));
				client.setFirstName(rs.getString("first_name"));
				client.setLastName(rs.getString("last_name"));
				client.setOrderDate(rs.getDate("order_date"));
				client.setDepartureDate(rs.getDate("departure_date"));
				client.setMobPhone(rs.getString("mob_phone"));
				client.setEmail(rs.getString("email"));
				client.setAddress(rs.getString("address"));
				client.setSeries(rs.getString("series"));
				client.setNum(rs.getString("num"));
				client.setCost(rs.getInt("cost"));
				client.setDestination(rs.getString("destination"));
				client.setAge(rs.getString("age"));
				clients.add(client);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return clients;
	}
	
	public List<Client> getAllClients() {
		List<Client> clients = new ArrayList<Client>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM userdb.client");
			while (rs.next()) {
				Client cln = new Client();
				cln.setClientId(rs.getInt("client_id"));
				cln.setFirstName(rs.getString("first_name"));
				cln.setLastName(rs.getString("last_name"));
				cln.setOrderDate(rs.getDate("order_date"));
				cln.setDepartureDate(rs.getDate("departure_date"));
				cln.setDepartureDate(rs.getDate("departure_date"));
				cln.setMobPhone(rs.getString("mob_phone"));
				cln.setAddress(rs.getString("address"));
				cln.setEmail(rs.getString("email"));
				cln.setSeries(rs.getString("series"));
				cln.setNum(rs.getString("num"));
				cln.setCost(rs.getInt("cost"));
				cln.setDestination(rs.getString("destination"));
				cln.setAge(rs.getString("age"));
				clients.add(cln);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return clients;
	}
	
	public List<Destination> getAllDestinations(){
		List<Destination> destinations = new ArrayList<Destination>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM userdb.destination");
			while(rs.next()){
				Destination destination = new Destination();
				destination.setDestinationId(rs.getInt("destination_id"));
				destination.setDestinationName(rs.getString("destination_name"));
				destination.setCost(rs.getInt("cost"));
				destinations.add(destination);
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return destinations;
	}
}
