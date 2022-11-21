
var upgradeToken = function() {
    window.location = '<?php echo $_SESSION['redirect_to'] ?>';
  };
  var extensions = <?php echo json_encode($openid_ext); ?>;
  var googleOpener = popupManager.createPopupOpener({
    'realm' : '<?php echo $openid_params['openid.realm'] ?>',
    'opEndpoint' : 'https://www.google.com/accounts/o8/ud',
    'returnToUrl' : '<?php echo $openid_params['openid.return_to'] . '?popup=true' ?>',
    'onCloseHandler' : upgradeToken,
    'shouldEncodeUrls' : true,
    'extensions' : extensions
  });
  $(document).ready(function () {
    jQuery('#LoginWithGoogleLink').click(function() {
      googleOpener.popup(450, 500);
      return false;
    });
  });