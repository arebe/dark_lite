ArrayList<Ray> rays;

void setup(){
 size(400, 400);
 colorMode(HSB, 360, 100, 100); 
 rays = new ArrayList();
 for(int i = 0; i < 500; i++){
   rays.add(new Ray(int(random(-width/4, width/4)), int(random(-height/4, height/4))));
 }
}

void draw(){
 background(0);
 pushMatrix();
 translate(width/2, height/2);
 for (int i = 0; i < rays.size(); i++){
   Ray r = rays.get(i);
   r.update();
   r.display();
 } 
 noStroke();
 fill(0);
 ellipse(0, 0, width/5, width/5);
 popMatrix();
}

class Ray{
  PVector loc;
 int rx, ry;
  
  Ray(int x, int y){
    loc = new PVector(x, y);
  }
 
  void update(){
    loc.add(new PVector(random(-5, 5), random(-5, 5)));
    
  }

   void display(){
     stroke(240, 0, 100);
     strokeWeight(2);
     line(0, 0, loc.x, loc.y);
   } 
}
