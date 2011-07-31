import jmetude.*;

Etude e;
float notes[][] = {{60,1.0}, 
                   {62,1.0}, 
                   {64,1.0}, 
                   {65,1.0}, 
                   {67,1.0}, 
                   {69,1.0}, 
                   {71,1.0}, 
                   {72,4.0}};

void setup() {
    noLoop();
    size(200,100);
    e = new Etude(this);
    e.createPhrase("phrase");
    e.addPhraseNoteList("phrase", notes);

}

void draw() {
  background(50);
  PImage splash = loadImage("http://weirdplace.wz.cz/kofEngine/back.jpg");
  image(splash, 0, 0,width,height);
  
}

void mousePressed() {
  e.stopMIDI();
  int inst = (int) random(0,127);
  e.setPhraseInstrument("phrase", inst);
  e.playMIDI("phrase");
}
