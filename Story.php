<?php echo "Hello"; ?>

<?php
/*
// Make a MySQL Connection
	mysql_connect('localhost', 'root', 'root') or die(mysql_error());
	mysql_select_db('madlib') or die(mysql_error());
	
// Selecting the table
$result = mysql_query("SELECT * FROM madlib"); or die(mysql_error());

// Selecting the relevent row
$row = mysql_fetch_row( $result );

    // This is a SILLY Twilio story. Told by a robot, that likes to draw Owls at NIGHT. Thank you. Good bye

    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";

*/
?>

<Response>
    <Say>
		This is a
    </Say>
    <Play>
		<?php echo $row['word1_url']; ?>
	</Play>
    <Say>
 		Twilio story.
	</Say>
</Response>
