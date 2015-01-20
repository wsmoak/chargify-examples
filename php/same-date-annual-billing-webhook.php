<?php

  require_once('./config.php');
  
  // see https://github.com/lewsid/chargify-webhook-helper/blob/master/example.php for example code

  $subdomain = $_POST['payload']['site']['subdomain'];
  $subject = "Test Chargify Webhook";
  $message = "Webhook " . $_POST["event"] . " received from " . $subdomain;
  $headers = 'From: "Example App" <support@example.com>';
      
  mail($recipient,$subject,$message,$headers);

if ($_POST["event"] == "signup_success")
{
  $subscription_id = $_POST['payload']['subscription']['id'];
        
  $json = '{ "subscription": { "next_billing_at": "2015-11-01T12:00:00-05:00" } }';

  // see https://github.com/jforrest/Chargify-PHP-Client/blob/master/lib/ChargifyConnector.php for example code

  $ch = curl_init();

  curl_setopt($ch, CURLOPT_URL, "https://" . $subdomain . ".chargify.com/subscriptions/" . $subscription_id );
  curl_setopt($ch, CURLOPT_USERPWD, $userpwd );
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_HTTPHEADER, array(
      'Content-Type: application/json',
      'Accept: application/json'
    ));
  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
  curl_setopt($ch, CURLOPT_POSTFIELDS, $json);

  $output = curl_exec($ch);

  curl_close($ch);
  
  $subject = "Signup Success Chargify Webhook";
  $message = $_POST["event"] . " from " . $subdomain . " -- billing date change result: " .$output;
  $headers = 'From: "Example App" <support@example.com>';

  mail($recipient,$subject,$message,$headers);
  
}
