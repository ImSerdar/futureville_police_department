<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";

$conn = new mysqli ($servername, $username, $password, $dbname);

$searchTerm = $_POST['searchTerm'];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT rc.* FROM RoboCop rc, Officer_Has oh, roboFunction rf WHERE rc.officerID = oh.officerID AND oh.functionID = rf.functionID AND rf.functionName = '$searchTerm'";

$result = $conn->query($query);

echo "All RoboCops with the function " . $searchTerm . ":";

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Officer ID</th> <th>RoboCop Name</th> <th>Precinct</th> <th>Address</th> <th>Supervisor's Officer ID</th> <th>Version Number</th> </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["officerID"] . "</td><td>" . $row["fullName"] . "</td><td>" . $row["precinct"] . "</td><td>" . $row["address"] . "</td><td>" . $row["supervisorID"] . "</td><td>" . $row["versionNumber"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>