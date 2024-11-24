<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Tour</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-size: 1.1em;
            display: block;
            margin-bottom: 10px;
            color: #555;
        }
        input[type="text"], input[type="date"], input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add New Tour</h2>
        <form action="addTourAction.jsp" method="POST">
            <label for="tourid">Tour ID:</label>
            <input type="text" id="tourid" name="tourid" required>

            <label for="tournm">Tour Name:</label>
            <input type="text" id="tournm" name="tournm" required>

            <label for="tplace1">Place 1:</label>
            <input type="text" id="tplace1" name="tplace1">

            <label for="tplace2">Place 2:</label>
            <input type="text" id="tplace2" name="tplace2">

            <label for="tplace3">Place 3:</label>
            <input type="text" id="tplace3" name="tplace3">

            <label for="startdt">Start Date:</label>
            <input type="date" id="startdt" name="startdt" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" required>

            <input type="submit" value="Add Tour">
        </form>
    </div>

    <div class="footer">
        <p><a href="adminMenu.jsp">Back to Admin Page</a></p>
    </div>

</body>
</html>
