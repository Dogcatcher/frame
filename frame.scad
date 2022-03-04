l=2100;
d=32;
w=18;
s=70;
x=850;
numx=4;
numy=3;

boardx=900;
boardy=9.5;
boardz=1200;

*color("red")translate([0,-boardy,0])cube([boardx,boardy,boardz]);
*color("blue")translate([0,-boardy,boardz])cube([boardx,boardy,boardz]);

module upright(){
  cube([w,d,l]);
  gap=(l-(numy*d))/(numy-1);
  echo(gap);
  for (n=[0:(numy-1)]){
    echo(n);
    translate([w,0,(d+gap)*n]) standoff();
  }
}


module standoff(){
  cube([w,s,d]);
}



module crossbrace(){
  cube([x,d,w]);  
}

gap=(x-(numx*w))/(numx-1);
for (n=[0:(numx-1)]){
  translate([(w+gap)*n,0,w]) upright();
}

translate([0,0,0])crossbrace();
translate([0,0,l+w])crossbrace();
translate([0,0,boardz-(w/2)])crossbrace();