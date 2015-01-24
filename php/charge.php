<h1>One Time Charge</h1>
<?php

$subID = $_POST['subid'];
echo $subID;

$json = '{ "charge": { "amount":"20.00", "memo": "One time charge with php curl." } }';
echo "<br/>json... ".$json;

// see https://github.com/jforrest/Chargify-PHP-Client/blob/master/lib/ChargifyConnector.php for example code

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, "https://" . $subdomain . ".chargify.com/subscriptions/" . "/charges.json";
curl_setopt($ch, CURLOPT_USERPWD, $userpwd );
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Accept: application/json'
  ));
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_POSTFIELDS, $json);

$output = curl_exec($ch);
echo "<br/>output... " . $output;

curl_close($ch);
?>
