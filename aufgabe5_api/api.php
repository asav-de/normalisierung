<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "online_shop";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}

$eingabe = strtolower($_GET['tabelle'] ?? '');

switch ($eingabe) {
    case 'kunden':
    case 'bestellungen':
    case 'bestellpositionen':
    case 'produkte':
    case 'hersteller':
        $tabelle = $eingabe;
        break;
    default:
        die("Unbekannte Tabelle: " . $eingabe);
}

$sql = "SELECT * FROM " . $tabelle;
$result = $conn->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

header('Content-Type: application/json');
echo json_encode($data);

$conn->close();