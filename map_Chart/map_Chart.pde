PImage img;

void setup() {
  size(1400, 800);
  img = loadImage("map.png");
}

void draw() {
  image(img, 0, 0, 1400, 800);

  stroke(5);
  fill(0);
  //washington
  circle(200, 200, 15);
  //oregon
  circle(200, 140, 15);
  //nevada
  circle(230, 330, 15);
  //california
  circle(140, 330, 15);
  //utah
  circle(350, 340, 15);
  //arizona
  circle(350, 460, 15);

  //new mexico
  circle(460, 460, 15);
  //colorado
  circle(470, 370, 15);
  //wyoming
  circle(470, 280, 15);

  //montana
  circle(470, 180, 15);
  //idaho
  circle(300, 220, 15);
  //colorado
  circle(230, 330, 15);

  //north dakota
  circle(620, 180, 15);
  //south dakota
  circle(620, 250, 15);
  //nebraska
  circle(620, 330, 15);

  //kansas
  circle(650, 390, 15);
  //oklahoma
  circle(680, 470, 15);
  //texas
  circle(650, 570, 15);

  //hawaii
  circle(510, 690, 15);
  //alaska
  circle(230, 600, 15);

  //minnesota
  circle(740, 200, 15);
  //iowa
  circle(750, 300, 15);
  //missouri
  circle(790, 400, 15);
  //arkansas
  circle(800, 480, 15);
  //louisiana
  circle(810, 560, 15);

  //wisconsin
  circle(840, 240, 15);
  //illinois
  circle(870, 350, 15);
  //michigan
  circle(960, 260, 15);

  //ohio
  circle(1020, 340, 15);
  //indiana
  circle(940, 350, 15);
  //kentucky
  circle(980, 400, 15);
  //tennessee
  circle(980, 450, 15);

  //mississippi
  circle(880, 530, 15);
  //alabama
  circle(960, 530, 15);
  //georgia
  circle(1040, 530, 15);

  //florida
  circle(1110, 630, 15);
  //south carolina
  circle(1110, 490, 15);
  //north carolina
  circle(1110, 430, 15);

  //virginia
  circle(1130, 380, 15);
  //west virginia
  circle(1070, 380, 15);

  //Washington DC
  circle(1165, 340, 15);
  //Maryland
  circle(1205, 380, 15);
  //delaware
  circle(1205, 350, 15);
  //pennsylvania
  circle(1130, 300, 15);//keep
  //new jersey
  circle(1213, 320, 15);

  //conneticut
  circle(1248, 265, 15);
  //rhode island
  circle(1270, 262, 15);
  //massachusets
  circle(1260, 245, 15);
  //new hampshire
  circle(1253, 215, 15);

  //new york
  circle(1180, 245, 15);
  //vermont
  circle(1227, 215, 15);
  //mane
  circle(1300, 160, 15);
}
