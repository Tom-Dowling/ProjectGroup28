class MapButton {
  //Tracks whethere map button is selected or not
  boolean filterSelected;

  float x, y, r;
  color baseColour = color(200);
  color hoverColour = color(180);
  color activeColour = color(100, 180, 255);

  MapButton(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    this.filterSelected = false;
  }

  void display() {           // drawing button body
    if (filterSelected) {
      fill(activeColour);
    } else if (isInside()) {
      fill(hoverColour);
    } else {
      fill(baseColour);
    }

    stroke(80);
    strokeWeight(filterSelected ? 2.5 : 1);
    circle(x, y, r);

    fill(filterSelected ? 255 : 50);
    noStroke();
  }

  boolean isInside() {
    return (mouseX <= x + r) && (mouseX >= x - r)  &&
      (mouseY <= y + r) && (mouseY >= y - r);
  }

  boolean handleClick() {      // will be called in mousePressed() in main sketch
    if (isInside()) {
      filterSelected = !filterSelected;
      return true;
    }
    return false;
  }
}

void drawMapMode() {
  image(map, 0, 0, 1400, 800);
  backButton.display();
  confirmButton.display();



  stroke(5);
  fill(0);
  for (MapButton btn : mapButtons) {
    btn.display();
  }
}





// Maps each MapButton to a state code
String[] mapAirports = {
  "WA", // Washington
  "OR", // Oregon
  "NV", // Nevada
  "CA", // California
  "UT", // Utah
  "AZ", // Arizona
  "NM", // New Mexico
  "CO", // Colorado
  "MT", // Montana
  "ID", // Idaho
  "ND", // North Dakota
  "TX", // Texas
  "HI", // Hawaii
  "AK", // Alaska
  "MN", // Minnesota
  "MO", // Missouri
  "LA", // Louisiana
  "WI", // Wisconsin
  "IL", // Illinois
  "MI", // Michigan
  "OH", // Ohio
  "IN", // Indiana
  "TN", // Tennessee
  "MS", // Mississippi
  "AL", // Alabama
  "GA", // Georgia
  "FL", // Florida
  "NC", // North Carolina
  "VA", // Virginia
  "VA", // Washington DC
  "MD", // Maryland
  "PA", // Pennsylvania
  "NJ", // New Jersey
  "CT", // Connecticut
  "MA", // Massachusetts
  "NY", // New York
};
