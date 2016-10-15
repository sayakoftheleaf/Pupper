import java.net.Socket;
import java.util.ArrayList;
import java.util.Random;


public class User {
	Random rand = new Random();
	String id; //must be unique
	String password; //may not be necessary
	boolean canCreateEvents;
	
	// ArrayList<String> eventList;
	public ArrayList<String> favoriteList = new ArrayList<String>();
	
	public User(String userId) {
		id = userId;
	}
	public void getPermission(String info) {
		canCreateEvents = true; //how are we going to handle this? May not need to do anything
	}
	public void setFavorite(String evId) {
		if(!favoriteList.contains(evId)){
			favoriteList.add(evId);
			Event.findById(evId).upvote();
		}
	}
	public void removeFavorite(String evId) {
		if(favoriteList.contains(evId)){
			favoriteList.remove(evId);
			Event.findById(evId).downvote();
		}
	}
	
	public void postComment(String eventId, String userId, String comment){
		Event ev = Event.findById(eventId);
		ev.postMessage(userId, comment);
	}
	public static User findById(String userId) {
		for(User user : Server.userList) {
			if (user.id.equals(userId)) return user;
		}
		return null;
	}
	public static User registerUser (Socket socket) {
		Server.userList.add(new User(socket.getLocalAddress().getHostAddress()));
		return findById(socket.getLocalAddress().getHostAddress());
	}
	public static String toString (User user) {
		return user.id;
	}
}
