import java.util.ArrayList;
import java.util.Random;

public class Event {
	ArrayList<String> messageList = new ArrayList<String>();
	ArrayList<User> messageUsers = new ArrayList<User>();
	//variables for event class 
	public String name;
	public String description;
	public int score;
	public int minutes;
	public int hours;
	public int day;
	public int month;
	public int year;
	public String host;
	public String location;
	public String id;
	public String origin;
	public String type;
	
	
	public Event(String information) {
		Random rand = new Random();
		String[] info = information.split(",,");
		name = info[0];
		description = info[1]; 	
		score = Integer.parseInt(info[2]); 	
		minutes = Integer.parseInt(info[3]);
		hours = Integer.parseInt(info[4]);	
		day = Integer.parseInt(info[5]);
		month = Integer.parseInt(info[6]);
		year = Integer.parseInt(info[7]);
		host = info[8];
		location = info[9];
		type = info[10];
		id = "Event-" + rand.nextInt();
		origin = information.toString();
		score = 0; //set score to start at 0
	}
	
	public static Event findById(String eventId) {
		for(Event ev : Server.eventList) {
			if(ev.id.equals(eventId)) return ev; 
		}
		return null;
	}
	
	public static ArrayList<Event> sort_date(ArrayList<Event> eventList) {
		
		//first we get all the date numerical values
		ArrayList<Double> dates = date_list(eventList);
		
		Event currentFirst;
		Event temp;
		//now looping through all the values
		for (int i = 0; i < eventList.size(); i++){
			currentFirst = eventList.get(i);
			for (int j = i; j < eventList.size(); j++){
				if ((double)(dates.get(j)) < (double)(dates.get(i))){
					temp = currentFirst;
					currentFirst = eventList.get(j);
					eventList.set(j, temp);
					eventList.set(i, currentFirst);
				}
			}
		}
		
		return eventList;
	}
	
	public void addMessageUser(String userId) {
		messageUsers.add(User.findById(userId));
	}
	
	public void postMessage(String userId, String comment) {
		if (messageUsers.contains(User.findById(userId))){
			int position = (messageUsers.indexOf(User.findById(userId))+1);
			messageList.add("p"+position + ") " + comment);
		} else {
			addMessageUser(userId);
			postMessage(userId, comment);
		}
		
	}
	//purpose: to put all the date numerical values in a list,
	//	       smaller numbers occur sooner
	public static  ArrayList<Double> date_list(ArrayList<Event> eventList){
		ArrayList<Double> dates = new ArrayList<Double>();
		double year;
		double month;
		double day;
		double hour;
		double minute;
		// iterating through all the events
		for (int i = 0; i < eventList.size(); i++) {
			year = (eventList.get(i).year * Math.pow(10, 10));
			month = (eventList.get(i).month * Math.pow(10, 8));
			day = eventList.get(i).day * Math.pow(10, 6);
			hour = eventList.get(i).hours * Math.pow(10, 4);
			minute = eventList.get(i).minutes * Math.pow(10,2);
			dates.add(year+month+day+hour+minute);
		}
		
		return dates;
		
	}
	public void upvote() {
		score++;
	}

	public void downvote() {
		score--;
	}
	
	public static ArrayList<Event> sort_alphabetical(ArrayList<Event> eventList) {
		Event temp;
		Event currentFirst;
		for (int i = 0; i < eventList.size(); i++) {
			//pushing back the first value by 1 each iteration
			//essentially shortening the array each time
			currentFirst = eventList.get(i);
			for (int j = i; j < eventList.size(); j++){
				//comparing the first value to the rest
				if (eventList.get(j).name.compareTo(currentFirst.name) < 0) {
					temp = currentFirst;
					currentFirst = eventList.get(j);
					eventList.set(j, temp);
					eventList.set(i, currentFirst);
				}
			}
		}
		return eventList;
	}

	
	static String toString(Event ev) {
		return "&&"+ev.name + ",," + ev.description + ",," + ev.score + ",," 
				+ ev.minutes + ",," + ev.hours + ",," + ev.day + ",," + ev.month + ",,"
				+ ev.year + ",," + ev.host + ",," + ev.location + ",," + ev.type + ",," + ev.id;
	}
	
}
