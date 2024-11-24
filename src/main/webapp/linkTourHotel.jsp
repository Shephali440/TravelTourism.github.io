<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Link Tour to Hotel</title>
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
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #f44336; /* Red color for allotment icon */
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #d32f2f; /* Darker red on hover */
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Link Tour to Hotel</h2>
        <form action="linkTourHotelAction.jsp" method="POST">
            <label for="tourid">Tour ID:</label>
            <input type="text" id="tourid" name="tourid" required>

            <label for="hotelid">Hotel ID:</label>
            <input type="text" id="hotelid" name="hotelid" required>

            <label for="allotment">Allotment:</label>
            <!-- Allotment Icon Styled as Submit -->
            <input type="submit" value="Allotment">
        </form>
    </div>

    <div class="footer">
        <p><a href="adminMenu.jsp">Back to Admin Menu</a></p>
    </div>

</body>
</html>
