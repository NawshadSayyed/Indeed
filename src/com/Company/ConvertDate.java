package com.Company;

import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import sun.util.resources.cldr.af.CalendarData_af_NA;

public class ConvertDate {

	public static void main(String[] args) throws java.text.ParseException {
		Calendar c= Calendar.getInstance();
		System.out.println(c);
		Date dt = StringtoDateConvertion("2019-01-17");

		System.out.println(dt);
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd");
		System.out.println(ft.format(dt));
	
		
		// for current date and time
		 DateFormat dateformate = new SimpleDateFormat("yyyy/MM/dd");	
		    Date d1 = new Date();
		    System.out.println(dateformate.format(d1));
	
	
		   Date dt1 = new Date();
		   System.out.println(dt1);
		    
		   Calendar c1 = Calendar.getInstance();
		   c1.add(Calendar.YEAR, 1);
		   System.out.println( new SimpleDateFormat("yyyy/MM/dd").format(c1.getTime()) );
  
	}

	public static Date StringtoDateConvertion(String date) throws java.text.ParseException 
	{

		System.out.println(date.length());
		char s = date.charAt(4);
		Date dt = null;
		DateFormat formatter1 = null;
		switch (s) {
		case '-':
			/* date should be in yyyy /MM /dd formate */
			if (date.length() == 19) {
				formatter1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			} else {
				formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			}
			try {
				dt = (Date) formatter1.parse(date);
				return dt;
			} catch (ParseException e) {

				e.printStackTrace();
			}

			break;
		case '/':
			/* date should be in yyyy /mdd formate */
			if (date.length() == 19) {
				formatter1 = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			} else {
				formatter1 = new SimpleDateFormat("yyyy/MM/dd");
			}
			try {
				dt = (Date) formatter1.parse(date);
				return dt;
			} catch (ParseException e) {
				e.printStackTrace();
			}

			break;
		default:
			System.out.println("Please check Date Formate");
			return dt;
		}

		return dt;

	}

}
