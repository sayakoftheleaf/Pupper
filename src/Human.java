import java.util.ArrayList;
import java.util.Date;

public class Human extends User{
	
	public int id = -1;
	public long facebookID = -1;
	public String name = "";
	public String description = "";
	public int age = 0;
	public String experience = "";
	public String work_preference = "";
	public Date added_on = new Date();
	public Date updated_on = new Date();
	public ArrayList<Integer> matches = new ArrayList<Integer>();
	public int distance_willing = 0;
	public String lat = "";
	public String lon = "";
	
	public Human(){
		pet = false;
	}
	
	public ArrayList<Human> makeHumans(){
		ArrayList<Human> hums = new ArrayList<Human>();
		
		Human h0 = new Human();
		h0.id = 5;
		h0.facebookID = 0;
		h0.name = "Mark Sheldon";
		h0.description = "I want a kitten!";
		h0.age = 52;
		h0.work_preference = "Right after office hours.";
		h0.experience = "Never enough!";
		h0.matches.add(4);
		
		Human h1 = new Human();
		h1.id = 6;
		h1.facebookID = 0;
		h1.name = "Barrack Obama";
		h1.description = "Bo needs a friend.";
		h1.age = 54;
		h1.work_preference = "I'm free everyday.";
		h1.experience = "Plenty after raising Bo!";
		h1.matches.add(4);
		
		Human h2 = new Human();
		h2.id = 7;
		h2.facebookID = 0;
		h2.name = "Chris Gregg";
		h2.description = "Nicest man alive.";
		h2.age = 47;
		h2.work_preference = "Dogs";
		h2.experience = "Kindest heart alive, natrual friend of all dogs.";
		h2.matches.add(4);
		
		Human h3 = new Human();
		h3.id = 8;
		h3.facebookID = 0;
		h3.name = "Rick Chatterjee";
		h3.description = "I love fluffy dogs.";
		h3.age = 21;
		h3.work_preference = "Cats";
		h3.experience = "Has in fact seen a cat once.";
		h3.matches.add(4);
		
		Human h4 = new Human();
		h4.id = 9;
		h4.facebookID = 0;
		h4.name = "David Stern";
		h4.description = "Looking for a nice puppy.";
		h4.age = 20;
		h4.work_preference = "Dogs";
		h4.experience = "So much experience.";
		h4.matches.add(4);
		
		Human h5 = new Human();
		h5.id = 10;
		h5.facebookID = 0;
		h5.name = "Isabelle Sennett";
		h5.description = "Any animal with long fur!";
		h5.age = 22;
		h5.work_preference = "Walking please!";
		h5.experience = "I own a cat!";
		h5.matches.add(4);
		
		hums.add(h0);
		hums.add(h1);
		hums.add(h2);
		hums.add(h3);
		hums.add(h5);
		hums.add(h4);
		
		
		
		
		
		return hums;
	}
}
