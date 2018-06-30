class Restart{
                    /*****  RESTART  - Método com uma cópia do setup para permitir reiniciar tudo  *****/
  void reStart(){
    size(1360, 720);
  c = new Cone();
  btn = new Btn();
  btn.buttonSetup();
/*****  TOPPINGS  *****/
  toppnNames[0] = "pepita.png";
  toppnNames[1] = "stick.png";
  toppnNames[2] = "stick.png";
  toppnNames[3] = "stick.png";
  toppnNames[4] = "stick.png";
  
  for(int i = 0; i<topping.length; i++){
    topping[i] = new Toppings(mouseX, mouseY);
  }
  for(int i = 0; i<randRot.length; i++){
    randRot[i] = random(0,360);
    skittlesR[i] = random(0,360);
    skittlesG[i] = random(0,360);
    skittlesB[i] = random(0,360);
  }
  for(int i = 0; i<toppnImg.length; i++){
    toppnImg[i] = loadImage(toppnNames[i]);
  }
  for(int i=0; i<toppn.length ;i++){
    toppn[i] = new ToppingImgs(toppnImg[0], mouseX, mouseY);
  }
  for(int i=0; i<stick.length ;i++){
    stick[i] = new Stick(toppnImg[1], mouseX, mouseY);
  }
  
    bolaSize[0] = 160;
    bolaSize[1] = 180;
    bolaSize[2] = 200;

    bolaX[0] = width/2;
    bolaY[0] = height/2-88;
    bolaX[1] = width/2;
    bolaY[1] = height/2-45;
    bolaX[2] = width/2;
    bolaY[2] = height/2;
    
    bolaYControlPt[2] = 57;
    bolaYControlPt[1] = 50;
    bolaYControlPt[0] = 45;
    
    bolaYControlPt2[2] = 90;
    bolaYControlPt2[1] = 85;
    bolaYControlPt2[0] = 80;
    
    bolaXControlPt[2] = 80;
    bolaXControlPt[1] = 75;
    bolaXControlPt[0] = 70;
    
    bolaXControlPt2[2] = 70;
    bolaXControlPt2[1] = 65;
    bolaXControlPt2[0] = 60;
    
    bolaXControlPtB[2] = 20;
    bolaXControlPtB[1] = 15;
    bolaXControlPtB[0] = 10;
  //stroke das bolas
  bolaAlpha[0] = 255;
  bolaAlpha[1] = 255;
  bolaAlpha[2] = 255;
  for(int i=0; i<randGeladoR.length ;i++){
  randGeladoR[i] = 245;
  randGeladoG[i] = 245;
  randGeladoB[i] = 245;
  }

  //gradiente do fundo
  
  //cone
  coneX = width/2;
  coneY = height/2;
  coneSize = 300;
  bolaAppear1 = false;
  bolaAppear0 = true;
  
  plusW = width/2;
  plusH = height/2-45-180/2;
  };
}
