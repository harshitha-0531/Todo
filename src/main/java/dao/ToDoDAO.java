package dao;
import java.util.List;
import Beans.Register;
import Beans.Task;

public interface ToDoDAO {
	public  int register(Register reg);
	public  int login (String email,String pass);
	public 	boolean addtask(Task task,int regid);
	public  List<Task>findAllTasksByRegId(int regid);
	public  boolean markTaskCompletedd(int taskid,int regid);
	public 	String getFLNameByRegID(int regid);
	public static ToDoDAO getInstance() {
        return ToDODAOimpl.getInstance();
    }
	
}
