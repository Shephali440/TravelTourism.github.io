<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Tour</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Centered container for the form */
        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        h2 {
            text-align: center;
            color: #333;
        }

        /* Label styling */
        label {
            font-size: 1.1em;
            display: block;
            margin-bottom: 10px;
            color: #555;
        }

        /* Input styling */
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Submit button styling */
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Footer link */
        .footer {
            text-align: center;
            margin-top: 20px;
        }

        .footer a {
            text-decoration: none;
            color: #4CAF50;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Tour</h2>
        <form action="deleteTourAction.jsp" method="GET">
            <label for="tourid">Tour ID:</label>
            <input type="text" id="tourid" name="tourid" required>
            <input type="submit" value="Delete Tour">
        </form>
    </div>

    <div class="footer">
        <p><a href="adminMenu.jsp">Back to Admin Menu</a></p>
    </div>
</body>
</html>
