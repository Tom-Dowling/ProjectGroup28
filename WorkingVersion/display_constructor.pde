float collumnWidth;
float collumnHeight;
float topBuffer = 300;
float bottomBuffer = 70;
float firstRowY = 325;
float gridBottom;


void displayHeadings() { // putting all 17 requirements at the top of the graph
  //to distinguish the differnt data types
  // using an array to print different strings
  String[] words = {"Date", "Carrier", "Fl num", "Origin", "City Name", "Or State", "Orig Wac",
    "Dest", "Dest City", "Dest State", "Dest Wac", "CRS Dep t", "Dep time",
    "CRS arr t", "Arr time", "Cancelled", "Diverted", "Distance"};
  for (int i = 0; i < words.length; i++) { // go through each word
    float x = i *collumnWidth + collumnWidth/2;
    fill(0);
    textSize(15);
    strokeWeight(10);
    text(words[i], x, firstRowY-35); // 1400 our screen length /18 is 77.7.
    //So add that everytime we print a new word off
  }                               // start 300 down so space for filters later
}

String fitText(String s, float maxWidth) {
  if (textWidth(s) <= maxWidth) return s;
  while (textWidth(s + "…") > maxWidth && s.length() > 0) {
    s = s.substring(0, s.length() - 1);
  }
  return s + "…";
}

void drawFlights(ArrayList<DataPoint> flights) {
  float y = 350;   // start below the headers
  int rowIndex = 0;

  for (DataPoint f : flights) {
    String[] words = {
      f.FL_DATE,
      f.MKT_CARRIER,
      str(f.MKT_CARRIER_FL_NUM),
      f.ORIGIN,
      f.ORIGIN_CITY_NAME,
      f.ORIGIN_STATE_ABR,
      str(f.ORIGIN_WAC),
      f.DEST,
      f.DEST_CITY_NAME,
      f.DEST_STATE_ABR,
      str(f.DEST_WAC),
      str(f.CRS_DEP_TIME),
      str(f.DEP_TIME),
      str(f.CRS_ARR_TIME),
      str(f.ARR_TIME),
      str(f.CANCELLED),
      str(f.DIVERTED),
      str(f.DISTANCE)
    };


    for (int i = 0; i < words.length; i++) {
      float x = i *collumnWidth + collumnWidth/2;
      y = firstRowY + rowIndex * collumnHeight;
      /*
      //every second column gets+10 offset
       if (i % 2 == 1) {
       x += 40;
       }*/

      fill(0);
      textSize(11);
      textAlign(CENTER, CENTER);
      text(fitText(words[i], collumnWidth - 4), x, y);
    }

    //  y += collumnHeight;  // move to next row
    rowIndex += 1;
  }
}
