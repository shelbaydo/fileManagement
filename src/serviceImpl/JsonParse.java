package serviceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

public class JsonParse {
	 public static JSONObject getParameters(HttpServletRequest request)
     throws UnsupportedEncodingException, IOException {
	BufferedReader br = new BufferedReader(new InputStreamReader(
			(ServletInputStream) request.getInputStream(), "utf-8"));
	StringBuffer sb = new StringBuffer("");
	String temp;
	while ((temp = br.readLine()) != null) {
		sb.append(temp);
	}
	br.close();
	String acceptjson = sb.toString();
	JSONObject jo = null;
	if (acceptjson != "") {
		jo = JSONObject.fromObject(acceptjson.trim());
	}
		return jo;	
	}
}

