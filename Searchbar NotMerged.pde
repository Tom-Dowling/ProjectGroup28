SearchBar departure;
SearchBar search;
void setup() {
  size(600, 600, P2D);//P2D makes it run smoother
  departure = new SearchBar(50, 100, 340, 75,"Departure", true);
  search = new SearchBar(415,100,140,75,"Search", false);
}

void draw() {
  fill(0,0,230);
  noStroke();
  rect(0,0,width,height/3); //departure
  
  fill(255);
  noStroke();
  rect(0,height/3,width,height);//search
  
  search.display();//display search bar
  departure.display();//display des bar
}
void mousePressed(){
  search.handleClick();
  departure.handleClick();
  
  if (search.active) {
    String search = departure.getText();
    println("SEARCH CLICKED! Departure = " + search);
    
    departure.typedText = "";
  }

  
}
void keyPressed(){
   // Only departure bar receives typing not search
  departure.handleTyping(key);
}
