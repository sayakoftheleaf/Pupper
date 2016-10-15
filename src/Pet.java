import java.util.ArrayList;
import java.util.Date;

public class Pet extends User{
	
	public int id = -1;
	public long facebookID = -1;
	public String name = "";
	public String type = "";
	public String description = "";
	public int age = 0;
	public boolean walking = false;
	public boolean sitting = false;
	public String w_frequency = "";
	public String s_when = "";
	public ArrayList<Integer> matches = new ArrayList<Integer>();
	public Date added_on = new Date();
	public Date updated_on = new Date();
	public String lat = "";
	public String lon = "";
	
	
	public Pet(){
		pet = true;
	}
	
	
	public ArrayList<Pet> makePets(){
		ArrayList<Pet> pets = new ArrayList<Pet>();
		
		Pet p = new Pet();
		p.id = 0;
		p.facebookID = 0;
		p.name = "Spot";
		p.type = "Dog";
		p.description = "Bite me.";
		p.age = 5;
		p.walking = true;
		p.sitting = false;
		p.w_frequency = "Twice a week.";
		p.s_when = "5PM";
		
		Pet p1 = new Pet();
		p1.id = 1;
		p1.facebookID = 0;
		p1.name = "Snowball";
		p1.type = "Cat";
		p1.description = "Me-WOW!";
		p1.age = 9;
		p1.walking = false;
		p1.sitting = true;
		p1.w_frequency = "Three times a week.";
		p1.s_when = "11AM";
		
		Pet p2 = new Pet();
		p2.id = 2;
		p2.facebookID = 0;
		p2.name = "Speedy";
		p2.type = "Turtle";
		p2.description = "Slow and steady doesn't win shit.";
		p2.age = 47;
		p2.walking = false;
		p2.sitting = true;
		p2.w_frequency = "Three times a week.";
		p2.s_when = "6PM";
		
		Pet p3 = new Pet();
		p3.id = 4;
		p3.facebookID = 0;
		p3.name = "Sparky";
		p3.type = "Dog";
		p3.description = "I like leashes.";
		p3.age = 3;
		p3.walking = true;
		p3.sitting = false;
		p3.w_frequency = "Three time a week.";
		p3.s_when = "5PM";
		p3.matches.add(4);
		
		pets.add(p);
		pets.add(p1);
		pets.add(p2);
		pets.add(p3);
		
		
		
		return pets;
	}
	
	
	
	
}
