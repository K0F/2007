void createMenu(int x, int y){
  int w = 50;
  int h = 70;
  int timer = 0;
  if (mouseButton == RIGHT) {
    //menu background
    timer ++;
    stroke(255,12);
    fill(255,15);
    rect(x, y, w, h);

    //menu button
    stroke(100);
    fill(50);
    rect(x + 2, y + 10, w - 4, 10);

    //menu button 2
    stroke(100);
    fill(50);
    rect(x + 2, y + 25, w - 4, 10);


  }
}
