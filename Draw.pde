

void draw() {
  if (screenState.equals("map")) {
    drawMap();
  } else if (screenState.equals("barchart")) {
    drawBarChart();
  } else { // HOME
    drawHome();
  }
}




void drawHome() {
  background(255);


  fill(0, 0, 230);
  noStroke();
  rect(0, 0, width, height/3); //departure

  fill(255);
  noStroke();
  rect(0, height/3, width, height);//search*/

  // Grid
  topBuffer = 300;
  bottomBuffer = 100;
  gridBottom   = height - bottomBuffer;
  collumnWidth      = width / 18;
  collumnHeight      = (gridBottom - topBuffer) / 10;

  stroke(2);
  strokeWeight(1);

  for (int i = 0; i <= 18; i++) {
    line(i * collumnWidth, topBuffer, i * collumnWidth, gridBottom);
  }

  for (int j = 0; j <= 10; j++) {
    line(0, topBuffer + j * collumnHeight, width, topBuffer + j * collumnHeight);
  }

  // Flight data
  ArrayList<DataPoint> flightsToDisplay = getFlightsToDisplay(currentPage);
  drawFlights(flightsToDisplay);

  // Pagination label
  textAlign(CENTER, BOTTOM);
  text("Page " + (currentPage + 1), width/2, height - 65);
  text("Showing rows " + (currentPage * pageSize) + " to " + ((currentPage + 1) * pageSize - 1), width/2, height - 40);

  // UI elements
  drawArrows();
  for (RadioButton btn : buttons) {
    btn.display();
  }
  displayHeadings();



  search.display();//display search bar
  departure.display();//display des bar
  sortMostRecent.display();
  barChartScreen.display();
}

void drawMap() {
  drawMapMode();
}

void drawBarChart() {
  String[] ArrivalStates = { "New York", "California", "Washington", "Virginia", "Texas", "Illinois", "Florida"};
  float[]  arrivalCounts = { NY, CA, WA, VA, TX, IL, FL};

  String[] departureDates    = { "Mar 20", "Mar 21", "Mar 22", "Mar 23", "Mar 24", "Mar 25", "Mar 26" };
  float[]  departureCounts   = { 40, 36, 52, 58, 45, 50, 47 };

  String[] airportCodes      = { "JFK", "LHR", "DUB", "CDG", "AMS", "FRA", "MAD" };
  float[]  flightsPerAirport = { 320, 410, 180, 390, 290, 350, 220 };

  background(255);
  returnFromBarChart.display();

  if (currentBarChart == 1) {
    drawBarChart(arrivalCounts, ArrivalStates, "Daily Arrivals", color(52, 120, 200));
  } else if (currentBarChart == 2) {
    drawBarChart(departureCounts, departureDates, "Daily Departures", color(40, 170, 120));
  } else {
    drawBarChart(flightsPerAirport, airportCodes, "Total Flights by Airport", color(200, 90, 60));
  }

  // Keyboard hint at the bottom
  fill(160);
  textSize(11);
  textAlign(CENTER, BOTTOM);
  noStroke();
  text("Press 1 = Arrivals   |   2 = Departures   |   3 = By Airport", width / 2, height - 6);
}
