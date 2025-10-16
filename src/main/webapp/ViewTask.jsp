<%@page import="Beans.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Dashboard</title>
<style>
    /* Body styling */
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        background: #f0f4f8;
        color: #333;
    }

    /* Header */
    .header {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        padding: 15px 30px;
        background-color: #2575fc;
        color: white;
    }

    .header a {
        color: #fff;
        text-decoration: none;
        font-weight: bold;
        margin-left: 15px;
    }

    .header a:hover {
        text-decoration: underline;
    }

    /* Card for add task form */
    .task-card {
        background-color: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        max-width: 500px;
        margin: 30px auto;
    }

    .task-card h2 {
        text-align: center;
        color: #2575fc;
        margin-bottom: 25px;
    }

    .task-card form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .task-card input[type="text"],
    .task-card input[type="date"],
    .task-card select {
        padding: 12px 15px;
        border-radius: 10px;
        border: 1px solid #ccc;
        font-size: 1em;
        outline: none;
        transition: 0.3s;
    }

    .task-card input:focus,
    .task-card select:focus {
        border-color: #2575fc;
        box-shadow: 0 0 8px rgba(37,117,252,0.5);
    }

    .task-card .btn-container {
        display: flex;
        justify-content: space-between;
    }

    .task-card button {
        flex: 1;
        padding: 12px 0;
        border: none;
        border-radius: 10px;
        background-color: #2575fc;
        color: white;
        font-weight: bold;
        cursor: pointer;
        margin: 0 5px;
        transition: 0.3s;
    }

    .task-card button:hover {
        background-color: #6a11cb;
    }

    /* Tasks table */
    .tasks-table {
        width: 90%;
        max-width: 900px;
        margin: 20px auto 50px auto;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 6px 15px rgba(0,0,0,0.2);
    }

    .tasks-table th, .tasks-table td {
        padding: 12px 15px;
        text-align: center;
    }

    .tasks-table th {
        background-color: #2575fc;
        color: white;
    }

    .tasks-table tr:nth-child(even) {
        background-color: #f3f3f3;
    }

    .tasks-table tr:hover {
        background-color: #e0e0e0;
    }

    .tasks-table .completed {
        text-decoration: line-through;
        color: gray;
        font-style: italic;
    }

    .tasks-table a {
        text-decoration: none;
        color: #2575fc;
        font-weight: bold;
    }

    .tasks-table a:hover {
        text-decoration: underline;
    }

    /* Responsive adjustments */
    @media(max-width: 600px) {
        .task-card {
            margin: 20px;
            padding: 20px;
        }
        .task-card .btn-container {
            flex-direction: column;
        }
        .task-card button {
            margin: 5px 0;
        }
        .tasks-table {
            width: 100%;
        }
    }
</style>
</head>
<body>

<%
    Object obj=session.getAttribute("regId");
    Integer in=(Integer)obj;
    int regId=in.intValue();
    
    dao.ToDoDAO dao1=dao.ToDODAOimpl.getInstance();
    String flname=dao1.getFLNameByRegID(regId);
%>

<div class="header">
    Welcome <%=flname%> | <a href="./LogoutServlet">Logout</a>
</div>

<div class="task-card">
    <h2>Add Task</h2>
    <form method="post" action="./AddtaskServlet">
        <input type="text" name="taskName" placeholder="Task Name" required>
        <input type="date" name="taskDate" required>
        <select name="taskStatus" required>
            <option value="1">Not Yet Started</option>
            <option value="2">In Progress</option>
            <option value="3">Completed</option>
        </select>
        <div class="btn-container">
            <button type="submit" name="submit">Add Task</button>
            <button type="reset">Clear</button>
        </div>
    </form>
</div>

<%
    List<Task> tasks=dao1.findAllTasksByRegId(regId);
%>

<table class="tasks-table">
    <tr>
        <th>Task ID</th>
        <th>Task Name</th>
        <th>Task Date</th>
        <th>Task Status</th>
        <th>Action</th>
    </tr>
    <%
        for(Task task:tasks) {
            int taskId=task.getTaskid();
            String taskName=task.getTaskName();
            String taskDate=task.getTaskDate();
            int taskStatus=task.getTaskStatus();
    %>
        <tr class="<%= (taskStatus==3)?"completed":"" %>">
            <td><%=taskId%></td>
            <td><%=taskName%></td>
            <td><%=taskDate%></td>
            <td>
                <%
                    if(taskStatus==1) out.print("Not Yet Started");
                    else if(taskStatus==2) out.print("In Progress");
                    else out.print("Completed");
                %>
            </td>
            <td>
                <%
                    if(taskStatus!=3){
                %>
                    <a href="./MarkTaskCompletedServlet?regId=<%=regId%>&taskId=<%=taskId%>">Complete</a>
                <%
                    } else {
                        out.print("-");
                    }
                %>
            </td>
        </tr>
    <%
        }
    %>
</table>

</body>
</html>
