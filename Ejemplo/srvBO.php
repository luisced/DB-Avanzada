<?php
    error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);
    ini_set("display_errors", 1);
    $lAction = $_REQUEST["action"];
    $lResponse = NULL;
    if ($lAction == "act_getdata"){
        $gServers["KS_Host"] =	"localhost";
		$gServers["KS_Name"] =	"classicmodels";
		$gServers["KS_User"] =	"root";
		$gServers["KS_Pswd"] =	"";

        $lConn = new PDO(
            "mysql:host=" . $gServers['KS_Host'] . ";dbname=" . $gServers['KS_Name'], 
            $gServers['KS_User'], $gServers['KS_Pswd']
        );

		$lArr = NULL;
		if ($lConn) {
			$lSQL = "SELECT * FROM orders WHERE orderNumber < 10110;";
			$lQuery = $lConn->prepare($lSQL);
			$lQuery->execute();
			while ($lRow = $lQuery->fetch(PDO::FETCH_ASSOC)) {
				$lArr[] = $lRow;
			}
		}


        $lResponse = array("answer" => $lArr);


    }
    else
        $lResponse = array("answer" => "Unknown action!");
    
    header("Content-Type: application/json");
    echo json_encode($lResponse);
?>