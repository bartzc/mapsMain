import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;
PImage map;
int lines = 0;
boolean shape = false;
String texts ="";
private TreeMap<String, Integer> kills;
int xs = 0;
int ys = 0;
void setup() {
  size(1551, 969);
  map = loadImage("D:\\External Drive\\Cod strats\\vods\\gibbyMap.jpg");
  kills = new TreeMap<String, Integer>();
  loader();
}
void draw() {
  image(map, 0, 0);
  create(1);
  //merger();
  create(2);
  //merger();
  create(3);
  
  if(shape == true){
    fill(153, 150, 149);
    stroke(1);
    rect(xs+50, ys+50, 200, 100);
    fill(255);
    textSize(12);
    text(texts, xs+70, ys+80); 
  }
    
}
void mousePressed() {
  if (shape == false) {
     xs = mouseX;
     ys = mouseY;
    texts = dataOutput(xs, ys);
    shape = true;
  } else {
    shape = false;
  }
}
String dataOutput(int x, int y) {
  int numKill = 0;
  for (int i = x-50; i<x+50; i++) {
    for (int o = y-50; o<y+50; o++) {
      for (String Key : kills.keySet()) {
        String[] info = Key.split(" ");
        int xcord = parseInt(info[0]);
        int ycord = parseInt(info[1]);
        if (i == xcord && o == ycord) {
          numKill++;
        }
      }
    }
  }
  return "There were "+numKill +" in this area";
}
void create(int time) {
  for (String Key : kills.keySet()) {
    String[] cords = Key.split(" ");
    int xcord = parseInt(cords[0]);
    int ycord = parseInt(cords[1]);
    ellipseMode(CENTER);
    noStroke();
    if (kills.get(Key)==time&&time==1) {
      fill(6, 226, 61, 70);
      ellipse(xcord, ycord, 40, 40);
    }
    if (kills.get(Key)<4&&kills.get(Key)>1&&time==2) {
      fill(6, 226, 61, 70);
      ellipse(xcord, ycord, 40, 40);
      fill(214, 174, 17, 60);
      ellipse(xcord, ycord, 30, 30);
    }
    if (kills.get(Key)>=4&&time==3) {
      fill(6, 226, 61, 70);
      ellipse(xcord, ycord, 40, 40);
      fill(214, 174, 17, 60);
      ellipse(xcord, ycord, 30, 30);
      fill(170, 31, 10, 90);
      ellipse(xcord, ycord, 20, 20);
    }
  }
}
void merger() {
}
void loader() {
  try
  {
    Scanner file = new Scanner(new File("D:\\External Drive\\Cod strats\\vods\\locations.txt"));
    while (file.hasNextLine()) {
      String line = file.nextLine();
      Integer count = kills.get(line);
      if (count == null) {
        kills.put(line, 1);
      } else {
        kills.put(line, count + 1);
      }
    }
  }
  catch( IOException e )  //Most specific exceptions must be listed 1st
  {
    out.println(e);
  }
  catch( RuntimeException e )
  {
    out.println(e);
  }
  catch( Exception e )
  {
    out.println(e);
  }
  finally
  {
    //no code needed here
  }
}
