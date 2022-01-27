<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";
$choice = "";

$conn = new mysqli ($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['radio'])) {
    $choice = $_POST['radio'];
} else {
    die("You must select to search for either UltraBots or UselessBots.");
}

$query = "SELECT * FROM Robocop rc WHERE NOT EXISTS (SELECT rf.functionID FROM roboFunction rf WHERE ";

if ($choice == 'ALL') {
    $query = $query . "NOT ";
}

$query = $query . "EXISTS (SELECT oh.functionID FROM Officer_Has oh WHERE rc.officerID = oh.officerID AND rf.functionID = oh.functionID))";

$result = $conn->query($query);

echo "All RoboCops equipped with " . $choice . " functions:";

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