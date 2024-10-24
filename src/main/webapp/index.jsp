<html>
<body>
<h1><font color='red'> this is shareef <font></h1><br>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    List<String> todoList = (List<String>) application.getAttribute("todoList");
    if (todoList == null) {
        todoList = new ArrayList<>();
        application.setAttribute("todoList", todoList);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
</head>
<body>
    <h1>To-Do List</h1>

    <form action="todo" method="post">
        <input type="text" name="task" placeholder="Enter a new task" required>
        <input type="submit" value="Add Task">
    </form>

    <h2>Your Tasks:</h2>
    <ul>
        <%
            for (int i = 0; i < todoList.size(); i++) {
                String task = todoList.get(i);
        %>
                <li>
                    <%= task %>
                    <form action="todo" method="post" style="display:inline;">
                        <input type="hidden" name="remove" value="<%= i %>">
                        <input type="submit" value="Remove">
                    </form>
                </li>
        <%
            }
        %>
    </ul>
</body>
</html>

<h1>My favourite movies are Iron-man,Batman</h1><br>
<h1>Fan of RDJ and One-piece</h1>
</body>
</html>
