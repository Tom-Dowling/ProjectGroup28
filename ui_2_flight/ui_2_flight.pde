import java.io.*;
import java.util.ArrayList;

class DataPoint {

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

  DataPoint(String FL_DATE, String MKT_CARRIER, int MKT_CARRIER_FL_NUM, String ORIGIN,
    String ORIGIN_CITY_NAME, String ORIGIN_STATE_ABR, int ORIGIN_WAC, String DEST,
    String DEST_CITY_NAME, String DEST_STATE_ABR, int DEST_WAC, int CRS_DEP_TIME,
    int DEP_TIME, int CRS_ARR_TIME, int ARR_TIME, Boolean CANCELLED, Boolean DIVERTED,
    int DISTANCE) {

   
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
  size(1400, 800, P2D);
  dataPoints = new ArrayList<DataPoint>();

  String file = "flights2k(1).csv";
  BufferedReader reader = null;
  String line = "";
  int count = 0;

  try {
    reader = new BufferedReader(new FileReader(sketchPath("data/" + file)));

    while ((line = reader.readLine()) != null) {

      if (count > 0) {

        try {
          String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");

          // SAFETY CHECK
          if (parts.length < 18) {
            println("Skipping bad row " + count + " (columns = " + parts.length + ")");
            continue;
          }

          String FL_DATE = parts[0];
          String MKT_CARRIER = parts[1];

          int MKT_CARRIER_FL_NUM = parts[2].equals("") ? 0 : Integer.parseInt(parts[2]);
          String ORIGIN = parts[3];
          String ORIGIN_CITY_NAME = parts[4];
          String ORIGIN_STATE_ABR = parts[5];

          int ORIGIN_WAC = parts[6].equals("") ? 0 : Integer.parseInt(parts[6]);
          String DEST = parts[7];
          String DEST_CITY_NAME = parts[8];
          String DEST_STATE_ABR = parts[9];

          int DEST_WAC = parts[10].equals("") ? 0 : Integer.parseInt(parts[10]);
          int CRS_DEP_TIME = parts[11].equals("") ? 0 : Integer.parseInt(parts[11]);
          int DEP_TIME = parts[12].equals("") ? 0 : Integer.parseInt(parts[12]);
          int CRS_ARR_TIME = parts[13].equals("") ? 0 : Integer.parseInt(parts[13]);
          int ARR_TIME = parts[14].equals("") ? 0 : Integer.parseInt(parts[14]);

          boolean CANCELLED = !parts[15].trim().equals("0");
          boolean DIVERTED = !parts[16].trim().equals("0");
          int DISTANCE = Integer.parseInt(parts[17]);

          dataPoints.add(new DataPoint(FL_DATE, MKT_CARRIER, MKT_CARRIER_FL_NUM, ORIGIN,
            ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_WAC, DEST, DEST_CITY_NAME,
            DEST_STATE_ABR, DEST_WAC, CRS_DEP_TIME, DEP_TIME, CRS_ARR_TIME, ARR_TIME,
            CANCELLED, DIVERTED, DISTANCE));
        }
        catch (Exception e) {
          println("Bad row " + count + ": " + e.getMessage());
        }
      }
      count++;
    }
  }
  catch (Exception e) {
    println("Could not load file.");
  }

  println("Loaded rows: " + dataPoints.size());
}

void draw() {
  background(255);
  displayFilters();

  float topOffset = 300;
  float colW = width / 18.0;
  float colH = (height - topOffset) / 10.0;

  stroke(2);
  strokeWeight(1);

  for (int i = 0; i <= 18; i++) {
    line(i * colW, topOffset, i * colW, height);
  }

  for (int j = 0; j <= 10; j++) {
    line(0, topOffset + j * colH, width, topOffset + j * colH);
  }

  ArrayList<DataPoint> flightsToDisplay = getFlightsToDisplay(0);
  drawFlights(flightsToDisplay);
}

ArrayList<DataPoint> getFlightsToDisplay(int page) {
  ArrayList<DataPoint> flightsToDisplay = new ArrayList<DataPoint>();
  int amount = 10;

  for (int i = 0; i < amount; i++) {
    int index = page * amount + i;
    if (index >= dataPoints.size()) break;
    flightsToDisplay.add(dataPoints.get(index));
  }

  return flightsToDisplay;
}
// this gets rid of the commas "" on the screen, more space for the writing
 String clean(String s) {
  return s.replace("\"", "");
}
void drawFlights(ArrayList<DataPoint> flights) {
  int y = 350;   // start below the headers
float colW=77.7;
  for (DataPoint f : flights) {

    // Convert all values to strings for printing
   String[] words = {
  clean(f.FL_DATE), //use this to get rid of the "". only for String of letters
  clean(f.MKT_CARRIER),
  str(f.MKT_CARRIER_FL_NUM),
  clean(f.ORIGIN),
  clean(f.ORIGIN_CITY_NAME),
  clean(f.ORIGIN_STATE_ABR),
  str(f.ORIGIN_WAC),
  clean(f.DEST),
  clean(f.DEST_CITY_NAME),
  clean(f.DEST_STATE_ABR),
  str(f.DEST_WAC),
  str(f.CRS_DEP_TIME),
  str(f.DEP_TIME),
  str(f.CRS_ARR_TIME),
  str(f.ARR_TIME),
  str(f.CANCELLED),
  str(f.DIVERTED),
  str(f.DISTANCE)
};

//every second word add +10 to
// every second one 0,2,4,6...

    for (int i = 0; i < words.length; i++) {
      float x =i *colW;
      
      //every second column gets+10 offset
      if (i % 2 == 1) {
        x += 40;
      }

      fill(0);
      textSize(15);
      text(words[i], x, y);
    }

    y += 50;  // move to next row
  }
}



void displayFilters() {

  String[] words = {
    "Date","Carrier","Fl num","Origin","City Name","Or State","Orig Wac",
    "Dest","Dest City","Dest State","Dest Wac","CRS Dep t","Dep time",
    "CRS arr t","Arr time","Cancelled","Diverted","Distance"
  };

  for (int i = 0; i < words.length; i++) {
    fill(0);
    textSize(15);
    text(words[i], i * 77.7 + 10, 300);
  }
}
