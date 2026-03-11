final int ScreenX = 900;
final int ScreenY = 900;



  
void draw() {
  drawFlights();
}


void drawFlights(){
  int y = 120;
  float size = 16;
  for (DataPoint f : flights) {
   
    String row = f.FL_DATE + " | " + f.MKT_CARRIER + " | " + f.MKT_CARRIER_FL_NUM
    + f.ORIGIN + " | " + f.ORIGIN_CITY_NAME + " | " + f.ORIGIN_STATE_ABR + " | " +
    f.ORIGIN_WAC + " | " + f.DEST + " | " + f.DEST_CITY_NAME + " | " + f.DEST_STATE_ABR
    + " | " + f.DEST_WAC + " | " + f.CRS_ARR_TIME + " | " + f.ARR_TIME + " | "
    + f.CANCELLED + " | " + f.DIVERTED + " | " + f.DISTANCE;
    
    while (textWidth(row) > (ScreenY - 50) ){
      size -= 0.5;
      
    }
    textSize(size);
    text(row, 40, y);
   

    y += 25;
    
  }
 

}
