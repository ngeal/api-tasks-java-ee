
package com.tasks.jaxrs;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/tasks")
public class TasksService {
	TaskPersistance taskPersistance = null;
	
	EntityManager manager = null;

	public TasksService()
	{
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("persistenceUnit");
		manager = factory.createEntityManager();
		taskPersistance = new TaskPersistance(manager);
	}
		@GET
		@Path("/get")
		@Produces(MediaType.APPLICATION_JSON)
		public List<Task> getTasks(){
			return taskPersistance.listTasks();
		}
		
		@POST
		@Path("/post")
		@Consumes(MediaType.APPLICATION_JSON)
		public Response postStudentRecord(Task task){
			String result = "Record entered: "+ task;
			EntityTransaction tx = manager.getTransaction();
			tx.begin();
			taskPersistance.createTask(task);
			tx.commit();
			return Response.status(201).entity(result).build();
		}
	}