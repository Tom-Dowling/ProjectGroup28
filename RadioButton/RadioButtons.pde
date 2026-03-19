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
