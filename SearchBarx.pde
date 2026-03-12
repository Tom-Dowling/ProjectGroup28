SearchBar departure;
SearchBar search;
void setup() {
  size(600, 600, P2D);//P2D makes it run smoother
  departure = new SearchBar(50, 100, 340, 75,"Departure");
  search = new SearchBar(415,100,140,75,"Search");
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
  
}
void keyPressed(){
   // Only departure bar receives typing not search
  departure.handleTyping(key);
}









//void keyPressed(){
//  if(key=='1'){


//  }
//  if(key=='2'){

//  }
//   if(key=='3'){

//  }
//   if(key=='4'){

//  }

//}
