<h1>Hello</h1>

<?php
	//require '../twilio/Services/Twilio.php';
   // header("content-type: text/xml");
   // echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>

<Response>
    <Say>
		Welcome to Twilio Mad Lib. Please say a adjective.
    </Say>
    <Record
        action="word2.php"
        maxLength="20"
        finishOnKey="*"
        />

<?php
/*	$word1 = $_REQUEST['RecordingUrl'];
	
// Make a MySQL Connection		
		mysql_connect('localhost', 'root', 'root') or die(mysql_error());
		mysql_select_db('madlib') or die(mysql_error());

// Insert a row of information into the table
		mysql_query("INSERT INTO `madlib`.`responses` (`id`, `phone_number`, `word1_url`, `word2_url` `timestamp`) VALUES (NULL, '" . $_REQUEST['From'] . "', $word1, NULL, CURRENT_TIMESTAMP)");
*/		
?>

</Response>