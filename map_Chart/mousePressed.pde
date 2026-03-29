void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].handleClick()) {
      
      for (int j = 0; j < buttons.length; j++) {
        if (j != i) buttons[j].filterSelected = false;
      }
    }
  }
}
