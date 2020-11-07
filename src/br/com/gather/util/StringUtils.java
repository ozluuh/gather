package br.com.gather.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

public class StringUtils {

	public static boolean isNullOrEmpty(String value) {
		return value == null || value.isEmpty();
	}
	
	public static boolean isSizeLessThan(String value, int size) {
		return value.length() < size;
	}
	
	public static boolean isSizeMoreThan(String value, int size) {
		return value.length() > size;
	}
	
	public static boolean isSizeBetween(String value, int start, int end) {
		return value.length() > start && value.length() < end;
	}
	
	public static String decodeUri(String value) {
		try {
			if(Charset.defaultCharset().name().toLowerCase().equals("utf-8")) {
				return URLDecoder.decode(value, "UTF-8");
			} else {
				return URLDecoder.decode(value, "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException e) {
			return value;
		}
	}
}
