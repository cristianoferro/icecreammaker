class Cone{

void coneEnter(int x, int y, int size){
coneX = x; 
coneY = y;
coneSize = size;
coneDraw(x, y, size);
}
                  /*****  DESENHAR CONE  *****/
void coneDraw(int x, int y, int size){

fill(#ffd7b2);
stroke(0);
strokeWeight(1);
beginShape();
vertex(x-100, y);
vertex(x+100, y);
vertex(x, y+size);
vertex(x-100, y);
endShape();

//SOMBRA
fill(0, 20);
noStroke();
beginShape();
vertex(bolaX[2]-bolaSize[2]/2, bolaY[2]);
vertex(bolaX[2]-bolaXControlPt2[2], bolaY[2]);
vertex(x, y+size);
endShape();
//BRILHO
fill(255, 80);
beginShape();
vertex(bolaX[2]+bolaSize[2]/2-20, bolaY[2]);
vertex(bolaX[2]+bolaXControlPt2[2], bolaY[2]);
vertex(x, y+size);
endShape();
}




}
