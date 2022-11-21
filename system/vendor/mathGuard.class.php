<?
class MathGuard {

	/** A main hashing function: concat of user's answer, hour and the additional prime number (default 37) */
	static function encode($input, $prime) {
		//date_default_timezone_set("America/Chicago");
		return md5($input.date("H").$prime);
	}

	/** This function generates the hash code from the two numbers 
	 * @param $a 	first number
	 * @param $b	second sumber
	 * @param $prime	additional number to encode with
	 * */
	static function generateCode($a, $b, $prime) {
		$code = MathGuard::encode($a + $b, $prime);
		return $code;
	}

	/** This function checks whether the answer and generated security code match 
	 * @param $mathguard_answer		answer the user has entered
	 * @param $mathguard_code		hashcode the mathguard has generated
	 */
	static function checkResult($mathguard_answer, $mathguard_code, $prime = 37) {

		
		$result_encoded = MathGuard::encode($mathguard_answer, $prime);
		
		//echo("prime; $prime, $result_encoded <br/>");
		//echo("prime; $prime, $mathguard_code");
		
		if ($result_encoded == $mathguard_code)
			return true;
		else
			return false;

	}

	/** this function inserts the two math term into your form, the parameter is optional */
	static function insertQuestion($prime = 37) { //default prime is 37, you can change it when specifying the different parameter
		$a = rand() % 10; // generates the random number
		$b = rand() % 10; // generates the random number
		$code = MathGuard :: generateCode($a, $b, $prime);
		return ("<label>$a + $b =</label>
				<input type='text' name='mathguard_answer' size='2' class=\"validate['required'] small\" />
				<div id=\"captchaErr\" class=\"valid-error hide\" ><p>".CAPTCHA_ERR."</p></div><input type='hidden' name='mathguard_code' value='$code' />");

	}

}
?>