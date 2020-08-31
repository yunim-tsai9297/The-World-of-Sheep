import gab.opencv.*;
import processing.video.*;
import fisica.*;

OpenCV opencv;
FWorld fworld;
Capture cam;
FBox mount;

ArrayList<Particle> particles = new ArrayList<Particle>();
PImage mountain;

void setup() {
  size(1280, 720);
  smooth();

  cam = new Capture(this, 1280, 720, "Logitech HD Webcam C270");
  opencv= new OpenCV(this, 1280, 720);
  cam.start();
  //println(cam.list());

  Fisica.init(this);

  fworld = new FWorld();
  fworld.setGravity(0, 900);
  fworld.setEdges();
  fworld.remove(fworld.top);
  fworld.remove(fworld.bottom);

  mountain = loadImage("mountain.png");

  for (int i=0; i<5; i++) {
    mount = new FBox(150, 100);
    mount.attachImage(mountain);
    mount.getHeight();
    mount.getWidth();
    mount.setPosition(random(50, 1230), random(480, 700));
    mount.setStatic(true);
    mount.setRestitution(0.75);
    fworld.add(mount);
  }
}


void draw() {
  opencv.loadImage(cam);
  //opencv.threshold(150);
  //image(opencv.getOutput(), 0, 0);
  image(cam, 0, 0);

  fworld.step();
  fworld.draw();

  PVector pos=opencv.max();
  int select = 0;
  if (frameCount % 2 == 0) {
    select = 0;
  } else {
    select=1;
  }

  Particle pE=new Particle(pos.x, pos.y, select);
  pE.x=pos.x;
  pE.y=pos.y;
  particles.add(pE);

  for (int i=0; i<particles.size(); i++) {
    particles.get(i).display();
  }

  //println(particles.size());

  if (particles.size() > 200) {
    particles.remove(0);
  }
}

void captureEvent(Capture c) {
  c.read();
}