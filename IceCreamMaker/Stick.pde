class Stick {
  
  float xTopping;
  float yTopping;
  PImage img;
  Stick(PImage imgArg, float xArg, float yArg){
  xTopping = (float)xArg;
  yTopping = (float)yArg;
  img = imgArg;
  }
                    /*****  MÉTODOS PARA DESENHAR TOPPING DE STICK (IMAGEM)  *****/
                    
  void toppingMake(int i) {
      arrayI = i;
      newTopping(randRot[i]);
  }

  void newTopping(float rotation) {
      
      //skittles
      if(toppinClickCount == 3){
        pushMatrix();
        translate((float)xTopping, (float)yTopping);
        rotate(radians((float)rotation));
        
        imageMode(CENTER);
        image(img, 0, 0, 20, 20);
        
        popMatrix();
      }
      
  }
}
