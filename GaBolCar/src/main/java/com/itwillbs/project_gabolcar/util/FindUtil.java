package com.itwillbs.project_gabolcar.util;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Random;

public class FindUtil {

public static String getRamdomPassword() {
	char[] charSet = new char[] {
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
			'!', '@', '#', '$', '%', '^', '&' };
	
	StringBuffer key = new StringBuffer();
	SecureRandom sr = new SecureRandom();
	sr.setSeed(new Date().getTime());
	
	int idx = 0;
	int len = charSet.length;
	for (int i=0; i<8; i++) {
		// idx = (int) (len * Math.random());
		idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
		key.append(charSet[idx]);
	}
	
	return key.toString();
}

public static String getRandomNum() {
	
	Random rand = new Random(); 
	String randomNumber = "";
	for(int i=0; i<4; i++) {
		String ran = Integer.toString(rand.nextInt(10)); 
		randomNumber += ran;
	}
	return randomNumber;
}

}
