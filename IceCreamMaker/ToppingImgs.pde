class ToppingImgs {
  
  float xTopping;
  float yTopping;
  PImage img;
  ToppingImgs(PImage imgArg, float xArg, float yArg){
  xTopping = (float)xArg;
  yTopping = (float)yArg;
  img = imgArg;
  }
                    /*****  MÉTODOS PARA DESENHAR TOPPING DE CHOCOLATE (IMAGEM)  *****/
  void toppingMake(int i) {
      arrayI = i;
      newTopping(randRot[i]);
  }

  void newTopping(float rotation) {
      
      //skittles
      if(toppinClickCount == 2){
        pushMatrix();
        translate((float)xTopping, (float)yTopping);
        rotate(radians((float)rotation));
        
        imageMode(CENTER);
        image(img, 0, 0, 20, 20);
        
        popMatrix();
      }
      
  }
}
