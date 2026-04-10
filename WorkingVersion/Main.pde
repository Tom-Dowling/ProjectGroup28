import java.io.*;
import java.util.ArrayList;

UIHandler benUI;
int planeX;
boolean movePlane;

// Search bars for filtering flights
SearchBar departure; // user types departure airport
SearchBar search; // triggers search
String searchBy = ""; //Stores the airport code being searched E.g. "JFK"

// Filter toggles
boolean filterSelected = false;
boolean filterByCancelled = false; 
boolean filterByDiverted = false;
boolean flipList = false; 
boolean searchByState = false; //Toggles search mode

// Screens
final String HOME     = "home";
final String MAP      = "map";
final String BARCHART = "barchart";
String screenState = HOME;

// ArrayLists
ArrayList<DataPoint> filteredFlights;
ArrayList<DataPoint> dataPoints;

//Buttons
RadioButton[] buttons;
MapButton[] mapButtons;
RadioButton backButton;
RadioButton confirmButton;
RadioButton sortMostRecent;
RadioButton barChartScreen;
RadioButton returnFromBarChart;

PImage map; //Image of the map

public float NY = 0.0;
public float CA = 0.0;
public float FL = 0.0;
public float VA = 0.0;
public float WA = 0.0;
public float IL = 0.0;
public float TX = 0.0;
public float HI = 0.0;
public float OR = 0.0;
public float NM = 0.0;
public float NJ = 0.0;

public float initialNY = 0.0;
public float initialCA = 0.0;
public float initialFL = 0.0;
public float initialVA = 0.0;
public float initialWA = 0.0;
public float initialIL = 0.0;
public float initialTX = 0.0;
public float initialHI = 0.0;
public float initialOR = 0.0;
public float initialNM = 0.0;
public float initialNJ = 0.0;

public float jan1 = 0.0;
public float jan2 = 0.0;
public float jan3 = 0.0;
public float jan4 = 0.0;
public float jan5 = 0.0;
public float jan6 = 0.0;

public float initialJan1 = 0.0;
public float initialJan2 = 0.0;
public float initialJan3 = 0.0;
public float initialJan4 = 0.0;
public float initialJan5 = 0.0;
public float initialJan6 = 0.0;


int currentBarChart = 1;



int currentPage = 0;
int pageSize    = 10;

final int ScreenX = 1400;
final int ScreenY = 800;
float size = 16;


void settings() {
  size(ScreenX, ScreenY, P2D);
}

void setup() {
  benUI = new UIHandler();
  planeX =1150;
  movePlane = false;

  // Loading map image
  map = loadImage("map.png");

 // Creating search UI
  departure = new SearchBar(50, 100, 340, 75,"Departure", true);
  search = new SearchBar(415,100,140,75,"Search", false);

  // Sorting button
  sortMostRecent = new RadioButton(1000, 170, 220, 42, "Sort by most recent");

  // Navigation buttons
  barChartScreen = new RadioButton(700, 80, 100, 100, "Bar chart");
  returnFromBarChart = new RadioButton(20, 3 , 100, 35, "Return to home"); 

// Filter + navigation buttons
   buttons = new RadioButton[] {
    new RadioButton(1000, 50, 220, 42, "Show cancelled flights"),
    new RadioButton(1000, 110, 220, 42, "Show diverted flights"),
    new RadioButton(850, 80, 100, 100, "Map View")
   };
   
   

  dataPoints = CSVToDataPoint("flights_full (1).csv", filterByCancelled, filterByDiverted);
  filteredFlights = filterByFlight();

  // Map buttons
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

  //Navigation buttons
  backButton = new RadioButton(50, 20, 120, 42, "Back");
  confirmButton = new RadioButton(200, 20, 120, 42, "Confirm");
}



public ArrayList<DataPoint> getFlightsToDisplay(int page) {
  ArrayList<DataPoint> flightsToDisplay = new ArrayList<DataPoint>();
  DataPoint holder = new DataPoint();
  
  int amountOfEntriesOnPage = 10;
  if (filterSelected & (filteredFlights.size() < amountOfEntriesOnPage)) { 
      amountOfEntriesOnPage = filteredFlights.size();
  }

  for (int i = 0; i < amountOfEntriesOnPage; i++) {
    if (filterSelected) {
      if ((page * amountOfEntriesOnPage + i) >= filteredFlights.size()) continue;
      holder = filteredFlights.get(page * amountOfEntriesOnPage + i);}
    else{
      if ((page * amountOfEntriesOnPage + i) >= dataPoints.size()) continue;
      holder = dataPoints.get(page * amountOfEntriesOnPage + i);
      }
      
      
      flightsToDisplay.add(holder);
  }

  return flightsToDisplay;
}

public ArrayList<DataPoint> filterByFlight() { //Function that filters
  ArrayList<DataPoint> filteredFlights = new ArrayList<DataPoint>(); //New arrayList
  if (searchByState == false) {
    if (flipList ==false) {
      for (DataPoint f : dataPoints) { //For loop
        if (!searchBy.trim().equals("")) {
          if (f.ORIGIN.equalsIgnoreCase(searchBy.trim()) //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
            && (!filterByCancelled || f.CANCELLED)
            && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        } else {
          if ((!filterByCancelled || f.CANCELLED) && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
           }
         }
       }        
    }     
        }
     else {
      for (int i = dataPoints.size() - 1; i >=0; i-- ) { //For loop
        DataPoint f = dataPoints.get(i);
        if (!searchBy.trim().equals("")) {
          if (f.ORIGIN.equalsIgnoreCase(searchBy.trim()) //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
            && (!filterByCancelled || f.CANCELLED)
            && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        } else {
          if ((!filterByCancelled || f.CANCELLED) && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        }
      }
    }

    return filteredFlights;
  }
    else {
    if (flipList ==false) {
      for (DataPoint f : dataPoints) { //For loop
        if (!searchBy.trim().equals("")) {
          if (f.ORIGIN_STATE_ABR.equalsIgnoreCase(searchBy.trim()) //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
            && (!filterByCancelled || f.CANCELLED)
            && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        } else {
          if ((!filterByCancelled || f.CANCELLED) && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        }
      }
    } else {
      for (int i = dataPoints.size() - 1; i >=0; i-- ) { //For loop
        DataPoint f = dataPoints.get(i);
        if (!searchBy.trim().equals("")) {
          if (f.ORIGIN_STATE_ABR.equalsIgnoreCase(searchBy.trim()) //If the origin is JFK then add it. Replacable with a variable when sorting by more flights
            && (!filterByCancelled || f.CANCELLED)
            && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        } else {
          if ((!filterByCancelled || f.CANCELLED) && (!filterByDiverted || f.DIVERTED))
          {
            filteredFlights.add(f);
              switch (f.DEST_STATE_ABR) {
              case "CA": CA++; break;
              case "NY": NY++; break;
              case "FL": FL++; break;
              case "VA": VA++; break;
              case "WA": WA++; break;
              case "IL": IL++; break;
              case "HI": HI++; break;
              case "TX": TX++; break;
              case "OR": OR++; break;
              case "NM": NM++; break;
              case "NJ": NJ++; break;
              }
                
              switch (f.dateNumber) {
              case "1": jan1++; break;
              case "2": jan2++; break;
              case "3": jan3++; break;
              case "4": jan4++; break;
              case "5": jan5++; break;
              case "6": jan6++; break;
              }
          }
        }
      }
    }

    return filteredFlights;
  }
}
