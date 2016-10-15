import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;
import org.json.*;
import org.json.simple.JSONObject;

public class ServerCore {
	public static void main(String[] args){
		new ServerCore();
		
	}
	
	ArrayList<User> users = new ArrayList<User>();
	int currentID = 0;
	
	public ServerCore(){
		try {
			ServerSocket sSocket = new ServerSocket(5558);
			System.out.println("Server started at: " + new Date());


			//Loop that runs server functions
			while(true) {
				//Wait for a client to connect
				Socket socket = sSocket.accept();

				System.out.println("CLIENT RECEIVED");
				//Create a new custom thread to handle the connection
				ClientThread cT = new ClientThread(socket);

				//Start the thread!
				new Thread(cT).start();

			}
		} catch(IOException exception) {
			System.out.println("Error: " + exception);
		}
		
	}
	
	/* A client thread that is created by the server for each user that connects */
	class ClientThread implements Runnable
	{
		Socket threadSocket;

		//This constructor will be passed the socket
		public ClientThread(Socket socket)
		{
			//Here we set the socket to a local variable so we can use it later
			threadSocket = socket;
			
		}
		
		/* the runner for each client thread */
		public void run()
		{
			try {
				PrintWriter output = new PrintWriter(threadSocket.getOutputStream(), true);
				BufferedReader input = new BufferedReader(new InputStreamReader(threadSocket.getInputStream()));
				
				System.out.println("NEW CLIENT");
				
				//Tell the client that they've connected to the server
				//output.println("You have connected at: " + new Date() +"\n");
				//output.flush();
				
				
				boolean running = true;
				
				// main while loop
				while (running == true){
					
					System.out.println("Running");
					String chatInput = input.readLine();
					String resultString = chatInput;
					
					
					
					if (Integer.parseInt(resultString) == 0){
						Pet p = new Pet();
						ArrayList<Pet> pets = p.makePets();
						
						for (int i = 0; i < pets.size(); i++){
							Pet p1 = pets.get(i);
							output.println(makePet(p1) + "\n");
							output.flush();
							
							Thread.sleep(5);
						}
					}
					else if (Integer.parseInt(resultString) == 1){
						Human h = new Human();
						ArrayList<Human> humans = h.makeHumans();
						
						for (int i = 0; i < humans.size(); i++){
							Human p1 = humans.get(i);
							output.println(makeHuman(p1) + "\n");
							output.flush();
							
							Thread.sleep(5);
						}
						
					}
					
					System.out.print("Echo: ");
					System.out.print(resultString + "\n");
//					output.println(">> " + resultString + "\n");
					
					//output.println(resultString + "\n");
					//output.flush();
					
				}
				
			}
			catch(IOException exception) {
				System.out.println("Caught exception. Thread failure.");
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public JSONObject makePet(Pet p){
			JSONObject obj = new JSONObject();
			obj.put("id", Integer.toString(p.id));
			obj.put("facebookID", Integer.toString((int)p.facebookID));
			obj.put("name", p.name);
			obj.put("type", p.type);
			obj.put("description", p.description);
			obj.put("age", Integer.toString(p.age));
			obj.put("walking", p.walking);
			obj.put("sitting", p.sitting);
			obj.put("w_frequency", p.w_frequency);
			obj.put("s_when", p.s_when.toString());
			obj.put("matches", p.matches.toString());
			obj.put("added_on", p.added_on.toString());
			obj.put("updated_on", p.updated_on.toString());
			obj.put("lat", p.lat);
			obj.put("lon", p.lon);
			
			return obj;
		}
		public JSONObject makeHuman(Human p){
			JSONObject obj = new JSONObject();
			obj.put("id", Integer.toString(p.id));
			obj.put("facebookID", Integer.toString((int)p.facebookID));
			obj.put("name", p.name);
			obj.put("experience", p.experience);
			obj.put("description", p.description);
			obj.put("age", Integer.toString(p.age));
			obj.put("work_preference", p.work_preference);
			obj.put("matches", p.matches.toString());
			obj.put("added_on", p.added_on.toString());
			obj.put("updated_on", p.updated_on.toString());
			obj.put("lat", p.lat);
			obj.put("lon", p.lon);
			
			return obj;
		}
		
		
	
}
}
