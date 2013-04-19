package com.jrtcms.web.util;

/*jadclipse*/// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
//Jad home page: http://www.kpdus.com/jad.html
//Decompiler options: packimports(3) radix(10) lradix(10) 
//Source File Name:   CnToSpell.java



import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class test
{

 public static void main(String[] args) throws IOException {
	try {
		Runtime rt = Runtime.getRuntime();   
        Process p = rt.exec("xcopy /e /y /i D:\\template D:\\tomcat6\\wtpwebapps\\jrtcms\\template");

	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
}
}


/*
	DECOMPILATION REPORT

	Decompiled from: F:\workspace\jrtcms\WebContent\WEB-INF\lib\CnToSpell.jar
	Total time: 47 ms
	Jad reported messages/errors:
	Exit status: 0
	Caught exceptions:
*/