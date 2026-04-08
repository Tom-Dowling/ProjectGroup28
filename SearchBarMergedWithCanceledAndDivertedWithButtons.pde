import java.io.*;
import java.util.ArrayList;
String searchBy = "";
boolean filterSelected = true;
SearchBar departure;
SearchBar search;
RadioButton[] buttons;
MapButton[] mapButtons;
RadioButton backButton;
RadioButton confirmButton;
boolean filterByCancelled = true; 
boolean filterByDiverted = false;
boolean flipListOrder = false;
boolean mapMode = false;
PImage map;

  ArrayList<DataPoint> filteredFlights; //For later
  ArrayList<DataPoint> filterByFlight(){ //Function that filters
  ArrayList<DataPoint> filteredFlights = new ArrayList<DataPoint>(); //New arrayLi  st
  
  if(flipListOrder ==false) {
  for (DataPoint f : dataPoints){ //For loop
  if (f.ORIGIN.equalsIgnoreCase(searchBy.trim()) //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
  && ((f.CANCELLED && filterByCancelled) || (!f.CANCELLED && !filterByCancelled)) //Check if cancelled filter is on and if so if it's cancelled
  && ((f.DIVERTED && filterByDiverted) || (!f.DIVERTED && !filterByDiverted)))  //Check if diverted filter is on and if so if it's diverted
  {
    filteredFlights.add(f);
    
  }
  
  
  }}
  
  else{
  
  for (int i = dataPoints.size() - 1; i >=0 ; i-- ){ //For loop
  
  DataPoint f = dataPoints.get(i);
  
  if (f.ORIGIN.equalsIgnoreCase(searchBy.trim()) //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
  && ((f.CANCELLED && filterByCancelled) || (!f.CANCELLED && !filterByCancelled)) //Check if cancelled filter is on and if so if it's cancelled
  && ((f.DIVERTED && filterByDiverted) || (!f.DIVERTED && !filterByDiverted)))  //Check if diverted filter is on and if so if it's diverted
  {
    filteredFlights.add(f);
    
  }
  
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
 map = loadImage("map.png");
  departure = new SearchBar(50, 100, 340, 75,"Departure", true);
  search = new SearchBar(415,100,140,75,"Search", false);
  buttons = new RadioButton[] {
  new RadioButton(50, 50, 220, 42, "Show cancelled flights"),
  new RadioButton(290, 50, 220, 42, "Show diverted flights"),
  new RadioButton(530, 50, 220, 42, "Flip list"),
  new RadioButton(770, 50, 120, 42, "Map view"),
  };
  mapButtons = new MapButton[] {

  new MapButton(200, 140, 15),   // PDX – Oregon
  new MapButton(200, 200, 15),   // SEA – Washington
  new MapButton(230, 330, 15),   // LAS – Nevada
  new MapButton(140, 330, 15),   // LAX – California
  new MapButton(350, 340, 15),   // SLC – Utah
  new MapButton(350, 460, 15),   // PHX – Arizona
  new MapButton(460, 460, 15),   // ABQ – New Mexico
  new MapButton(470, 370, 15),   // DEN – Colorado
  new MapButton(470, 180, 15),   // BZN – Montana
  new MapButton(300, 220, 15),   // BOI – Idaho
  new MapButton(620, 180, 15),   // FAR – North Dakota
  new MapButton(650, 570, 15),   // DFW – Texas
  new MapButton(510, 690, 15),   // HNL – Hawaii
  new MapButton(230, 600, 15),   // ANC – Alaska
  new MapButton(740, 200, 15),   // MSP – Minnesota
  new MapButton(790, 400, 15),   // STL – Missouri
  new MapButton(810, 560, 15),   // MSY – Louisiana
  new MapButton(840, 240, 15),   // MKE – Wisconsin
  new MapButton(870, 350, 15),   // ORD – Illinois
  new MapButton(960, 260, 15),   // DTW – Michigan
  new MapButton(1020, 340, 15),  // CMH – Ohio
  new MapButton(940, 350, 15),   // IND – Indiana
  new MapButton(980, 450, 15),   // BNA – Tennessee
  new MapButton(880, 530, 15),   // JAN – Mississippi
  new MapButton(960, 530, 15),   // BHM – Alabama
  new MapButton(1040, 530, 15),  // ATL – Georgia
  new MapButton(1110, 630, 15),  // MCO – Florida
  new MapButton(1110, 430, 15),  // CLT – North Carolina
  new MapButton(1130, 380, 15),  // DCA – Virginia
  new MapButton(1165, 340, 15),  // DCA – Washington DC
  new MapButton(1205, 380, 15),  // BWI – Maryland
  new MapButton(1130, 300, 15),  // PHL – Pennsylvania
  new MapButton(1213, 320, 15),  // EWR – New Jersey
  new MapButton(1248, 265, 15),  // BDL – Connecticut
  new MapButton(1260, 245, 15),  // BOS – Massachusetts
  new MapButton(1180, 245, 15),  // JFK – New York
  new MapButton(1227, 215, 15),  // BTV – Vermont
  };
  backButton = new RadioButton(50, 20, 120, 42, "Back");
  confirmButton = new RadioButton(200, 20, 120, 42, "Confirm");
   
  
  
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

final int ScreenX = 1400;
final int ScreenY = 1400;
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
     
    fill(0);
    textAlign(LEFT, BOTTOM);
    textSize(14);

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
  if (filteredFlights.size() == 0 && filterSelected == true) {
    fill(0);
    textAlign(LEFT, BOTTOM);
    textSize(14);
    text("No flights found for \"" + searchBy + "\"", 20, 20);
    
}

 
 

}
String[] mapAirports = {
  "SEA",   // Washington
  "PDX",   // Oregon
  "LAS",   // Nevada
  "LAX",   // California
  "SLC",   // Utah
  "PHX",   // Arizona
  "ABQ",   // New Mexico
  "DEN",   // Colorado 
  "BZN",   // Montana
  "BOI",   // Idaho
  "FAR",   // North Dakota  
  "DFW",   // Texas
  "HNL",   // Hawaii
  "ANC",   // Alaska
  "MSP",   // Minnesota
  "STL",   // Missouri
  "MSY",   // Louisiana
  "MKE",   // Wisconsin
  "ORD",   // Illinois
  "DTW",   // Michigan
  "CMH",   // Ohio
  "IND",   // Indiana
  "BNA",   // Tennessee
  "JAN",   // Mississippi
  "BHM",   // Alabama
  "ATL",   // Georgia
  "MCO",   // Florida
  "CLT",   // North Carolina
  "DCA",   // Virginia
  "DCA",   // Washington DC
  "BWI",   // Maryland
  "PHL",   // Pennsylvania
  "EWR",   // New Jersey
  "BDL",   // Connecticut
  "BOS",   // Massachusetts
  "JFK",   // New York
  "BTV",   // Vermont
};


void settings(){
  size(ScreenX, ScreenY);
 
  
}

void draw() {
  
  
  
      if (mapMode) {
        drawMapMode();
      } else {
        drawListMode();
      }    
}

void drawListMode(){
  fill(0,0,230);
  noStroke();
  rect(0,0,width,height/3); //departure
  
  fill(255);
  noStroke();
  rect(0,height/3,width,height);//search
  
  
  search.display();//display search bar
  departure.display();//display des bar
  for (RadioButton btn : buttons) {
    btn.display();
  }
  drawFlights();
}

void drawMapMode(){
  image(map, 0, 0, 1400, 800);
  backButton.display();
  confirmButton.display();
  


  stroke(5);
  fill(0);
  for (MapButton btn : mapButtons) {
  btn.display();
}
    
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
  if (!mapMode) {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].handleClick()) {
      
      
    if (i == 0) {             
     buttons[1].filterSelected = false;  
    }
    else if (i == 1) {         
     buttons[0].filterSelected = false; 
    }
    
    else if (i == 3) {  
        mapMode = buttons[3].filterSelected;
    }
    else if (i == 4) {  
        mapMode = buttons[4].filterSelected;
    }


    }
  filterByCancelled = buttons[0].filterSelected; //Update button
  filterByDiverted = buttons[1].filterSelected; //Update button
  flipListOrder = buttons[2].filterSelected; //Update button
  filteredFlights = filterByFlight();
  }
  }
  
  if (mapMode) {
  for (int i = 0; i < mapButtons.length; i++) {
    if (mapButtons[i].handleClick()) {
      
      // make only one selected
      for (int j = 0; j < mapButtons.length; j++) {
        if (j != i) mapButtons[j].filterSelected = false;
      }

 
    }
    if (backButton.handleClick()) {
        mapMode = false;
        buttons[3].filterSelected = false;
    }
    
     if (confirmButton.handleClick()) {

    for (int l = 0; l < mapButtons.length; l++) {
        if (mapButtons[l].filterSelected) {
  
          searchBy = mapAirports[l];   // 🔥 THIS is the key line
          println("Selected airport: " + searchBy);
  
          filteredFlights = filterByFlight();
          break;
        }
    }
    mapMode = false;
    buttons[3].filterSelected = false;
  }
  }
}



  
}
void keyPressed(){
   // Only departure bar receives typing not search
  departure.handleTyping(key);
}
