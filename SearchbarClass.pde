
class SearchBar {
  //attriubutes
  int x, y, w, h;
  String label;
  boolean active = false;//to see if mouse if over search/des bar
  String typedText = "";// to be able to type text into bar
  boolean displayText; // So "search doesn't dissapear when you click on it

  //constructor
  SearchBar(int x, int y, int w, int h, String label, boolean displayText) {
    this.x= x;
    this.y= y;
    this.w= w;
    this.h= h;
    this.label=label;
    this.displayText = displayText;
  }
  //methods

  //!Getter
  String getText() {
    return typedText;
  }

  void display() {
    if (mouseX>=x&&mouseX<=x+w&& //this checks if its in either search/des bar
      mouseY>=y&&mouseY<=y+h ) {
      fill(230);//if so fill it in
      stroke(5);
      strokeWeight(2);
    } else { // if not hovering fill white
      fill(255);
      noStroke();
    }

    rect(x, y, w, h, 25); //create both bars, with designated x,y,w,h. 25 = curved edges
    fill(0);
    textSize(25);

    if (!displayText) {
      // Search bar always show text
      text(label, x + 50, y + h/2 + 10);
    } else if (!active && typedText.equals("")) {
      // Departure bar shows text when its empty
      text(label, x + 60, y + h/2 + 10);
    } else {
      text(typedText, x + 60, y + h/2 + 10);
    }
  }

  void handleClick() {
    if (mouseX>=x&&mouseX<=x+w&& // if inside of the bar activate boolean to true
      mouseY>=y&&mouseY<=y+h ) {
      active=true;
    } else {
      active=false; // if not true the label will still be printed
    }
  }
  // so we can type into destination bar, NOT search bar
  void handleTyping(char key) {
    if (active) { // only happens when clicked onto

      // if we want to remove a char, if there is more than 0 chars
      if (key == BACKSPACE && typedText.length() > 0) {
        // This is the standard way to delete the last character in a String.
        typedText = typedText.substring(0, typedText.length() - 1);
      } else if (key != CODED) {
        // to tyoe out character
        typedText += key;
      }
    }
  }
}
