import java.io.*;
import java.util.ArrayList;
String searchBy = "";
boolean filterSelected = true;
SearchBar departure;
SearchBar search;



  ArrayList<DataPoint> filteredFlights; //For later
  ArrayList<DataPoint> filterByFlight(){ //Function that filters
  ArrayList<DataPoint> filteredFlights = new ArrayList<DataPoint>(); //New arrayList
  
  for (DataPoint f : dataPoints){ //For loop
  if (f.ORIGIN.equals(searchBy)){ //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
    filteredFlights.add(f);
    
  }
  
  
  }
  return filteredFlights;  
  }





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
 
  departure = new SearchBar(50, 100, 340, 75,"Departure", true);
  search = new SearchBar(415,100,140,75,"Search", false);
  
   
  
  
  dataPoints = new ArrayList<DataPoint>();
  
  
  
  String file = "flights2k.csv";
  BufferedReader reader = null;
  String line = "";
  int count = 0;

  
  try {
    reader = new BufferedReader(new FileReader(sketchPath(file)));
    
    while ((line = reader.readLine()) != null) {
      
      if (count > 0) {
        
      try{
      String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");
      

      String FL_DATE = parts[0];
      String MKT_CARRIER = parts[1]; 
      
      int MKT_CARRIER_FL_NUM;
      if (parts[2] == "") {MKT_CARRIER_FL_NUM = 0;}
      else {MKT_CARRIER_FL_NUM = Integer.parseInt(parts[2]);}
      
      String ORIGIN = parts[3];
      String ORIGIN_CITY_NAME = parts[4];
      String ORIGIN_STATE_ABR = parts[5];
      
      int ORIGIN_WAC;
      if (parts[6] == "") {ORIGIN_WAC = 0;}
      else {ORIGIN_WAC = Integer.parseInt(parts[6]);}

      String DEST = parts[7];
      String DEST_CITY_NAME = parts[8];
      String DEST_STATE_ABR = parts[9];
      
      int DEST_WAC;
      if (parts[10] == "") {DEST_WAC = 0;}
      else {DEST_WAC = Integer.parseInt(parts[10]);}
      
      int CRS_DEP_TIME; 
      if (parts[11] == "") {CRS_DEP_TIME = 0;}
      else {CRS_DEP_TIME = Integer.parseInt(parts[11]);}
      
      int DEP_TIME;
      if (parts[12] == "") {DEP_TIME = 0;}
      else {DEP_TIME= Integer.parseInt(parts[12]);}
      
      int CRS_ARR_TIME;
      if (parts[13] == "") {CRS_ARR_TIME = 0;}
      else {CRS_ARR_TIME = Integer.parseInt(parts[13]);}
      
      int ARR_TIME;
      if (parts[14] == "") {ARR_TIME = 0;}
      else {ARR_TIME = Integer.parseInt(parts[14]);}
      
      boolean CANCELLED;
      if (parts[15].trim().equals("0")) CANCELLED = false;
      else CANCELLED = true;
      boolean DIVERTED;
      if (parts[16].trim().equals("0")) DIVERTED = false;
      else DIVERTED = true;
      int DISTANCE = Integer.parseInt(parts[17]);
      

      
      dataPoints.add (new DataPoint(FL_DATE,MKT_CARRIER,MKT_CARRIER_FL_NUM,ORIGIN,ORIGIN_CITY_NAME,ORIGIN_STATE_ABR,ORIGIN_WAC,DEST,DEST_CITY_NAME,DEST_STATE_ABR,DEST_WAC,CRS_DEP_TIME,DEP_TIME,CRS_ARR_TIME,ARR_TIME,CANCELLED,DIVERTED,DISTANCE));
      } catch (Exception e) {
        System.out.println("bad row " + count + e.getMessage());
      }
          
      
      }
      count += 1;
      
    }

  }
  catch (Exception e) {
    //e.printStackTrace();
  }
  finally {
    try {
      if (reader != null) reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  System.out.println(count);
  filteredFlights = filterByFlight(); //Adding to the array list created at the top
}

final int ScreenX = 900;
final int ScreenY = 900;
float size = 16;

void drawFlights(){
   int y = 120;
   
   
    
    if (filterSelected == false){
 
    
  for (DataPoint f : dataPoints) {
     
    String row = f.FL_DATE + " | " + f.MKT_CARRIER + " | " + f.MKT_CARRIER_FL_NUM
    + f.ORIGIN + " | " + f.ORIGIN_CITY_NAME + " | " + f.ORIGIN_STATE_ABR + " | " +
    f.ORIGIN_WAC + " | " + f.DEST + " | " + f.DEST_CITY_NAME + " | " + f.DEST_STATE_ABR
    + " | " + f.DEST_WAC + " | " + f.CRS_ARR_TIME + " | " + f.ARR_TIME + " | "
    + " | " + f.CANCELLED + " | " + f.DIVERTED + " | " + f.DISTANCE;
    System.out.println(row);
    
   
   
        size = 16;             // reset each row
        textSize(size);        // apply a default size
    
    while (textWidth(row) > (ScreenY - 50) && size > 8) {  // add minimum size
        size -= 0.5;
        textSize(size);
    }

  }
  }
    
  if (filterSelected == true){
  for (DataPoint f : filteredFlights) { 
     
    String row = f.FL_DATE + " | " + f.MKT_CARRIER + " | " + f.MKT_CARRIER_FL_NUM
    + f.ORIGIN + " | " + f.ORIGIN_CITY_NAME + " | " + f.ORIGIN_STATE_ABR + " | " +
    f.ORIGIN_WAC + " | " + f.DEST + " | " + f.DEST_CITY_NAME + " | " + f.DEST_STATE_ABR
    + " | " + f.DEST_WAC + " | " + f.CRS_ARR_TIME + " | " + f.ARR_TIME + " | "
    + " | " + f.CANCELLED + " | " + f.DIVERTED + " | " + f.DISTANCE;
    System.out.println(row);
    
   
    
    size = 16;        // reset font size before each row
    textSize(size);
    
    while (textWidth(row) > (ScreenY - 50) && size > 8) {
        size -= 0.5;
        textSize(size);
    }

   
    text(row, 40, y);

    y += 25;
    
  }
  }


 
 

}

void settings(){
  size(ScreenX, ScreenY);
}

void draw() {
  fill(0,0,230);
  noStroke();
  rect(0,0,width,height/3); //departure
  
  fill(255);
  noStroke();
  rect(0,height/3,width,height);//search
  
  search.display();//display search bar
  departure.display();//display des bar
  drawFlights();
}

void mousePressed(){
  search.handleClick();
  departure.handleClick();
  
  if (search.active) {
    searchBy = departure.getText();
    println("SEARCH CLICKED! Departure = " + searchBy);
    filteredFlights = filterByFlight(); //Redo flights
    departure.typedText = "";
  }

  
}
void keyPressed(){
   // Only departure bar receives typing not search
  departure.handleTyping(key);
}
