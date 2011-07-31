class ScriptWriter{
 PrintWriter output;

ScriptWriter(String name){
  output = createWriter(name+".txt"); 
}

void insert(int time,int value) {
  String tm = str(time);
  String val= str(value);
  String compone = tm+","+val;
  output.println(compone);
}

void finish() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
} 
  
  
  
  
}
