import ai.pathfinder.*;

Pathfinder dijk;
int w = 10;
int h = 10;
int spacing;

void setup(){
  size(400, 400);
  spacing = width / w;
  dijk = new Pathfinder(w, h, 1.0);
}

void draw(){
  background(230);
  fill(255);
  int m = (mouseX/spacing) + (mouseY/spacing) * w;
  rect((m % w) * spacing, (m / w) * spacing, spacing, spacing);
  Node n = (Node)dijk.nodes.get(m);
  dijk.dijkstra(n);
  drawNodes();
}

void drawNodes(){
  stroke(10);
  for(int i = 0; i < dijk.nodes.size(); i++){
    Node n = (Node)dijk.nodes.get(i);
    Node p = null;
    int pnum = -1;
    if(n.parent != null){
      p = n.parent;
      pnum = dijk.indexOf(p);
    }
    int x = i % w;
    int y = i / w;
    int s = spacing / 2;
    fill(255);
    ellipse(s + x * spacing, s + y * spacing, 10, 10);
    if(p != null){
      int px = pnum % w;
      int py = pnum / w;
      line(s + x * spacing, s + y * spacing, s + lerp(x, px, .75) * spacing, s + lerp(y, py, .75) * spacing);
    }
  }
}
