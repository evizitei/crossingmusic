<?php
// subject of the email to be sent.
// set the default subject here
// if there is a <input type="hidden" name="subject" value="My Custom Subject"> this will be used instead
$default_subject = "Contact Form"; 
// the to, cc, and bcc email addresses.
// seperate them by commas if you want to use multiple
$to="hayley@blueteddy.com.au"; //change this to your email
//$cc="info@youremail.com";
//$bcc="info@youremail.com";
// the default redirect.
// if you set <input type="hidden" name="redirect" value="foo.htm"> it will override this
$redirect = "thankyou.html";
// required form fields, if any of these are missing then the
// form will not submit and an error message will be shown.
// set <input type="hidden" name="required" value="field1,field2,field3"> to override these
$required = array(
    "name",
    "email",
);
$email_title = "Contact Form";
// these are the fields to ignore in the email that comes through
$ignorefields = array(
    "submit",
    "redirect",
    "subject",
    "email_to",
    "required",
	"submit_y",
	"submit_x",
	
);
// names of the <input type=file> fields:
$uploadfiles = array(
    "file_upload1",
    "file_upload2",
    "file_upload3",
);
function f_safe_string($s){
    return preg_replace( '((?:\n|\r|\t|%0A|%0D|%08|%09)+)i' , '', $s);
}
// the default from email address that this form gets sent from.
// if the user specifies a "name" or "email" field then this will be used instead.
if($_REQUEST['name'] && $_REQUEST['email']){
    $from = f_safe_string($_REQUEST['name']) . " <".f_safe_string($_REQUEST['email']).">";
}else{
    $from="Contact Website <info@".$_SERVER['HTTP_HOST'].">";
}
// this part checks for required fields:
$missing = array();
if(isset($_REQUEST['required']) && strlen($_REQUEST['required'])){
    $required = array();
    foreach(explode(",",$_REQUEST['required']) as $field){
        if(trim($field)){
            $required [] = trim($field);
        }
    }
}
foreach($required as $req){
    if(!$_REQUEST[$req]){
        $missing [] = $req;
    }
}
// this is the error message that gets displayed 
// when they dont fill in all their required fields, wrap your design around this.
if(count($missing)){ ?>

<!--insert your header here-->
      <h1>Error</h1>
      <p>Required fields are missing, please go back and complete the form.</p>
      <p>&nbsp;</p>
      <p>Your design can be wrapped around this page</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
 <!--insert your footer here-->

    <? 
    die();
}
if($_REQUEST['subject'])$subject = f_safe_string($_REQUEST['subject']);
else $subject = $default_subject;
$boundary='--' . md5( uniqid("formsubmit_boundary") );
$charset="iso-8859-1";
$ctencoding="8bit";
$sep= chr(13) . chr(10);
$disposition="inline";
$header.="From: $from\n";
if($cc)$header.="CC: $cc\n";
if($bcc)$header.="BCC: $bcc\n";
$header.="Mime-Version: 1.0\nContent-Type: multipart/mixed;\n boundary=\"$boundary\"\n";
$header.="Content-Transfer-Encoding: $ctencoding\nX-Mailer: Php/libMailv1.3\r\n\r\n";
// build the message
$message = "This is a multi-part message in MIME format.\n--$boundary\n";
$message .= "Content-Type: text/html; charset=$charset\n";
$message .= "Content-Transfer-Encoding: $ctencoding\n\n";
$message .= "<h2>$email_title:</h2>";
$message .= '<table width="100%">';
foreach($_POST as $pkey => $value){
    if((!in_array(strtolower($pkey),$ignorefields)) && (!in_array(strtolower($pkey),$uploadfiles))){
    	$key = '';
    	$val = '';
        if(is_array($value)){
            $key = ucwords(str_replace("_"," ",$pkey));
            foreach($value as $k=>$v){
                $val .= $k ." = " . $v . "<br>\n";
            }
        }else{
            $key = ucwords(str_replace("_"," ",$pkey));
            $val = $value . "\n";
        }
    	$message .= '<tr style="border-bottom:1px solid #CCCCCC;"><td width="180"><b>' . $key . ':</b></td><td>' . $val . '</td></tr>';
    }
}
$message .= '</table>';
$message .= "\n\n";

foreach($uploadfiles as $filetoupload){
    if(is_file($_FILES[$filetoupload]['tmp_name'])){
     if($_FILES[$filetoupload]['error'] == UPLOAD_ERR_OK) {
        $filename = $_FILES[$filetoupload]['name'];
        $filetype = $_FILES[$filetoupload]['type'];            
        $message .="--$boundary\nContent-type: $filetype ;\n name=\"$filename\"\n";
        $message .="Content-Transfer-Encoding: base64\nContent-Disposition: $disposition;\n  filename=\"$filename\"\n";
        $linesz= filesize( $_FILES[$filetoupload]['tmp_name'])+1;        
        $fp= fopen( $_FILES[$filetoupload]['tmp_name'], 'r' );
        $content2 = chunk_split(base64_encode(fread( $fp, $linesz)));
        fclose($fp);
        $message .= $sep.$content2;
      }
      }
}// end foreach file to upload
mail($to,$subject,$message,$header);
if(isset($_REQUEST['redirect'])){
    $redirect = $_REQUEST['redirect'];
}
header("Location: $redirect");
exit;
?> 