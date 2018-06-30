class Gelado{
float x, y, size;

Gelado(int xArg, int yArg, int sizeArg){

x = xArg;
y = yArg;
size = sizeArg;
}
                    /*****  CRIAR BOLAS DO GELADO  *****/
void bolaCreate(int i){
  strokeWeight(1);
  //variaveis - transformar
  fill(randGeladoR[i], randGeladoG[i] ,randGeladoB[i] , bolaAlpha[i]);
  stroke(0, 0, 0, bolaAlpha[i]);
  //ellipse(x, y, size, size);
  arc(x, y, size, size, -3.15, 0);
  
                    /*****  SOMBRAS  *****/
noStroke();
fill(0, 50);
beginShape();
vertex(bolaX[i]-bolaSize[i]/2, bolaY[i]);
//control pts
bezierVertex(bolaX[i]-bolaSize[i]/2, bolaY[i]-bolaYControlPt[i], 
bolaX[i]-bolaYControlPt[i], bolaY[i]-bolaSize[i]/2, 
bolaX[i], bolaY[i]-bolaSize[i]/2);
//2a curva
vertex(bolaX[i], bolaY[i]-bolaSize[i]/2);
//control pts
bezierVertex(bolaX[i]-40, bolaY[i]-bolaYControlPt2[i], 
bolaX[i]-bolaXControlPt[i], bolaY[i]-50,
bolaX[i]-bolaXControlPt2[i], bolaY[i]-10);

//3a curva
vertex(bolaX[i]-bolaXControlPt2[i], bolaY[i]-10);
//control pts
bezierVertex(bolaX[i]-bolaXControlPt2[i], bolaY[i]-5, 
bolaX[i], bolaY[i],

bolaX[2]+bolaXControlPt2[2], bolaY[2]);
endShape();


                    /*****  BRILHOS  *****/
noStroke();
fill(255, 100);
beginShape();
vertex(bolaX[i]+bolaSize[i]/2-bolaXControlPtB[i], bolaY[i]);
//control pts
bezierVertex(bolaX[i]+bolaSize[i]/2, bolaY[i]-bolaYControlPt[i], 
bolaX[i]+bolaYControlPt[i], bolaY[i]-bolaSize[i]/2, 
bolaX[i], bolaY[i]-bolaSize[i]/2);
//2a curva
vertex(bolaX[i], bolaY[i]-bolaSize[i]/2);
//control pts
bezierVertex(bolaX[i]+40, bolaY[i]-bolaYControlPt2[i], 
bolaX[i]+bolaXControlPt[i], bolaY[i]-50,
bolaX[i]+bolaXControlPt2[i], bolaY[i]);
endShape();

}

                    /*****  ATUALIZAR A POSIÇÃO DO RATO A CADA FRAME  *****/
void update() {
  //VERDADEIRO SE O RATO ESTIVER NA BOLA INICIAL
  if ( overBolaInicial(bolaX[2], bolaY[2], bolaSize[2], bolaY[2])){
    bolaGoOver = true;
  }
  else{
    bolaGoOver = false;
  }
  //VERDADEIRO SE O RATO ESTIVER NA BOLA DO MEIO
  if ( overBolaMeio(bolaX[1], bolaY[1], bolaSize[1], bolaY[1]) && addMeioTrue){
    bolaMeioOver = true;
  }
  else{
    bolaMeioOver = false;
  }
  //VERDADEIRO SE O RATO ESTIVER NA BOLA DO TOPO
  if ( overBolaTopo(bolaX[0], bolaY[0], bolaSize[0], bolaY[0]) && addTopTrue){
    bolaTopOver = true;
  }
  else{
    bolaTopOver = false;
  }
  
  //VERDADEIRO SE O RATO ESTIVER NO BOTÃO DE +
  if(overRect(plusW-15, plusH-15, (int) oneMoreBallW, (int) oneMoreBallW)){
    plus1True = true;
  }
  else{
    plus1True = false;
  }
  //VERDADEIRO SE O RATO ESTIVER NO SEGUNDO BOTÃO DE +
  if(overRect(plusW-15, plusH-15-(int)oneMoreBallW, (int) oneMoreBallW, (int) oneMoreBallW) && addMeioTrue){
    plus2True = true;
  }
  else{
    plus2True = false;
  }
  //VERDADEIRO SE O RATO ESTIVER NO BOTÃO DE TOPPINGS
  if(overRect((int) toppBtnW, (int) toppBtnH, (int) toppBtnC, (int) toppBtnA)){
    toppinTrue = true;
  }
  else{
    toppinTrue = false;
  }
  //VERDADEIRO SE O RATO ESTIVER DO BOTÃO DE REFAZER
  if(overRect((int) refazerW, (int) refazerH, (int) toppBtnC, (int) toppBtnA)){
    refazerTrue = true;
  }
  else{
    refazerTrue = false;
  }
  //VERDADEIRO SE O RATO ESTIVER DO BOTÃO DE GUARDAR
  if(overRect((int) guardarW, (int) guardarH, (int) toppBtnC, (int) toppBtnA)){
    guardarTrue = true;
  }
  else{
    guardarTrue = false;
  }
  
}

                    /*****  MÉTODOS PARA RESTRINGIR AREA DE DETEÇÃO DO RATO  *****/

  boolean overBolaInicial(int x, int y, int diameter, int rectHeight) {
  float disX = x - mouseX;
  float disY = y - mouseY;

  if (( sqrt(sq(disX) + sq(disY)) < diameter/2.1  && (mouseY < rectHeight))) {
    // 
    bolaInicialTrue = true;
    return true;
    
  } else {
    bolaInicialTrue = false;
    return false;
  }
}

boolean overBolaMeio(int x, int y, int diameter, int rectHeight) {
  float disX = x - mouseX;
  float disY = y - mouseY;
      //adicionar que (&&) se bola do topo for verdade - && !bolaInicialTrue
  if (( sqrt(sq(disX) + sq(disY)) < diameter/2.1  && (mouseY < rectHeight)) && !bolaInicialTrue) {
    // 
    bolaMeioTrue = true;
    return true;
  } else {
    bolaMeioTrue = false;
    return false;
  }
}

boolean overBolaTopo(int x, int y, int diameter, int rectHeight) {
  float disX = x - mouseX;
  float disY = y - mouseY;

  if (( sqrt(sq(disX) + sq(disY)) < diameter/2.1  && (mouseY < rectHeight)) && !bolaMeioTrue && !bolaInicialTrue) {
    // 
    return true;
  } else {
    return false;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
                    /*****  MÉTODO PARA MUDAR CORES DAS BOLAS DE GELADO ALEATORIAMENTE  *****/

  void changeCol(){
    
    if(bolaGoOver){
      randGeladoR[2] = (int) random(0, 255);
      randGeladoG[2] = (int) random(0, 255);
      randGeladoB[2] = (int) random(0, 255);
  
    }
    if(bolaMeioOver){
      randGeladoR[1] = (int) random(0, 255);
      randGeladoG[1] = (int) random(0, 255);
      randGeladoB[1] = (int) random(0, 255);
    }
    if(bolaTopOver){
      randGeladoR[0] = (int) random(0, 255);
      randGeladoG[0] = (int) random(0, 255);
      randGeladoB[0] = (int) random(0, 255);
    }
  }
  
  



}
