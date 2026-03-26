//import java.io.*;
//import java.util.ArrayList;

//class DataPoint {

//  String FL_DATE;
//  String MKT_CARRIER;
//  int MKT_CARRIER_FL_NUM;
//  String ORIGIN;
//  String ORIGIN_CITY_NAME;
//  String ORIGIN_STATE_ABR;
//  int ORIGIN_WAC;
//  String DEST;
//  String DEST_CITY_NAME;
//  String DEST_STATE_ABR;
//  int DEST_WAC;
//  int CRS_DEP_TIME;
//  int DEP_TIME;
//  int CRS_ARR_TIME;
//  int ARR_TIME;
//  Boolean CANCELLED;
//  Boolean DIVERTED;
//  int DISTANCE;


//  DataPoint(String FL_DATE, String MKT_CARRIER, int MKT_CARRIER_FL_NUM, String ORIGIN, String ORIGIN_CITY_NAME, String ORIGIN_STATE_ABR, int ORIGIN_WAC, String DEST, String DEST_CITY_NAME,
//    String DEST_STATE_ABR, int DEST_WAC, int CRS_DEP_TIME, int DEP_TIME, int CRS_ARR_TIME, int ARR_TIME, Boolean CANCELLED, Boolean DIVERTED, int DISTANCE)
//  {
//    this.FL_DATE = FL_DATE;
//    this.MKT_CARRIER = MKT_CARRIER;
//    this.MKT_CARRIER_FL_NUM = MKT_CARRIER_FL_NUM;
//    this.ORIGIN = ORIGIN;
//    this.ORIGIN_CITY_NAME = ORIGIN_CITY_NAME;
//    this.ORIGIN_STATE_ABR = ORIGIN_STATE_ABR;
//    this.ORIGIN_WAC = ORIGIN_WAC;
//    this.DEST = DEST;
//    this.DEST_CITY_NAME = DEST_CITY_NAME;
//    this.DEST_STATE_ABR = DEST_STATE_ABR;
//    this.DEST_WAC = DEST_WAC;
//    this.CRS_DEP_TIME = CRS_DEP_TIME;
//    this.DEP_TIME = DEP_TIME;
//    this.CRS_ARR_TIME = CRS_ARR_TIME;
//    this.ARR_TIME = ARR_TIME;
//    this.CANCELLED = CANCELLED;
//    this.DIVERTED = DIVERTED;
//    this.DISTANCE = DISTANCE;
//  }

//  DataPoint()
//  {
//    this.FL_DATE = null;
//    this.MKT_CARRIER = null;
//    this.MKT_CARRIER_FL_NUM = 0;
//    this.ORIGIN = null;
//    this.ORIGIN_CITY_NAME = null;
//    this.ORIGIN_STATE_ABR = null;
//    this.ORIGIN_WAC = 0;
//    this.DEST = null;
//    this.DEST_CITY_NAME = null;
//    this.DEST_STATE_ABR = null;
//    this.DEST_WAC = 0;
//    this.CRS_DEP_TIME = 0;
//    this.DEP_TIME = 0;
//    this.CRS_ARR_TIME = 0;
//    this.ARR_TIME = 0;
//    this.CANCELLED = true;
//    this.DIVERTED = true;
//    this.DISTANCE = 0;
//  }
//}
//ArrayList<DataPoint> dataPoints;

//void setup() {
//  dataPoints = new ArrayList<DataPoint>();

//  String file = "flights2k(1).csv";
//  BufferedReader reader = null;
//  String line = "";
//  int count = 0;


//  try {
//    reader = new BufferedReader(new FileReader(sketchPath(file)));

//    while ((line = reader.readLine()) != null) {

//      if (count > 0) {

//        try {
//          String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");


//          String FL_DATE = parts[0];
//          String MKT_CARRIER = parts[1];

//          int MKT_CARRIER_FL_NUM;
//          if (parts[2] == "") {
//            MKT_CARRIER_FL_NUM = 0;
//          } else {
//            MKT_CARRIER_FL_NUM = Integer.parseInt(parts[2]);
//          }

//          String ORIGIN = parts[3];
//          String ORIGIN_CITY_NAME = parts[4];
//          String ORIGIN_STATE_ABR = parts[5];

//          int ORIGIN_WAC;
//          if (parts[6] == "") {
//            ORIGIN_WAC = 0;
//          } else {
//            ORIGIN_WAC = Integer.parseInt(parts[6]);
//          }

//          String DEST = parts[7];
//          String DEST_CITY_NAME = parts[8];
//          String DEST_STATE_ABR = parts[9];

//          int DEST_WAC;
//          if (parts[10] == "") {
//            DEST_WAC = 0;
//          } else {
//            DEST_WAC = Integer.parseInt(parts[10]);
//          }

//          int CRS_DEP_TIME;
//          if (parts[11] == "") {
//            CRS_DEP_TIME = 0;
//          } else {
//            CRS_DEP_TIME = Integer.parseInt(parts[11]);
//          }

//          int DEP_TIME;
//          if (parts[12] == "") {
//            DEP_TIME = 0;
//          } else {
//            DEP_TIME= Integer.parseInt(parts[12]);
//          }

//          int CRS_ARR_TIME;
//          if (parts[13] == "") {
//            CRS_ARR_TIME = 0;
//          } else {
//            CRS_ARR_TIME = Integer.parseInt(parts[13]);
//          }

//          int ARR_TIME;
//          if (parts[14] == "") {
//            ARR_TIME = 0;
//          } else {
//            ARR_TIME = Integer.parseInt(parts[14]);
//          }

//          boolean CANCELLED;
//          if (parts[15].trim().equals("0")) CANCELLED = false;
//          else CANCELLED = true;
//          boolean DIVERTED;
//          if (parts[16].trim().equals("0")) DIVERTED = false;
//          else DIVERTED = true;
//          int DISTANCE = Integer.parseInt(parts[17]);



//          dataPoints.add (new DataPoint(FL_DATE, MKT_CARRIER, MKT_CARRIER_FL_NUM, ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_WAC, DEST, DEST_CITY_NAME, DEST_STATE_ABR, DEST_WAC, CRS_DEP_TIME, DEP_TIME, CRS_ARR_TIME, ARR_TIME, CANCELLED, DIVERTED, DISTANCE));
//        }
//        catch (Exception e) {
//          System.out.println("bad row " + count + e.getMessage());
//        }
//      }
//      count += 1;
//    }
//  }
//  catch (Exception e) {
//    //e.printStackTrace();
//  }
//  finally {
//    try {
//      if (reader != null) reader.close();
//    }
//    catch (IOException e) {
//      e.printStackTrace();
//    }
//  }

//  System.out.println(count);
//}

//final int ScreenX = 1400;
//final int ScreenY = 800;
//float size = 16;

//void drawFlights(ArrayList<DataPoint> flightsToDisplay) {
//  int y = 120;

//  for (DataPoint f : flightsToDisplay) {

//    String row = f.FL_DATE + " | " + f.MKT_CARRIER + " | " + f.MKT_CARRIER_FL_NUM
//      + f.ORIGIN + " | " + f.ORIGIN_CITY_NAME + " | " + f.ORIGIN_STATE_ABR + " | " +
//      f.ORIGIN_WAC + " | " + f.DEST + " | " + f.DEST_CITY_NAME + " | " + f.DEST_STATE_ABR
//      + " | " + f.DEST_WAC + " | " + f.CRS_ARR_TIME + " | " + f.ARR_TIME + " | "
//      + " | " + f.CANCELLED + " | " + f.DIVERTED + " | " + f.DISTANCE;
//    System.out.println(row);


//    while (textWidth(row) > (ScreenY - 50) ) {
//      size -= 0.5;
//      textSize(size);
//    }

//    text(row, 40, y);

//    y += 25;
//  }
//}


//public ArrayList<DataPoint> getFlightsToDisplay(int page) {
//  ArrayList<DataPoint> flightsToDisplay = new ArrayList<DataPoint>();

//  int amountOfEntriesOnPage = 10;

//  DataPoint holder = new DataPoint();

//  for (int i = 0; i < amountOfEntriesOnPage; i++) {
//    holder = dataPoints.get(page*amountOfEntriesOnPage + i);

//    flightsToDisplay.add(holder);
//  }

//  return flightsToDisplay;
//}



//void settings() {
//  size(ScreenX, ScreenY, P2D);
//}

//void draw() {


//  background(255);
//  displayFilters();
//  float topOffset = 300;        // grid starts 100 down
//  float colW = width / 18.0;   // width of each column
//  float colH = (height - topOffset) / 10.0;  // height of each row

//  stroke(2);
//  strokeWeight(1);

//  // Vertical lines (18 lines for 17 spaces)
//  for (int i = 0; i <= 18; i++) {
//    float x = i * colW;
//    line(x, topOffset, x, height);
//  }

//  // Horizontal lines (11 lines for 10 spaces)
//  for (int j = 0; j <= 10; j++) {
//    float y = topOffset + j * colH;
//    line(0, y, width, y);
//  }

//  ArrayList<DataPoint> flightsToDisplay = getFlightsToDisplay(1);
//  drawFlights(flightsToDisplay);
//}
