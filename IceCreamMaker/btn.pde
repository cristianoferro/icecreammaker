class Btn {
                    /*****  INICIAR BOTÕES  *****/
  void buttonSetup(){
  oneMoreBallW = 40;
  oneMoreBallH = 10;
  toppBtnW = width*0.8;
  toppBtnH = height*0.2;
  toppBtnA = 50;
  toppBtnC = 150;
  
  refazerW = width*0.8;
  refazerH = height*0.3;
  toppBtnA = 50;
  toppBtnC = 150;
  
  guardarW = width*0.8;
  guardarH = height*0.4;
  toppBtnA = 50;
  toppBtnC = 150;
  }

                    /*****  CRIAR BOTÕES  *****/  
  void btnCreate(){
    //BOTÃO DE TOPPINGS
    fill(toppingBtnCol);
    rect(toppBtnW, toppBtnH, toppBtnC, toppBtnA, 10);
    
    //texto
    fill(0);
    PFont f = createFont("poppins", 16);
    String toppnString = "TOPPINGS";
    textFont(f);
    textSize(24);
    text(toppnString, toppBtnW+18, toppBtnH+34);

    //BOTÃO DE REFAZER
    fill(refazerBtnCol);
    rect(refazerW, refazerH, toppBtnC, toppBtnA, 10);
    
    //texto
    fill(0);
    String redoString = "REFAZER";
    textFont(f);
    textSize(24);
    text(redoString, refazerW+28, refazerH+34);
    
    //BOTÃO DE GUARDAR
    fill(guardarBtnCol);
    rect(guardarW, guardarH, toppBtnC, toppBtnA, 10);
    
    //texto
    fill(0);
    String saveString = "GUARDAR";
    textFont(f);
    textSize(24);
    text(saveString, guardarW+20, guardarH+34);
    
                    /*****  MUDAR COR NO HOVER  *****/  
                    
    if(plus1True && !alreadyActive1){
      //bolaX[1], bolaY[1]
      fill(255);
      rect(plusW-15, plusH, oneMoreBallW, oneMoreBallH, 7);
      rect(plusW, plusH-15, oneMoreBallH, oneMoreBallW, 7);
    }
    
    if(plus2True && !alreadyActive2){
      //bolaX[1], bolaY[1]
      fill(255);
      rect(plusW-15, plusH-oneMoreBallW, oneMoreBallW, oneMoreBallH, 7);
      rect(plusW, plusH-15-oneMoreBallW, oneMoreBallH, oneMoreBallW, 7);
    }
  
  }

}
