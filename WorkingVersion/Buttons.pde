class RadioButton {
  String label;
  boolean filterSelected;  
  float x, y, w, h;
  color baseColour = color(200);
  color hoverColour = color(180);
  color activeColour = color(100, 180, 255);
  
  RadioButton(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
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
    rect(x, y, w, h, 8);
    
    fill(filterSelected ? 255 : 50);
    noStroke();
    textSize(15);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }
  
  boolean isInside() { 
    return mouseX >= x && mouseX <= x + w &&
           mouseY >= y && mouseY <= y + h;
  }
  
  boolean handleClick() {      // will be called in mousePressed() in main sketch
    if (isInside()) {
      filterSelected = !filterSelected;
      return true;
    }
    return false;
  }
}


void drawArrows() {
  // Left arrow (greyed out on first page)
  fill(currentPage > 0 ? color(70, 130, 255) : color(60));
  triangle(80, height-30, 120, height-55, 120, height-5);

  // Right arrow
  fill(color(70, 130, 255));
  triangle(width-80, height-30, width-120, height-55, width-120, height-5);
}

void mousePressed() {
  // Arrows
  if (mouseX > 80 && mouseX < 120 && mouseY > height-55 && mouseY < height-5) {
    currentPage = max(0, currentPage - 1);
  }
  if (mouseX > width-120 && mouseX < width-80 && mouseY > height-55 && mouseY < height-5) {
    currentPage++;
  }

  // Radio buttons — single loop only
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].handleClick()) {
      for (int j = 0; j < buttons.length; j++) {
        if (j != i) buttons[j].filterSelected = false;
      }
    }
  }
  
  sortMostRecent.handleClick();
  
  // Update flags after the loop, not inside it
  filterByCancelled = buttons[0].filterSelected;
  filterByDiverted  = buttons[1].filterSelected;
  mapMode = buttons[2].filterSelected;
  flipList = sortMostRecent.filterSelected;

  // Search bar
  search.handleClick();
  departure.handleClick();

  if (search.active) {
    searchBy = departure.getText();
    println("SEARCH CLICKED! Departure = " + searchBy);
    departure.typedText = "";
  }
  filterSelected = (filterByCancelled || filterByDiverted || !searchBy.isEmpty() || flipList);
  filteredFlights = filterByFlight();
  
  ///MAP BUTTONS
  
  if (mapMode) {
  for (int i = 0; i < mapButtons.length; i++) {
    if (mapButtons[i].handleClick()) {
      
      // make only one selected
      for (int j = 0; j < mapButtons.length; j++) {
        if (j != i) mapButtons[j].filterSelected = false;
      }

 
    }
    if (backButton.handleClick()) {
        mapMode = false;
        buttons[2].filterSelected = false;
    }
    
     if (confirmButton.handleClick()) {

    for (int l = 0; l < mapButtons.length; l++) {
        if (mapButtons[l].filterSelected) {
  
          searchBy = mapAirports[l];   // 🔥 THIS is the key line
          println("Selected airport: " + searchBy);
  
          filteredFlights = filterByFlight();
          break;
        }
    }
    mapMode = false;
    buttons[2].filterSelected = false;
  }
  }
  }
  
  
  
}


void keyPressed(){
  departure.handleTyping(key);
}
