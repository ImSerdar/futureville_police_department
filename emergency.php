<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";

$conn = new mysqli ($servername, $username, $password, $dbname);

$emergencyPassword = $_POST['emergencyPassword'];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($emergencyPassword == "password123") {
    $query = "DROP TABLE Patrol, assignedTo, witnessedBy, Suspected, Officer_Has, DateOfCrime, belongsTo, roboFunction, Suspects_DetainedIn, jailCells, witnesses, Evidence, goodDeedsPerformed, cases, RoboCop, Detective";
    $result = $conn->query($query);
    echo "Entire database deleted. Hopefully you aren't a criminal or a hacker.";
} else {
    die("Wrong password!");
}

$conn->close();
?>