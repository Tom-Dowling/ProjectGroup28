RadioButton[] buttons;
void setup() {
  size(500, 500);
  buttons = new RadioButton[] {
    new RadioButton(50, 50, 220, 42, "Show cancelled flights")    
  };
}
void draw() {
  background(150);
  for (RadioButton btn : buttons) {
    btn.display();
  }
}
 
