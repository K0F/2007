 // Demonstrates the use of DXF exporter for Processing graphics.
// Works with Processing 65 Alpha. Untested with other versions.
// 10.14.03 Simon Greenwold (simong@media.mit.edu)
 
void setup() {
  DXFinit();  // Must be first line of setup().
  size(200,200);
}
 
void loop() {
  DXFloop();   // Must be first line of loop().
 
 
  // Any kind of graphics calls you want go here.
  // Note that pixels, lines, images, movies, and text
  // will not be exported to DXF.
  // Only rectangles, triangles, polygons, boxes, spheres, etc.
  triangle(1, 2, 40, 50, 20, 2);
  rect(10, 10, 45, 60);
  translate(width/2, height/2);
  rotateX(PI/8);
  rotateZ(PI/6);
  box(40);
  scale(2, 1, 3);
  translate(20, 30, 40);
  sphere(10);
 
 
  // If the 'w' key is pressed, write the file.  
  if (keyPressed && key == 'w') {
    DXFwrite("Tester.dxf");  // Should appear at the end of loop().
  }
}
 
//--------- DXFwrite --------------------
// Writes all current triangle-based graphics
// (polygons, boxes, spheres, etc.) to a DXF file.
// Call this at the end of your loop (after everything has drawn).
// But be sure to put a condition like a keypress on it!
// You don't want it running over and over in a loop.
// File will appear in the same folder as the
// Processing executable.
 
void DXFwrite(String fileName) {
  java.util.ArrayList text = new java.util.ArrayList(100);
  DXFheader(text);
  DXFgraphics(text);
  DXFfooter(text);
  saveStrings(fileName, (String[])text.toArray(new String[0]));
  println("DXF file \"" + fileName + "\" written with " + g.triangles_count + " triangles.");
}
 
//--------- DXFinit --------------------
// Should be called as the first line of setup()
// Makes sure that graphics are drawn in a way that
// the writer can use.
void DXFinit() {
  hint(NEW_GRAPHICS);
  lights();
}
 
//--------- DXFloop --------------------
// Should be called as the first line of loop()
// It makes sure that all triangles are done in 3D
void DXFloop() {
  rotateX(PI/8);
  rotateX(-PI/8);
}
 
// DXFwrite utility functions below. Do not use.
void DXFheader(java.util.ArrayList text) {
  text.add("0");
  text.add("SECTION");
  text.add("2");
  text.add("ENTITIES");
}
 
void DXFfooter(java.util.ArrayList text) {
  text.add("0");
  text.add("ENDSEC");
  text.add("0");
  text.add("EOF");
}
 
void DXFgraphics(java.util.ArrayList text) {
  float a[];
  float b[];
  float c[];
  for (int i = 0; i < g.triangles_count; i++) {
    a = g.vertices[g.triangles[i][0]];
    b = g.vertices[g.triangles[i][1]];
    c = g.vertices[g.triangles[i][2]];
 
    if (a[VW] != 0.0 && b[VW] != 0.0 && c[VW] != 0.0) {
 text.add("0");
 text.add("3DFACE");
 text.add("8");
 text.add("0");
 
 text.add("10");
 text.add(Float.toString(a[VX]/a[VW]));
 text.add("20");
 text.add(Float.toString(a[VY]/a[VW]));
 text.add("30");
 text.add(Float.toString(a[VZ]/a[VW]));
 text.add("11");
 text.add(Float.toString(b[VX]/b[VW]));
 text.add("21");
 text.add(Float.toString(b[VY]/b[VW]));
 text.add("31");
 text.add(Float.toString(b[VZ]/b[VW]));
 text.add("12");
 text.add(Float.toString(c[VX]/c[VW]));
 text.add("22");
 text.add(Float.toString(c[VY]/c[VW]));
 text.add("32");
 text.add(Float.toString(c[VZ]/c[VW]));
 text.add("13");
 text.add(Float.toString(c[VX]/c[VW]));
 text.add("23");
 text.add(Float.toString(c[VY]/c[VW]));
 text.add("33");
 text.add(Float.toString(c[VZ]/c[VW]));
    }
  }
} 
