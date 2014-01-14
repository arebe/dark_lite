ArrayList<Ray> rays;
int nRays = 10;

int maxDepth = -300;
int lScale = 3;



void setup() {
  size(800, 600, P3D);
  colorMode(HSB, 360, 100, 100); 
  rays = new ArrayList();
  for (int i = 0; i < nRays; i++) {
    rays.add(new Ray(int(random(-width/lScale, width/lScale)), int(random(-height/lScale, height/lScale)), int(random(maxDepth, 0))));
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < rays.size(); i++) {
    Ray r = rays.get(i);
    r.update();
    r.display();
  } 
  noStroke();
  fill(0);
  translate(0, 0, 5);
  ellipse(0, 0, width/5, width/5);
  popMatrix();
}



class Ray {
  PVector loc;
  int rx, ry, rz;
  Ray(int x, int y, int z) {
    loc = new PVector(x, y, z);
  }

  void update() {
    loc.add(new PVector(random(-2, 2)*2, random(-2, 2)*2, random(-3, 0)));
    if (loc.z < maxDepth) loc.set(new PVector(int(random(-width/lScale, width/lScale)), int(random(-height/lScale, height/lScale)), 0));
  }

  void display() {
    stroke(0, 0, 100-(loc.z/maxDepth)*100, 80);
    strokeWeight(5);
    branch(loc.x, loc.y, loc.z);
    stroke(0, 0, 100-(loc.z/maxDepth)*100, 175);
    strokeWeight(1);
    branch(loc.x, loc.y, loc.z);
  }
}

void branch(float x, float y, float z) {
  float split = 0.5;
  boolean bottom = false;
  if (y >= 0){
      bottom = true;
  }
  x *= split;
  y *= split;
  
  if(bottom){
    if (x > 2 || y > 2) {
      pushMatrix();
      rotate(split);
      line(0, 0, z, x, y, z);
      translate(x, y);
      branch(x, y, z);
      popMatrix(); 

      pushMatrix(); 
      rotate(-split);
      line(0, 0, z, x, y, z);
      translate(x, y);
      branch(x, y, z);
      popMatrix();
    }
  }
  else{
    if(x < -2 || y < -2){
      pushMatrix();
      rotate(split);
      line(0, 0, z, x, y, z);
      translate(x, y);
      branch(x, y, z);
      popMatrix(); 

      pushMatrix();
      rotate(-split);
      line(0, 0, z, x, y, z);
      translate(x, y);
      branch(x, y, z);
      popMatrix();
    }
  }
}

