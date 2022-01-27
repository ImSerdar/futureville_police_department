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

if ($searchTerm == '') {
    echo "You didn't set a minimum number of good deeds performed, so all suspects with at least 1 will be displayed, sorted in order of good deeds performed:";
    $searchTerm = "0";
} else {
    echo "All suspects with at least " . $searchTerm . " good deed(s) performed, sorted in order of good deeds performed:";
}

$query = "SELECT sdi.SuspectName, COUNT(*) AS NumberOfGoodDeedsPerformed FROM Suspects_DetainedIn sdi, goodDeedsPerformed gdp WHERE sdi.suspectID = gdp.suspectID GROUP BY sdi.suspectName HAVING COUNT(*) >= " . $searchTerm . " ORDER BY COUNT(*) DESC";

$result = $conn->query($query);
    
if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo "<tr> <th>Suspect Name</th> <th>Number of Good Deeds Performed</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["SuspectName"] . "</td><td>" . $row["NumberOfGoodDeedsPerformed"] . "</td></tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>