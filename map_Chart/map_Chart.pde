PImage img;
RadioButton[] buttons;

void setup() {
  size(1300, 700);
  img = loadImage("map.png");
  buttons = new RadioButton[] {
    new RadioButton(200, 200, 15),
    new RadioButton(200, 140, 15),
    new RadioButton(230, 330, 15),
    new RadioButton(140, 330, 15),
    new RadioButton(350, 340, 15),
    new RadioButton(350, 460, 15),
    new RadioButton(460, 460, 15),
    new RadioButton(470, 370, 15),
    new RadioButton(470, 280, 15),
    new RadioButton(470, 180, 15),
    new RadioButton(300, 220, 15),
    new RadioButton(230, 330, 15),
    new RadioButton(620, 180, 15),
    new RadioButton(620, 250, 15),
    new RadioButton(620, 330, 15),
    new RadioButton(650, 390, 15),
    new RadioButton(680, 470, 15),
    new RadioButton(650, 570, 15),
    new RadioButton(510, 690, 15),
    new RadioButton(230, 600, 15),
    new RadioButton(740, 200, 15),
    new RadioButton(750, 300, 15),
    new RadioButton(790, 400, 15),
    new RadioButton(800, 480, 15),
    new RadioButton(810, 560, 15),
    new RadioButton(840, 240, 15),
    new RadioButton(870, 350, 15),
    new RadioButton(960, 260, 15),
    new RadioButton(1020, 340, 15),
    new RadioButton(940, 350, 15),
    new RadioButton(980, 400, 15),
    new RadioButton(980, 450, 15),
    new RadioButton(880, 530, 15),
    new RadioButton(960, 530, 15),
    new RadioButton(1040, 530, 15),
    new RadioButton(1110, 630, 15),
    new RadioButton(1110, 490, 15),
    new RadioButton(1110, 430, 15),
    new RadioButton(1130, 380, 15),
    new RadioButton(1070, 380, 15),
    new RadioButton(1165, 340, 15),
    new RadioButton(1205, 380, 15),
    new RadioButton(1205, 350, 15),
    new RadioButton(1130, 300, 15),
    new RadioButton(1213, 320, 15),
    new RadioButton(1248, 265, 15),
    new RadioButton(1270, 262, 15),
    new RadioButton(1260, 245, 15),
    new RadioButton(1253, 215, 15),
    new RadioButton(1180, 245, 15),
    new RadioButton(1227, 215, 15),
    new RadioButton(1300, 160, 15)    
  };
}

void draw() {
  image(img, 0, 0, 1400, 800);
  for (RadioButton btn : buttons) {
    btn.display();
  }
}
  
  
