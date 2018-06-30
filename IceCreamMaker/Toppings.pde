class Toppings {
    float xTopping;
    float yTopping;

    Toppings(int xArg, int yArg) {
        xTopping = (float)xArg;
        yTopping = (float)yArg;
    }
                    /*****  MÉTODOS PARA DESENHAR TOPPINGS GERADOS COM CÓDIGO  *****/
                    
    void toppingMake(int i) {
        //bolinhas
        //fill(200, 200, 200, 200);
        //stroke(0);
        //strokeWeight(1);
        //ellipse(xTopping, yTopping, sizeTopping, sizeTopping);
        
        arrayI = i;
        newTopping(randRot[i]);
    }

    void newTopping(float rotation) {
        
        //skittles
        if(toppinClickCount == 1){
          pushMatrix();
          translate((float)xTopping, (float)yTopping);
          rotate(radians((float)rotation));
          noStroke();
          fill(skittlesR[arrayI], skittlesG[arrayI], skittlesB[arrayI]);
          ellipse(0, 0, 20, 13);
          fill(255, 192);
          ellipse(3, 2, 8, 5);
          popMatrix();
        }
        //skittles
        if(toppinClickCount == 4){
          pushMatrix();
          translate((float)xTopping, (float)yTopping);
          rotate(radians((float)rotation));
          noStroke();
          fill(skittlesR[arrayI], skittlesG[arrayI], skittlesB[arrayI]);
          rect(-5, 0, 15, 4);
          popMatrix();
        }
        
        //skittles
        if(toppinClickCount == 5){
          pushMatrix();
          translate((float)xTopping, (float)yTopping);
          rotate(radians((float)rotation));
          noStroke();
          fill(skittlesR[arrayI], skittlesG[arrayI], skittlesB[arrayI]);
          star(0, 0, 5, 15, 5);
          popMatrix();
        }
        
    }
    
    void star(float x, float y, float radius1, float radius2, int npoints) {
      float angle = TWO_PI / npoints;
      float halfAngle = angle/2.0;
      beginShape();
      for (float a = 0; a < TWO_PI; a += angle) {
        float sx = x + cos(a) * radius2;
        float sy = y + sin(a) * radius2;
        vertex(sx, sy);
        sx = x + cos(a+halfAngle) * radius1;
        sy = y + sin(a+halfAngle) * radius1;
        vertex(sx, sy);
      }
      endShape(CLOSE);
  }
}
