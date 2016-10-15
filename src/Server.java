import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;

public class Server
{
	User user;
	int numEvents;
	public enum sortStyle {
		SOONEST, CLOSEST, ALPHABETICAL, FAVORITES, HOST
	}
	static ArrayList<Event> eventList = new ArrayList<Event>();
	static ArrayList<User> userList = new ArrayList<User>();

	public static boolean isNumeric(String inputString) {
		try {
			Double.parseDouble(inputString);
		} catch (NumberFormatException nfe) {
			return false;
		}
		return true;
	}

	public static void mainA(String[] args)
	{
/*		String eventSpecs =
				"Party,,"
						+ "Gonna be awesome,,"
						+ "10,,"
						+ "30,,"
						+ "5,,"
						+ "12,,"
						+ "12,,"
						+ "2017,,"
						+ "Monaco,,"
						+ "Prez lawn,,"
						+ "3";

		Event event1 = new Event(eventSpecs);
		eventSpecs =
				"Straight up drugs,,"
						+ "Lez get crunk,,"
						+ "100,,"
						+ "20,,"
						+ "4,,"
						+ "31,,"
						+ "10,,"
						+ "2015,,"
						+ "Bobo,,"
						+ "The place,,"
						+ "4";
		Event event2 = new Event(eventSpecs);
		//	System.out.print(eventSpecs);
		eventList.add(event1);
		eventList.add(event2);
		for(Event ev : eventList) {
			System.out.print(Event.toString(ev) + "\n");
		}
		*/
		new Server();
	}

	public Server()
	{
		//We need a try-catch because lots of errors can be thrown
		try {
			ServerSocket sSocket = new ServerSocket(5001);
			System.out.println("Server started at: " + new Date());


			//Loop that runs server functions
			while(true) {
				//Wait for a client to connect
				Socket socket = sSocket.accept();

				//Create a new custom thread to handle the connection
				ClientThread cT = new ClientThread(socket);

				//Start the thread!
				new Thread(cT).start();

			}
		} catch(IOException exception) {
			System.out.println("Error: " + exception);
		}
	}

	//Here we create the ClientThread inner class and have it implement Runnable
	//This means that it can be used as a thread
	class ClientThread implements Runnable
	{
		Socket threadSocket;

		//This constructor will be passed the socket
		public ClientThread(Socket socket)
		{
			//Here we set the socket to a local variable so we can use it later
			threadSocket = socket;
			user = User.findById(threadSocket.getRemoteSocketAddress().toString());
			if(user == null) {
				user = User.registerUser(threadSocket);
			}
		}

		public void run()
		{
			//All this should look familiar
			try {
				//Create the streams
				PrintWriter output = new PrintWriter(threadSocket.getOutputStream(), true);
				BufferedReader input = new BufferedReader(new InputStreamReader(threadSocket.getInputStream()));

				//Tell the client that he/she has connected
				output.println("You have connected at: " + new Date() +"\n");
				output.flush();

				while (true) {
					Event.sort_date(eventList);
					//This will wait until a line of text has been sent
					String chatInput = input.readLine();
					String resultString = chatInput;
					if(!resultString.isEmpty()){
						String firstChar = String.valueOf(chatInput.charAt(0));
						if (chatInput.contains(",,")) {
							String[] parsed = chatInput.split(",,", 2);
							firstChar = parsed[0]; 
						}
						if(isNumeric(firstChar)) {
							int switchInt = Integer.parseInt(firstChar);
							
							switch (switchInt) {
							case 0: // receive a message
								if(eventList.isEmpty()) break;
//								resultString = "received a 0 from " +User.toString(user)+ "\n";
								resultString = "";
								String[] message = chatInput.split(",,", 2);
								Event ev = Event.findById(message[1]);
								resultString += "~";
								for (String comment : ev.messageList) {
									resultString += (comment + ",,");
								}
								break;
							case 1: // receive/create event
								resultString = "received a 1 from " +User.toString(user)+ "\n";
								if (chatInput.contains(",,")) {
									String[] parsed = chatInput.split(",,", 2);
									firstChar = parsed[1];
								}
								System.out.println(firstChar);
								Event newEv = new Event(firstChar);
								eventList.add(newEv);
								resultString+=Event.toString(newEv);
								break;
							case 2: //send event list type social
								resultString = "received a 2 from " +User.toString(user)+ "\n";
								for(Event social : eventList) {
									if(social.type.equals("2")) resultString += (Event.toString(social) + "\n");
								}
								break;
							case 3: //send event list type sports
								resultString = "received a 3 from " +User.toString(user)+ "\n";
								for(Event sports : eventList) {
									if(sports.type.equals("3")) resultString += (Event.toString(sports) + "\n");
								}
								break;
							case 4: //send event list type arts
								resultString = "received a 4 from " +User.toString(user)+ "\n";
								for(Event arts : eventList) {
									if(arts.type.equals("4")) resultString += (Event.toString(arts) + "\n");
								}
								break;
							case 5: //send event list type clubs
								resultString = "received a 5 from " +User.toString(user)+ "\n";
								for(Event clubs : eventList) {
									if(clubs.type.equals("5")) resultString += (Event.toString(clubs) + "\n");
								}
								break;
							case 6: //add event to user favorites
								if(eventList.isEmpty()) break;
								resultString = "received a 6 from " +User.toString(user)+ "\n";
								String[] parsed = chatInput.split(",,", 2);
								System.out.print(parsed[1]);
								String eventId = parsed[1];
								user.setFavorite(eventId);
								break;
							case 7: //returns favorites
								resultString = "received a 7 from " +User.toString(user)+ "\n";
								for(String id : user.favoriteList) {
									resultString += (Event.toString(Event.findById(id)) + "\n");
								}
								break;
							case 8: //remove event from favorites
								resultString = "received an 8 from " +User.toString(user)+ "\n";
								String[] parts = chatInput.split(",,", 2);
								System.out.print(parts[1]);
								String evId = parts[1];
								user.removeFavorite(evId);
								break;
							case 9: //remove event from favorites
								resultString = "received a 9 from " +User.toString(user)+ "\n";
								String[] newMessage = chatInput.split(",,", 3);
								user.postComment(newMessage[1], user.id, newMessage[2]);
								break;
							}
						}
						System.out.print(resultString + "\n");
//						output.println(">> " + resultString + "\n");
						output.println(resultString + "\n");
						output.flush();
						try {
							Thread.sleep(5);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			} catch(IOException exception) {

			}
		}
	}
}