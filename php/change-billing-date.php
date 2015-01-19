<h1>Change Billing Date</h1>
<?php

require_once('./config.php');

$subid = $_POST['subid'];
echo "subid..." . $subid;

$json = '{ "subscription": { "next_billing_at": "2015-11-01T12:00:00-05:00" } }';
echo "<br/>json... ".$json;

// see https://github.com/jforrest/Chargify-PHP-Client/blob/master/lib/ChargifyConnector.php for example code

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, "https://" . $subdomain . ".chargify.com/subscriptions/" . $subid );
curl_setopt($ch, CURLOPT_USERPWD, $userpwd );
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Accept: application/json'
  ));
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
curl_setopt($ch, CURLOPT_POSTFIELDS, $json);

$output = curl_exec($ch);
echo "<p>output... " . $output . "</p>";

curl_close($ch);
?>
