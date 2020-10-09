<!DOCTYPE html>
<html lang="en">
<form action = "" method="POST">
	<section class="content-item profile-security">
        <h3>Login</h3>

        <div class="change-password">
          <h4>Enter your Username and Password:</h4>
          <ul>
            <li>
              <fieldset>
                <legend>Username:</legend>
                <input type="password" id="curr-pass" name = "username">
              </fieldset>
            </li>
            <li>
              <fieldset>
                <legend>Password: </legend>
                <input type="password" id="new-pass" name = "passcode">
              </fieldset>
            </li>
          </ul>

        <input type = "submit" name="submit_btn" id = "submit" value = "Login"/>

        </div>

  	</section>
</form>

<!-- <?php
$user_input = $_POST['user'];
$password_input = md5($_POST['pass']);

$file = fopen('details.txt', 'r');

while(!feof($file)){
    $line = fgets($file);
    list($user, $password) = explode(':', $line);
    if(trim($user) == $user_input && trim($password) == $password_input){
        echo 'Logged in';
        break;
    }
}
fclose($file);
?> -->