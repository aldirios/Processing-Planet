planet rotasi;
PShape sun;
PShape bumi;
PShape bulan;

PImage tsun;
PImage tbumi;
PImage tbulan;

void setup() {
  size(600, 600, P3D);
  smooth();
  
  rotasi = new planet();
  tsun = loadImage("sun.jpg");
  tbumi = loadImage("bumi.jpg");
  tbulan = loadImage("bulan.jpg");
  
  sun = createShape(SPHERE,60);
  bumi = createShape(SPHERE,40);
  bulan = createShape(SPHERE,30);
  
  sun.setTexture(tsun);
  bumi.setTexture(tbumi);
  bulan.setTexture(tbulan);
  
  sun.setStroke(false);
  bumi.setStroke(false);
  bulan.setStroke(false);
}
 
void draw() {
  background(0);
  rotasi.run();
}

class planet{
  int d = 0;
  int speed=1;
  void run(){
    
    rotateX(radians(45));
    d = d+speed;
    translate(width/2, height/2-250, -300);
    
    pushMatrix();
    rotateZ(radians(-d*1));
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(0,0,500,500);
    shape(sun,0,0);
    popMatrix();
    
    
    pointLight(255,255,255,0, 0, 0);
    
    pushMatrix();
    rotateZ(radians(-d*1));
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(0,250,200,200);
    pushMatrix();
    translate(0, 250, 0);
    rotateX(radians(90));
    ellipse(0,0,2,150);
    popMatrix();
    
    pushMatrix();
    rotateY(radians(-d*1));
    shape(bumi,0,250);
    popMatrix();
    
    translate(0, 250, 0);
    rotateZ(radians(-d*2));
    shape(bulan,0,100);
    popMatrix();
  }
}
