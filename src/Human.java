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
}
