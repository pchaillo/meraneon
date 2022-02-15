
//linear_extrude(1)
//import("mera_v02_10_best.svg");

taille_plat_x = 150;
taille_plat_y = 150;



intersection(){
  //  translate([0,0,-1]) // premier quart
   // translate([0,taille_plat_y,-1]) // 2e quart
   //   translate([taille_plat_x,0,-1]) // 3e quart 
  //  translate([taille_plat_x,taille_plat_y,-1]) // 4e quart
      //  translate([taille_plat_x*2,taille_plat_y-50,-1]) // 4e quart

cube([taille_plat_x,taille_plat_y,20]);
translate([-30,-40,0])
difference() {
linear_extrude(14)
//resize(newsize=[410,497])
import("mera_v02_14_best.svg");
    union(){
        translate([0,0,-1])
   linear_extrude(4)
//resize(newsize=[410,497])
import("mera_v02_10_best.svg");

translate([0,0,6])
linear_extrude(9)
//resize(newsize=[410,497])
import("mera_v02_10_best.svg");
    }
}
}



/*
    union(){
        translate([0,0,-1])
   linear_extrude(4)
resize(newsize=[410,497])
import("mera_v01_10_best.svg");

translate([0,0,6])
linear_extrude(4+1)
resize(newsize=[410,497])
import("mera_v01_10_best.svg");
    } */