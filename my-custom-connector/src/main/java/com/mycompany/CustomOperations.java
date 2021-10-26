package com.mycompany;

import static org.mule.runtime.extension.api.annotation.param.MediaType.ANY;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;

import org.mule.runtime.extension.api.annotation.Alias;
import org.mule.runtime.extension.api.annotation.param.Config;
import org.mule.runtime.extension.api.annotation.param.MediaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class CustomOperations {
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomOperations.class);
	
	@MediaType(value = ANY, strict = false)
	@Alias("GET")
	public String getCall(@Config CustomConfiguration c) {
		LOGGER.info("Sending a get request......");
		String response = null;
		String protocol = c.getProtocol().equals("HTTPS") ? "https://" : "http://";
		try {
			URL url = new URL(protocol + c.getHost() + c.getBasepath());
			URLConnection con = url.openConnection();
			con.addRequestProperty("User-Agent", "Mozilla");
			response = getHttpResponse(con);
			LOGGER.info("Response Received");
			
		}
		catch(Exception e) {
			LOGGER.error("Error occured.....");
			e.printStackTrace();
		}
		return response;
	}
	
	private String getHttpResponse(URLConnection con) throws UnsupportedEncodingException, IOException{
		StringBuilder response = null;
		try(BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"))){
			response = new StringBuilder();
			String responseLine = null;
			while((responseLine = br.readLine())!=null) {
				response.append(responseLine.trim());
			}
		}
		return response.toString();
	}

}
