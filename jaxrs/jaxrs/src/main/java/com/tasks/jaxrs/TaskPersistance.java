package com.tasks.jaxrs;
import java.util.List;
import javax.persistence.EntityManager;


public class TaskPersistance {
	private EntityManager manager;

	public TaskPersistance(EntityManager manager) {
		this.manager = manager;
	}
	public TaskPersistance()
	{
	}
	
	public void createTasks() {
		int tasksCount = manager.createQuery("Select t From Task t", Task.class).getResultList().size();
		if (tasksCount == 0) {
			Task task = new Task();
			manager.persist(task);
		}
	}
	
	public void createTask(Task newTask) {
			manager.persist(newTask);
		}
	
	public List<Task> listTasks() {
		List<Task> resultList = manager.createQuery("Select t From Task t", Task.class).getResultList();
		return resultList;
	}
}
