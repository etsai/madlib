<?php
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
    <Say>
        Welcome to Twilio Mad Libs. Please name a adjective.
    </Say>
    <Record
        action="word1.php"
        method="GET"
        maxLength="20"
        finishOnKey="*"
        />
		<?php
				mysql_connect('localhost', 'root', '') or die(mysql_error());
				mysql_select_db('madlib') or die(mysql_error());
				var_dump(mysql_query("SELECT * FROM `responses` WHERE `id` = 1"));

		?>
</Response>