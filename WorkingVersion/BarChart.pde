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
