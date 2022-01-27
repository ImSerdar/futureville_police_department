<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";
$choice = "";

if (isset($_POST['radio'])) {
    $choice = $_POST['radio'];
} else {
    die("You must select to delete either a RoboCop or a function.");
}

$conn = new mysqli ($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT precinct, COUNT(*) FROM " . $choice . " GROUP BY precinct ORDER BY COUNT(*) DESC";

$result = $conn->query($query);

echo "Here are the number of " . $choice . "s currently assigned to each precinct:";

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Precinct</th> <th>Number of " . $choice . "s</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["precinct"] . "</td><td>" . $row["COUNT(*)"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>