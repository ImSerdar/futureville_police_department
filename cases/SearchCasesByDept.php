<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";
$choice = "";

if (isset($_POST['radio'])) {
    $choice = $_POST['radio'];
} else {
    die("You must select one of the options.");
}

$conn = new mysqli ($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT d.fullName, a.caseID FROM Detective d LEFT OUTER JOIN assignedTo a ON d.officerID = a.officerID";

echo "Here are the cases assigned to each detective in ";

if ($choice != 'every') {
    $query = $query . " WHERE d.department = '" . $choice . "'";
    echo "the ";
}

echo $choice . " department:<br>";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Detective</th> <th>Case ID</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["fullName"] . "</td><td>" . $row["caseID"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>