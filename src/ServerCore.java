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
			ServerSocket sSocket = new ServerSocket(1339);
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
				output.println("You have connected at: " + new Date() +"\n");
				output.flush();
				boolean running = true;
				
				// main while loop
				while (running == true){
					
					System.out.println("Running");
					String chatInput = input.readLine();
					String resultString = chatInput;
					
					
					
					System.out.print("Echo: ");
					System.out.print(resultString + "\n");
//					output.println(">> " + resultString + "\n");
					
					output.println(resultString + "\n");
					output.flush();
					try {
						Thread.sleep(5);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
				
			}
			catch(IOException exception) {
				System.out.println("Caught exception. Thread failure.");
			}
		}
		public JSONObject makePet(Pet p){
			JSONObject obj = new JSONObject();
			obj.put("name", p.name);
			
			
			return obj;
		}
		
		
	
}
}
