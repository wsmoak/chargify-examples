<?php

  require_once('./config.php');
  
  // see https://github.com/lewsid/chargify-webhook-helper/blob/master/example.php for example code

  $subdomain = $_POST['payload']['site']['subdomain'];
  $subject = "Test Chargify Webhook";
  $message = "Webhook " . $_POST["event"] . " received from " . $subdomain;
  $headers = 'From: "Example App" <support@example.com>';
      
  mail($recipient,$subject,$message,$headers);

?>