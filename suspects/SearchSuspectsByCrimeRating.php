<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "futureville_police";
$nameCheck = isset($_POST['nameCheck']);
$rateCheck = isset($_POST['rateCheck']);
$idCheck = isset($_POST['idCheck']);
$tableHeadings = "<tr> ";
$tableRows = '';
$previous = FALSE;

$conn = new mysqli ($servername, $username, $password, $dbname);

$searchTerm = $_POST['searchTerm'];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT ";

if ($nameCheck == 1) {
    $query = $query . "suspectName";
    $tableHeadings = $tableHeadings . "<th>Suspect Name</th>";
    $previous = TRUE;
}

if ($rateCheck == 1) {
    if ($previous) {
        $query = $query . ", ";
    }
    $query = $query . "crimeRate";
    $tableHeadings = $tableHeadings . "<th>Crime Rating</th>";
    $previous = TRUE;
}

if ($idCheck == 1) {
    if ($previous) {
        $query = $query . ", ";
    }
    $query = $query . "suspectID";
    $tableHeadings = $tableHeadings . "<th>Suspect ID</th>";
}

if ($query == "SELECT ") {
    echo "You must select at least one box to see the results.";
} else if ($searchTerm == '') {
    echo "You must enter a minimum crime rate to search for.";
} else {
    $query = $query . " FROM Suspects_DetainedIn WHERE crimeRate >= " . $searchTerm;
    $tableHeadings = $tableHeadings . "</tr>";
}

$result = $conn->query($query);
    
echo "All suspects with at least " . $searchTerm . "% crime rating:";

if ($result->num_rows > 0) {
    echo "<table align=\"center\" border = \"1\">";
    echo $tableHeadings;
    while ($row = $result->fetch_assoc()) {
        $tableRows = "<tr><td>";
        $previous = FALSE;
        if ($nameCheck == 1) {
            $tableRows = $tableRows . $row["suspectName"] . "</td>";
            $previous = TRUE;
        }
        if ($rateCheck == 1) {
            if ($previous) {
                $tableRows = $tableRows . "<td>";
            }
            $tableRows = $tableRows . $row["crimeRate"] . "</td>";
            $previous = TRUE;
        }
        if ($idCheck == 1) {
            if ($previous) {
                $tableRows = $tableRows . "<td>";
            }
            $tableRows = $tableRows . $row["suspectID"] . "</td>";
        }
        $tableRows = $tableRows . "</tr>";
        echo $tableRows;
    }
} else {
    echo "0 results";
}

$conn->close();
?>