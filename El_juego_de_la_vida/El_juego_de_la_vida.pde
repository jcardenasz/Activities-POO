int rows=100,columns=70;
int[][]grid=new int[rows][columns];
int[][]nextG= new int[rows][columns];
int[][]empty= new int[rows][columns];

void setup(){
  size(1000,700);
  Array2D();
  nextG=grid;
  for(int i=0;i<rows;i++){
    for (int j=0;j<columns;j++){
      empty[i][j]=0;
    }
  }
}

void draw(){
  nextG=grid;
  background(0);
  frameRate(30);
//--------------------------------------
//Showing the space
  for(int i=0;i<rows;i++){
    for (int j=0;j<columns;j++){
      int x=i*10;
      int y=j*10;
      if (nextG[i][j]==1){
        fill(255);
       // stroke(#2540E5); //COLOR DE LINEAS AZUL
      }else{fill(0);}
      rect(x,y,10,10);
    }
  }
//---------------------------------
//Delimitation
  for(int i=0;i<rows;i++){grid[i][0]=0;}
  for(int j=0;j<columns;j++){grid[0][j]=0;}
  for(int i=0;i<rows;i++){grid[i][columns-1]=0;}
  for(int j=0;j<columns;j++){grid[rows-1][j]=0;}
//--------------------------------------
//Next Gen
//Count of live neighbours-----
  for(int i=0;i<rows;i++){
    for (int j=0;j<columns;j++){
      //If its not an edge:
      if(i>0 && j>0 && i<rows-1 && j<columns-1){
        int sum=0;
        sum+=grid[i-1][j-1];
        sum+=grid[i-1][j];
        sum+=grid[i-1][j+1];
        sum+=grid[i][j-1];
        sum+=grid[i][j+1];
        sum+=grid[i+1][j-1];
        sum+=grid[i+1][j];
        sum+=grid[i+1][j+1];
        
        if (grid[i][j]==1 && sum<2){
          nextG[i][j]=0; //The alive cell dies if there are less than 2 neighbours.
        }
        if (grid[i][j]==1 && sum>3){
          nextG[i][j]=0;//The alive cell dies if there are more than 3 neighbours.
        }
        if (grid[i][j]==1 && (sum==3 && sum==2) ){
          nextG[i][j]=1;//The alive cell stays alive with 2 or 3 neighbours.
        }
        if (grid[i][j]==0 && sum==3){
          nextG[i][j]=1;//The dead cell lives if has 3 neighbours.
        }
      }
    }
  }
  grid=nextG;
  nextG=empty;
}
//Array in two dimentions which gives the first state of cells.
void Array2D(){
  for(int i=0;i<rows;i++){
    for (int j=0;j<columns;j++){
      grid[i][j]=floor(random(2));
    }
  }
}
