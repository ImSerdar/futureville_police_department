<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";
$choice = "";
$deleteTerm = $_POST['deleteTerm'];

if (isset($_POST['radio'])) {
    $choice = $_POST['radio'];
} else {
    die("You must select to delete either a RoboCop or a function.");
}

$conn = new mysqli ($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT * FROM " . $choice . " WHERE ";

if ($choice == "roboFunction") {
    $query = $query . " functionID = ";
} else {
    $query = $query . " officerID = ";
}

$query = $query . $deleteTerm;

$result = $conn->query($query);

if ($result->num_rows == 0) {
    die("The ID number you're trying to delete doesn't exist in the " . $choice . " table.");
}

echo "Here are the Robocop, Officer_Has, and roboFunction tables <i><u>before</u></i> deletion:<br>";

$query = "SELECT officerID, fullName FROM Robocop";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Officer ID</th> <th>Full Name</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["officerID"] . "</td><td>" . $row["fullName"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

echo "<br><br>";

$query = "SELECT officerID, functionID FROM Officer_Has";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Officer ID</th> <th>Function ID</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["officerID"] . "</td><td>" . $row["functionID"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

echo "<br><br>";

$query = "SELECT functionID, functionName FROM roboFunction";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Function ID</th> <th>Function Name</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["functionID"] . "</td><td>" . $row["functionName"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

echo "<br><br>";

$query = "DELETE FROM " . $choice . " WHERE";
if ($choice == "roboFunction") {
    $query = $query . " functionID = ";
} else {
    $query = $query . " officerID = ";
}

$query = $query . $deleteTerm;

$result = $conn->query($query);

$query = "SELECT officerID, fullName FROM Robocop";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Officer ID</th> <th>Full Name</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["officerID"] . "</td><td>" . $row["fullName"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

echo "<br><br>And here are the same tables <i><u>after</u></i> deleting '" . $deleteTerm . "' from the " . $choice . " table:<br>";

$query = "SELECT officerID, functionID FROM Officer_Has";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Officer ID</th> <th>Function ID</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["officerID"] . "</td><td>" . $row["functionID"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

echo "<br><br>";

$query = "SELECT functionID, functionName FROM roboFunction";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Function ID</th> <th>Function Name</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["functionID"] . "</td><td>" . $row["functionName"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

echo "<br><br>";

$conn->close();
?>