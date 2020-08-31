class Particle {

  PImage sheep;
  PImage sheep1;
  float xM, yM;

  Particle(float xIn, float yIn, int select) {
    pushStyle();

    xM=xIn;
    yM=yIn;

    FCircle ball = new FCircle(3);

    if (select == 0) {
      sheep = loadImage("sheep.png");
      ball.attachImage(sheep);
    } else {
      sheep1 = loadImage("sheep1.png");
      ball.attachImage(sheep1);
    }

    ball.setPosition(xM, yM);
    ball.setVelocity(0, 600);
    ball.setRestitution(0.8);
    ball.setDamping(0);
    fworld.add(ball);
    popStyle();
  }

  void display() {
  }
}