import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

public class ServerCore {
	public static void main(String[] args){
		new ServerCore();
		
	}
	
	
	public ServerCore(){
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

				//Tell the client that they've connected to the server
				output.println("You have connected at: " + new Date() +"\n");
				output.flush();
				boolean running = true;
				
				// main while loop
				while (running == true){
					String chatInput = input.readLine();
					String resultString = chatInput;
					
					System.out.print("Echo: ");
					System.out.println(resultString);
					
				}
				
			}
			catch(IOException exception) {
				System.out.println("Caught exception. Thread failure.");
			}
		}
	
}
}
