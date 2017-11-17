package com.aircuve.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpsConnection {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public static String doPost(String urlString, JSONObject jsonParams){
		//HttpsURLConnection conn = null;
		HttpURLConnection conn = null;
		OutputStream outputStream = null;
		InputStream inputStream = null;
		BufferedReader bufferedReader = null;
		String resultString = null;
		
		try {
			
			URL url = new URL(urlString);
			
	        byte[] postDataBytes = jsonParams.toString().getBytes("UTF-8");
	        conn = (HttpURLConnection) url.openConnection();
			//conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(5000);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
			outputStream = conn.getOutputStream();
			outputStream.write(postDataBytes);
			outputStream.flush();
			outputStream.close();

			if(conn.getResponseCode()>201){
				inputStream = conn.getErrorStream();
			}else{
				inputStream = conn.getInputStream();
			}
			bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
			String buf = new String();
			String resultBuf = new String();
			while((buf = bufferedReader.readLine()) != null){
				resultBuf += buf;
			}
			resultString = resultBuf;
			bufferedReader.close();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			return "timeout";
		} finally{
			try {
				if(bufferedReader != null){
					bufferedReader.close();
				}
				if(inputStream != null){
					inputStream.close();
				}
				if(outputStream != null){
					outputStream.close();
				}
				if(conn != null){
					conn.disconnect();
				}
			} catch (Exception e) {
				e.getMessage();
			}
		}

		return resultString;
	}
	
	public static String doGet(String urlString){
		//HttpsURLConnection conn = null;
		HttpURLConnection conn = null;
		OutputStream outputStream = null;
		InputStream inputStream = null;
		BufferedReader bufferedReader = null;
		String resultString = null;
		
		try {
			
			URL url = new URL(urlString);
			
	        conn = (HttpURLConnection) url.openConnection();
			//conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(false);
			conn.setConnectTimeout(5000);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");

			if(conn.getResponseCode()>200){
				inputStream = conn.getErrorStream();
			}else{
				inputStream = conn.getInputStream();
			}
			bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
			String buf = new String();
			String resultBuf = new String();
			while((buf = bufferedReader.readLine()) != null){
				resultBuf += buf;
			}
			resultString = resultBuf;
			bufferedReader.close();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			return "timeout";
		} finally{
			try {
				if(bufferedReader != null){
					bufferedReader.close();
				}
				if(inputStream != null){
					inputStream.close();
				}
				if(outputStream != null){
					outputStream.close();
				}
				if(conn != null){
					conn.disconnect();
				}
			} catch (Exception e) {
				e.getMessage();
			}
		}

		return resultString;
	}
	
		public static String doDelete(String urlString){
		
				//HttpsURLConnection conn = null;
				HttpURLConnection conn = null;
				OutputStream outputStream = null;
				InputStream inputStream = null;
				BufferedReader bufferedReader = null;
				String resultString = null;
				
				try {
					
					URL url = new URL(urlString);		
			        //conn = (HttpsURLConnection) url.openConnection();
					conn = (HttpURLConnection) url.openConnection();
			    	conn.setDoInput(true);
					conn.setDoOutput(false);
					conn.setConnectTimeout(5000);
					conn.setRequestMethod("DELETE");
					conn.setRequestProperty("Content-Type", "application/json");		
					conn.setRequestProperty("Accept", "application/json");
			
					if(conn.getResponseCode()>201){
						inputStream = conn.getErrorStream();
					}else{
						inputStream = conn.getInputStream();
					}
					bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
					String buf = new String();
					String resultBuf = new String();
					while((buf = bufferedReader.readLine()) != null){
						resultBuf += buf;
					}
					resultString = resultBuf;
					bufferedReader.close();
					
				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
					return "timeout";
				} finally{
					try {
						if(bufferedReader != null){
							bufferedReader.close();
						}
						if(inputStream != null){
							inputStream.close();
						}
						if(outputStream != null){
							outputStream.close();
						}
						if(conn != null){
							conn.disconnect();
						}
					} catch (Exception e) {
						e.getMessage();
					}
				}
			
				return resultString; 
			}
			public static String doPut(String urlString, JSONObject jsonParams){
				//HttpsURLConnection conn = null;
				HttpURLConnection conn = null;
				OutputStream outputStream = null;
				InputStream inputStream = null;
				BufferedReader bufferedReader = null;
				String resultString = null;
				
				try {
					
					URL url = new URL(urlString);
					
			        byte[] postDataBytes = jsonParams.toString().getBytes("UTF-8");
			        conn = (HttpURLConnection) url.openConnection();
					//conn = (HttpsURLConnection) url.openConnection();
					conn.setDoInput(true);
					conn.setDoOutput(true);
					conn.setConnectTimeout(5000);
					conn.setRequestMethod("PUT");
					conn.setRequestProperty("Content-Type", "application/json");
					conn.setRequestProperty("Accept", "application/json");
					conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
					outputStream = conn.getOutputStream();
					outputStream.write(postDataBytes);
					outputStream.flush();
					outputStream.close();
		
					if(conn.getResponseCode()>201){
						inputStream = conn.getErrorStream();
					}else{
						inputStream = conn.getInputStream();
					}
					bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
					String buf = new String();
					String resultBuf = new String();
					while((buf = bufferedReader.readLine()) != null){
						resultBuf += buf;
					}
					resultString = resultBuf;
					bufferedReader.close();
					
				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
					return "timeout";
				} finally{
					try {
						if(bufferedReader != null){
							bufferedReader.close();
						}
						if(inputStream != null){
							inputStream.close();
						}
						if(outputStream != null){
							outputStream.close();
						}
						if(conn != null){
							conn.disconnect();
						}
					} catch (Exception e) {
						e.getMessage();
					}
				}
		
				return resultString;
			}
}
