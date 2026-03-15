import java.io.*;
import java.util.ArrayList;

class DataPoint{
  
String FL_DATE;
String MKT_CARRIER;
int MKT_CARRIER_FL_NUM;
String ORIGIN;
String ORIGIN_CITY_NAME;
String ORIGIN_STATE_ABR;
int ORIGIN_WAC;
String DEST;
String DEST_CITY_NAME;
String DEST_STATE_ABR;
int DEST_WAC;
int CRS_DEP_TIME;
int DEP_TIME;
int CRS_ARR_TIME;
int ARR_TIME;
Boolean CANCELLED;
Boolean DIVERTED;
int DISTANCE;
  
  
DataPoint(String FL_DATE,String MKT_CARRIER,int MKT_CARRIER_FL_NUM,String ORIGIN,String ORIGIN_CITY_NAME,String ORIGIN_STATE_ABR,int ORIGIN_WAC,String DEST,String DEST_CITY_NAME,
String DEST_STATE_ABR,int DEST_WAC,int CRS_DEP_TIME,int DEP_TIME,int CRS_ARR_TIME,int ARR_TIME,Boolean CANCELLED,Boolean DIVERTED,int DISTANCE)
{
  this.FL_DATE = FL_DATE;
  this.MKT_CARRIER = MKT_CARRIER;
  this.MKT_CARRIER_FL_NUM = MKT_CARRIER_FL_NUM;
  this.ORIGIN = ORIGIN;
  this.ORIGIN_CITY_NAME = ORIGIN_CITY_NAME;
  this.ORIGIN_STATE_ABR = ORIGIN_STATE_ABR;
  this.ORIGIN_WAC = ORIGIN_WAC;
  this.DEST = DEST;
  this.DEST_CITY_NAME = DEST_CITY_NAME;
  this.DEST_STATE_ABR = DEST_STATE_ABR;
  this.DEST_WAC = DEST_WAC;
  this.CRS_DEP_TIME = CRS_DEP_TIME;
  this.DEP_TIME = DEP_TIME;
  this.CRS_ARR_TIME = CRS_ARR_TIME;
  this.ARR_TIME = ARR_TIME;
  this.CANCELLED = CANCELLED;
  this.DIVERTED = DIVERTED;
  this.DISTANCE = DISTANCE;
 
}


}
ArrayList<DataPoint> dataPoints;

void setup() {
  dataPoints = new ArrayList<DataPoint>();
  
  String file = "flights2k(1).csv";
  BufferedReader reader = null;
  String line = "";

  ArrayList<String> entries =  new ArrayList<String>();


  try {
    reader = new BufferedReader(new FileReader(sketchPath(file)));
    int count = 0;

    while ((line = reader.readLine()) != null) {
      count++;
      entries.add(line);
    }

    for (int i = 0; i < entries.size(); i++) {
      String entry = entries.get(i);
      String[] parts = entry.split(",");

      String FL_DATE = parts[0];
      String MKT_CARRIER = parts[1]; 
      int MKT_CARRIER_FL_NUM = Integer.parseInt(parts[2]);
      String ORIGIN = parts[3];
      String ORIGIN_CITY_NAME = parts[4];
      String ORIGIN_STATE_ABR = parts[5];
      int ORIGIN_WAC = Integer.parseInt(parts[6]);
      String DEST = parts[7];
      String DEST_CITY_NAME = parts[8];
      String DEST_STATE_ABR = parts[9];
      int DEST_WAC = Integer.parseInt(parts[10]);
      int CRS_DEP_TIME = Integer.parseInt(parts[11]);
      int DEP_TIME = Integer.parseInt(parts[12]);
      int CRS_ARR_TIME = Integer.parseInt(parts[13]);
      int ARR_TIME = Integer.parseInt(parts[14]);
      boolean CANCELLED;
      if(parts[15] == "0" ) CANCELLED = false;
      else CANCELLED = true;
      boolean DIVERTED;
      if(parts[16] == "0" ) DIVERTED = false;
      else DIVERTED = true;
      int DISTANCE = Integer.parseInt(parts[17]);
      
      dataPoints.add (new DataPoint(FL_DATE,MKT_CARRIER,MKT_CARRIER_FL_NUM,ORIGIN,ORIGIN_CITY_NAME,ORIGIN_STATE_ABR,ORIGIN_WAC,DEST,DEST_CITY_NAME,DEST_STATE_ABR,DEST_WAC,CRS_DEP_TIME,DEP_TIME,CRS_ARR_TIME,ARR_TIME,CANCELLED,DIVERTED,DISTANCE));
      
      
    }


    System.out.println("Total rows read: " + count);
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  finally {
    try {
      if (reader != null) reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
