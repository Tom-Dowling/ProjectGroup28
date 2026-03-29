class RadioButton {
  boolean filterSelected;  
  float x, y, r;
  color baseColour = color(200);
  color hoverColour = color(180);
  color activeColour = color(100, 180, 255);
  
  RadioButton(float x, float y, float r) {
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
