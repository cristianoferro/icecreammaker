                  /*****  INICIALIZAR OBJETOS  *****/
Cone c;
Restart r;
Gelado[] g = new Gelado[3];
Toppings[] topping = new Toppings[300];
PImage[] toppnImg = new PImage[5];
ToppingImgs[] toppn = new ToppingImgs[300];
Stick[] stick = new Stick[300];
String[] toppnNames = new String[5];
Btn btn;
                  /*****  INICIALIZAR BOLAS DE GELADO  *****/

boolean bola1True = true; //SE A BOLA DO MEIO EXISTE
boolean bola0True = true; //SE A BOLA DO TOPO EXISTE

//POSIÇÕES

int[] bolaX = new int[3];
int[] bolaY = new int[3];
int bolaSize[] = new int[3];   // Diametro

                  /*****  CORES DAS BOLAS DE GELADO  *****/
                  
int[] bolaAlpha = new int[3];
int[] randGeladoR = new int[3];
int[] randGeladoG = new int[3];
int[] randGeladoB = new int[3];
boolean bolaAppear1;
boolean bolaAppear0;
boolean bolaInicialTrue = false;
boolean bolaMeioTrue = false;
boolean bgHL = false;
int[] bolaYControlPt = new int[3];
int[] bolaYControlPt2 = new int[3];
int[] bolaXControlPt = new int[3];
int[] bolaXControlPt2 = new int[3];
int[] bolaXControlPtB = new int[3];
int bgAnim = 0;

                  /*****  INICIALIZAR BOTÕES  *****/
                  
boolean addMeioTrue, addTopTrue = false;
float oneMoreBallW, oneMoreBallH, toppBtnW, toppBtnH, toppBtnC, toppBtnA, refazerW, refazerH, guardarW, guardarH;
boolean alreadyActive1, alreadyActive2 = false;
int plusW, plusH;
                  /*****  CORES DOS BOTÕES  *****/
int toppingBtnCol = 245;
int refazerBtnCol = 245;
int guardarBtnCol = 245;

                  /*****  INICIALIZAR BOOLEANS DE HOVERS  *****/
boolean bolaGoOver, bolaMeioOver, bolaTopOver = true;
boolean plus1True, plus2True, toppinTrue, refazerTrue, guardarTrue, refazerClickTrue, guardarClickTrue, toppinClickTrue, 
toppinRestart = false;
int toppinClickCount = 0;

                  /*****  CONE  *****/
//posições
int coneX, coneY, coneSize;

                  /*****  TOPPINGS  *****/

int toppingTotal = 0; //variável que guarda o número de toppings visíveis
int toppingSpace = 0; //variável para atrasar a criação de toppings por segundo para 3x mais lento
int arrayI; //passar argumentos
float[] randRot = new float[300]; //variavel para a rotação dos topings
//cores aleatórias para cada topping
float[] skittlesR = new float[300]; 
float[] skittlesG = new float[300];
float[] skittlesB = new float[300];


int saveImg = 0; //variavel para possiblitar guardar cada imagem numa nova


void setup(){
  size(1360, 720);
  
                  /*****  INICIALIZAR OBJETOS  *****/
                  
  c = new Cone();
  r = new Restart();
  btn = new Btn();
  

  
  
                  /*****  TOPPINGS  *****/
                  
  toppnNames[0] = "pepita.png";
  toppnNames[1] = "stick.png";
  toppnNames[2] = "stick.png";
  toppnNames[3] = "stick.png";
  toppnNames[4] = "stick.png";
  
                  /*****  INICIAR OBJETOS  *****/
                  
  for(int i = 0; i<topping.length; i++){
    topping[i] = new Toppings(mouseX, mouseY);
  }
  //rotação aleatória
  for(int i = 0; i<randRot.length; i++){
    randRot[i] = random(0,360);
    skittlesR[i] = random(0,360);
    skittlesG[i] = random(0,360);
    skittlesB[i] = random(0,360);
  }
  //imagens
  for(int i = 0; i<toppnImg.length; i++){
    toppnImg[i] = loadImage(toppnNames[i]);
  }
  for(int i=0; i<toppn.length ;i++){
    toppn[i] = new ToppingImgs(toppnImg[0], mouseX, mouseY);
  }
  for(int i=0; i<stick.length ;i++){
    stick[i] = new Stick(toppnImg[1], mouseX, mouseY);
  }
  
                  /*****  DEFINIÇÕES DAS BOLAS  *****/
  //tamanhos
  bolaSize[0] = 160;
  bolaSize[1] = 180;
  bolaSize[2] = 200;
  
  //posições
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
                  
  bolaAlpha[0] = 255;
  bolaAlpha[1] = 255;
  bolaAlpha[2] = 255;
  for(int i=0; i<randGeladoR.length ;i++){
  randGeladoR[i] = 245;
  randGeladoG[i] = 245;
  randGeladoB[i] = 245;
  }

                  /*****  DEFINIÇÕES DO CONE  *****/
                  
  coneX = width/2;
  coneY = height/2;
  coneSize = 300;
  
                    /*****  FAZER APARECER BOLAS DE GELADO  *****/
                    
  bolaAppear1 = false;
  bolaAppear0 = true;
  
                  /*****  DEFINIÇÕES DO "+"  *****/
                  
  plusW = width/2;
  plusH = height/2-45-180/2;
  
                    /*****  RESTART  - 
         Método com uma cópia do setup para permitir reiniciar tudo*****/
  btn.buttonSetup(); 

}  //FIM DO SETUP

void draw(){
  
                    /*****  RESTART  *****/
                    
  if(refazerClickTrue){
    toppingTotal = 0;
    r.reStart();
    addMeioTrue = false;
    addTopTrue = false;
    alreadyActive1 = false;
    alreadyActive2 = false;
    refazerClickTrue = false;
  }
  
                    /*****  GUARDAR  *****/
                    
if(guardarClickTrue){
  PImage partialSave = get(272,0,816,height);
  partialSave.save("saved/partialSave"+saveImg+".jpg");
  saveImg += 1;
  guardarClickTrue = false;
}

                    /*****  ANIMAÇÃO DO BACKGROUND - 
(em qualquer lado que se clique, o background fica mais claro, 
e em 19 frames volta à cor normal, gradualmente)  *****/
  if(bgHL){
    bgAnim += 1;
    background(193-bgAnim, 255, 253);
    if(bgAnim>19){
      bgHL = false;
      bgAnim = 0;
    }
  }else{
    //cor normal
    background(173, 255, 253);
  }

                    /*****  DESENHAR BOLAS DO GELADO  *****/
  for(int i=0; i<g.length ;i++){
  g[i] = new Gelado(bolaX[i], bolaY[i], bolaSize[i]);
}

//criar 3a bola
  if(addTopTrue){
    g[0].bolaCreate(0);
  }
//criar 2a bola
  if(addMeioTrue){
      g[1].bolaCreate(1);
    }
//criar bola inicial
  g[2].bolaCreate(2);



  if(bolaAppear1){
    if(bolaX[1] >= width/2){
      bolaX[1] = width/2-10;
    }
    if(bolaAlpha[1] >= 255){
    bolaAlpha[1] = 255;
    }
    bolaX[1] += 10;
    bolaAlpha[1] += 10;
  }else{
    bolaAlpha[1] = 255;
  }
  
  bolaAlpha[2] = 255;
  
                    /*****  DESENHAR CONE  *****/
                    
  c.coneEnter(coneX, coneY, coneSize);
  
                    /*****  VER POSIÇÃO DO RATO A CADA FRAME  *****/
                    
  g[0].update();
  
                    /*****  DESENHAR TOPPINGS  *****/
                    
  if(toppinClickTrue){
    for(int i = 0; i < toppingTotal; i++){
      topping[i].toppingMake(i);
    }
  }

  for(int i=0; i<toppn.length ;i++){
    toppn[i].toppingMake(i);
  }
  
  for(int i=0; i<stick.length ;i++){
    stick[i].toppingMake(i);
  }
  
                    /*****  CORES DOS BOTÕES - NORMAIS E COM HOVER  *****/
                    
if(toppinTrue){
  toppingBtnCol = 255;
}else{toppingBtnCol = 245;
    }
    
if(refazerTrue){
  refazerBtnCol = 255;
}else{
      refazerBtnCol = 245;
    }
    
if(guardarTrue){
  guardarBtnCol = 255;
}else{
  guardarBtnCol = 245;
  }

                    /*****  MÉTODO DOS BOTÕES  *****/
  btn.btnCreate();
    
    
                    /*****  FILTRO DE COR - não utilizado  *****/
/*
stroke(0);
fill(213, 255, 155, 20);
rect(0,0,1360,720);
*/

}  //FIM DO DRAW

void mouseDragged(){
  
                    /*****  TOPPINGS  *****/
  
  if(toppinClickTrue){
      topping[toppingTotal] = new Toppings(mouseX, mouseY);
      toppn[toppingTotal] = new ToppingImgs(toppnImg[0], mouseX, mouseY);
      stick[toppingTotal] = new Stick(toppnImg[1], mouseX, mouseY);
    if(toppingSpace<10){
     toppingSpace = toppingSpace+1;
    }
    else{toppingSpace=0;
      if(bolaGoOver || bolaMeioOver || bolaTopOver){
        toppingTotal += 1;
    
        if(toppingTotal >= 299){
          toppingTotal = 299;
        }
      }
  }
  }
  
    
}
void mouseClicked(){
  
                  /*****  ADICIONAR BOLAS DE GELADO  *****/
  //add bola do meio
  if(plus1True){
    addMeioTrue = true;
    alreadyActive1 = true;
  }
  //add bola do topo
  if(plus2True){
    addTopTrue = true;
    alreadyActive2 = true;
  }
  
                  /*****  MUDAR COR DAS BOLAS DE GELADO  *****/
  g[0].changeCol();
  bolaAppear1 = true;
  
                  /*****  ATIVAR ANIMAÇÃO DO BACKGROUND  *****/
  bgHL = true;
  bgAnim = 0;
  
                  /*****  CONTAR CLICKS DO BOTÃO DE CRIAR TOPPINGS  *****/
  if(toppinTrue){
    toppinClickCount += 1;
    toppinClickTrue = true;
    if(toppinClickCount == 6){
      toppinClickCount = 1;
    }
  }
                  /*****  SE O RATO ESTIVER EM CIMA DO BOTÃO ATIVA O BOOLEAN QUE ATIVA A FUNÇÃO  *****/
  if(refazerTrue){
    refazerClickTrue = true;
  }
  if(guardarTrue){
  guardarClickTrue = true;
  }
  
}
