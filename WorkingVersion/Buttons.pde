class RadioButton {
  String label;
  boolean filterSelected;  
  float x, y, w, h;
  color baseColour = color(200);
  color hoverColour = color(180);
  color activeColour = color(100, 180, 255);
  color textColour;
  
  RadioButton(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.filterSelected = false;
  }  
  
  void display() {           // drawing button body - different appearance whether button has been clicked, hovered over, or neither
    if (filterSelected) {
      fill(activeColour);
    } else if (isInside()) {
      fill(hoverColour);
    } else {
      fill(baseColour);
    }
    
    stroke(80);
    strokeWeight(filterSelected ? 2.5 : 1);    // different stroke weight whether a button has been clicked or not
    rect(x, y, w, h, 8);
    

    if (filterSelected) textColour = 255;    // different text colour whether a button has been clicked or not
    else textColour = 50;
    fill(textColour);
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
  
  
    boolean handleScreenChangeClick() {      // used for buttons which don't change a filter but just change screen
    if (isInside()) {
      if(screenState.equals(BARCHART)) screenState = HOME;
      else if (screenState.equals(MAP)) screenState = HOME;
      else screenState = BARCHART;
      System.out.println(screenState);
      return true;
    }
    return false;
  }
  
  
}



void drawArrows() {
  int maxPage;
  if (filterSelected) maxPage = filteredFlights.size()/10;    //checks the size of the length of the list of the flights which matches the search terms and determines the amount of pages they need to be dsiplayed over
  else maxPage = dataPoints.size()/10;                        // this number is then used to make sure the programme knows when to stop allowing the next page arrow to be clickable, stopping the for loop which fetches the flights from going out of bounds
    
  // Left arrow 
  fill(currentPage > 0 ? color(70, 130, 255) : color(60)); // if it's on the first page, the arrow is greyed out
  triangle(80, height-30, 120, height-55, 120, height-5);  // draw left arrow

  // Right arrow
  fill(currentPage+1 <= maxPage ? color(70, 130, 255) : color(60));  // same if it's on the last page of info
  triangle(width-80, height-30, width-120, height-55, width-120, height-5); // draw right arrow
}

void mousePressed() {
  if (screenState.equals(HOME)) {     // if we user isn't on the main screen, the buttons won't be clickable
    // Arrows
    if (mouseX > 80 && mouseX < 120 && mouseY > height-55 && mouseY < height-5) {
      currentPage = max(0, currentPage - 1);
    }
    if (mouseX > width-120 && mouseX < width-80 && mouseY > height-55 && mouseY < height-5) {
      int maxPage;
      if (filterSelected) maxPage = filteredFlights.size()/10;
      else maxPage = dataPoints.size()/10;
      
      if (!(currentPage+1 > maxPage)) currentPage++;
    }

  // Radio buttons — single loop only
  
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].handleClick()) {
      currentPage = 0;
      for (int j = 0; j < buttons.length; j++) {
        if (j != i) buttons[j].filterSelected = false;
      }
    }
  }
  
  sortMostRecent.handleClick();
  barChartScreen.handleScreenChangeClick();
  }
  
  
 
  if (screenState.equals(BARCHART)) {
    returnFromBarChart.handleScreenChangeClick();
  }


  // Update flags after the loop, not inside it
  filterByCancelled = buttons[0].filterSelected;
  filterByDiverted  = buttons[1].filterSelected;

  if (buttons[2].handleClick()) {
    screenState = MAP;
    return;
  }

  flipList = sortMostRecent.filterSelected;
  
  
  // Search bar
  if (screenState.equals(HOME)) search.handleClick();
  if (screenState.equals(HOME)) departure.handleClick();

  if (search.active) {
    searchBy = departure.getText();
    println("SEARCH CLICKED! Departure = " + searchBy);


    departure.typedText = "";
  }

  NY = 0.0;    //Resets counts for bar chart, so that when filters are updated the previous data is deletd before the counting again with new filters 
  CA = 0.0;
  FL = 0.0;
  VA = 0.0;
  WA = 0.0;
  IL = 0.0;
  TX = 0.0;
  HI = 0.0;
  OR = 0.0;
  NJ = 0.0;
  NM = 0.0;
  jan1 = 0.0;
  jan2 = 0.0;
  jan3= 0.0;
  jan4 = 0.0;
  jan5 = 0.0;
  jan6 = 0.0;

  filterSelected = (filterByCancelled || filterByDiverted || !searchBy.isEmpty() || flipList ||  searchByState);
  filteredFlights = filterByFlight();

  
  ///MAP BUTTONS
  
    if (screenState.equals(MAP)) {
    for (int i = 0; i < mapButtons.length; i++) {
      if (mapButtons[i].handleClick()) {

        // make only one selected
        for (int j = 0; j < mapButtons.length; j++) {
          if (j != i) mapButtons[j].filterSelected = false;
        }
      }
      if (backButton.handleScreenChangeClick()) {

        searchByState = false;
        screenState = HOME;

        println(filterSelected);
      }

      if (confirmButton.handleScreenChangeClick()) {
        searchByState = true;
        filterSelected = true;
        for (int l = 0; l < mapButtons.length; l++) {
          if (mapButtons[l].filterSelected) {

            searchBy = mapAirports[l];

            println("Selected airport: " + searchBy);

            filteredFlights = filterByFlight();
            break;
          }
        }
        screenState = HOME;
        buttons[2].filterSelected = false;
      }
    }
  }
}



void keyPressed(){
  // search bar
  departure.handleTyping(key);
  
  if (screenState.equals(BARCHART)) {
  // bar chart
  if (key == '1') currentBarChart = 1;
  if (key == '2') currentBarChart = 2;
  }
  
  
  if (keyCode == ENTER) {benUI.screenState = 1;
movePlane = true;
}

if (key == '§') {benUI.screenState = 0;
movePlane = false;
planeX = 1150;
}
}
