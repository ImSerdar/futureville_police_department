<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";

$conn = new mysqli ($servername, $username, $password, $dbname);

$insertTerm = $_POST['insertTerm'];

if ($insertTerm == "") {
    echo "The function must have a name.";
} else {
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $query = "SELECT MAX(functionID) FROM roboFunction";

    $result = $conn->query($query);

    while ($row = $result->fetch_assoc()) {
        $newID = $row["MAX(functionID)"] + 1;
    }

    $query = "INSERT INTO roboFunction VALUES (" . $newID . ", '" . $insertTerm . "')";
    $result = $conn->query($query);

    echo "Function successfully created! " . $insertTerm . " has been automatically assigned the next available ID number; " . $newID;

    $query = "SELECT * FROM roboFunction";

    $result = $conn->query($query);

    echo "<br><br>The new roboFunction table after " . $insertTerm . " has been added:";

    if ($result->num_rows > 0) {
        echo "<table align=\"center\" border = \"1\">";
        echo "<tr> <th>Function ID</th> <th>Function Name</th> </tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["functionID"] . "</td><td>" . $row["functionName"] . "</td></tr>";
        }
    } else {
        echo "0 results";
    }
}
$conn->close();
?>