// FlightBarChart.pde
// Draws a bar chart from a list of numbers.
// Press 1, 2, or 3 to switch between chart views.


String[] arrivalDates      = { "Mar 20", "Mar 21", "Mar 22", "Mar 23", "Mar 24", "Mar 25", "Mar 26" };
float[]  arrivalCounts     = { 42, 38, 55, 61, 47, 53, 49 };

String[] departureDates    = { "Mar 20", "Mar 21", "Mar 22", "Mar 23", "Mar 24", "Mar 25", "Mar 26" };
float[]  departureCounts   = { 40, 36, 52, 58, 45, 50, 47 };

String[] airportCodes      = { "JFK", "LHR", "DUB", "CDG", "AMS", "FRA", "MAD" };
float[]  flightsPerAirport = { 320, 410, 180, 390, 290, 350, 220 };

// --- Which chart to show (1, 2, or 3) ---
int currentChart = 1;

// -------------------------------------------------

void setup() {
  size(800, 500);
}

void draw() {
  background(245);

  if (currentChart == 1) {
    drawBarChart(arrivalCounts, arrivalDates, "Daily Arrivals", color(52, 120, 200));
  } else if (currentChart == 2) {
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

void keyPressed() {
  if (key == '1') currentChart = 1;
  if (key == '2') currentChart = 2;
  if (key == '3') currentChart = 3;
}

// -------------------------------------------------
// drawBarChart()
//   values   - the numbers to plot
//   labels   - one label per bar (date or airport code)
//   title    - heading shown at the top
//   barColor - colour of the bars
// -------------------------------------------------

void drawBarChart(float[] values, String[] labels, String title, color barColor) {

  // Chart area boundaries (pixels)
  int left   = 70;
  int right  = width - 30;
  int top    = 55;
  int bottom = height - 55;
  int chartW = right - left;
  int chartH = bottom - top;

  // Find a clean Y-axis maximum that sits above the tallest bar.
  // e.g. if the highest value is 61, the axis will go up to 70.
  int maxVal = niceMax(max(values));

  // --- Title ---
  fill(30);
  textSize(16);
  textAlign(CENTER, TOP);
  noStroke();
  text(title, width / 2, 16);

  // --- Y-axis grid lines (5 evenly spaced steps) ---
  int steps = 5;
  int step  = maxVal / steps;   // e.g. maxVal=500 -> step=100

  for (int i = 0; i <= steps; i++) {
    int   yVal = i * step;
    float y    = map(yVal, 0, maxVal, bottom, top);

    stroke(210);
    strokeWeight(1);
    line(left, y, right, y);      // horizontal grid line

    fill(100);
    noStroke();
    textSize(12);
    textAlign(RIGHT, CENTER);
    text(yVal, left - 8, y);      // Y-axis number (always a whole integer)
  }

  // --- Bars ---
  float slotW   = (float) chartW / values.length;  // width of each bar's slot
  float barW    = slotW * 0.6;                      // bar takes up 60% of the slot
  float padding = slotW * 0.2;                      // gap on each side of the bar

  for (int i = 0; i < values.length; i++) {
    float barH = map(values[i], 0, maxVal, 0, chartH);
    float x    = left + i * slotW + padding;
    float y    = bottom - barH;

    // Draw the bar
    fill(barColor);
    noStroke();
    rect(x, y, barW, barH);

    // Value above the bar
    fill(50);
    textSize(11);
    textAlign(CENTER, BOTTOM);
    text(int(values[i]), x + barW / 2, y - 3);

    // Label below the X-axis
    fill(80);
    textAlign(CENTER, TOP);
    text(labels[i], x + barW / 2, bottom + 8);
  }

  // --- Axes drawn last so they appear on top of the grid ---
  stroke(140);
  strokeWeight(1.5);
  line(left, top,    left,  bottom);  // Y-axis
  line(left, bottom, right, bottom);  // X-axis
}

// -------------------------------------------------
// niceMax()
// Rounds a value up to the nearest clean increment
// so Y-axis labels are always whole, even numbers.
//   e.g.  61 -> 70,  320 -> 400,  1200 -> 1500
// -------------------------------------------------

int niceMax(float val) {
  // Choose a round step size based on the size of the value
  int step;
  if      (val <= 10)   step = 2;
  else if (val <= 50)   step = 10;
  else if (val <= 100)  step = 20;
  else if (val <= 500)  step = 100;
  else if (val <= 1000) step = 200;
  else                  step = 500;

  // Round up to the nearest multiple of step
  return ceil(val / step) * step;
}
