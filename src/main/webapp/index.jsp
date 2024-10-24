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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        input[type="submit"] {
            padding: 10px 15px;
            border: none;
            background-color: #5cb85c;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        h2 {
            color: #555;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background: #fff;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        li form {
            display: inline;
        }
        li button {
            background-color: #d9534f;
            border: none;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        li button:hover {
            background-color: #c9302c;
        }
    </style>
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
                    <form action="todo" method="post">
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
