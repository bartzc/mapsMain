PImage map;
PrintWriter output;
void setup(){
  
  size(1551,969);
  map = loadImage("D:\\External Drive\\Cod strats\\vods\\gibbyMap.jpg");
  output = createWriter("D:\\External Drive\\Cod strats\\vods\\locations.txt");
  output.flush();
}
void draw(){
 image(map, 0,0);
}
void mousePressed(){
  println(mouseX+" "+mouseY);
  output.println(mouseX+" "+mouseY);
}
void keyPressed(){
  output.flush();
  output.close();
  exit();
}
