class MapButton {
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
