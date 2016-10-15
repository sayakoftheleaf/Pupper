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
		return pets;
	}
	
	
}
