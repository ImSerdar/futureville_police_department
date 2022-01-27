<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";

$conn = new mysqli ($servername, $username, $password, $dbname);

$toUpdate = $_POST['toUpdate'];
$newDescription = $_POST['newDescription'];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT description FROM evidence WHERE evidenceID = '" . $toUpdate . "'";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "The original description for the evidence with ID number " . $toUpdate . " was:<br><br>" . $row["description"] . "<br><br>The description has been updated to:<br><br>" . $newDescription;
    }
} else {
    die("That evidence ID doesn't exist!");
}

$query = "UPDATE evidence SET description = '" . $newDescription . "' WHERE evidenceID = '" . $toUpdate . "'";

$result = $conn->query($query);

echo "<br><br>The new state of the evidence table:";

$query = "SELECT * FROM evidence";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Evidence ID</th> <th>Description</th> <th>Date Found</th> </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["evidenceID"] . "</td><td>" . $row["description"] . "</td><td>" . $row["dateFound"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>