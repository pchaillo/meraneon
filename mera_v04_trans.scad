
//linear_extrude(1)
//import("mera_v02_10_best.svg");

taille_plat_x = 20; //200
taille_plat_y = 20; //200

trans_e = 20; //taille de la transition en mm

intersection(){

   // translate([0,0,-1]) // premier quart
  //  translate([0,taille_plat_y,-1]) // 2e quart
   //   translate([taille_plat_x,0,-1]) // 3e quart
    //  translate([taille_plat_x,taille_plat_y,-1]) // 4e quart
          translate([taille_plat_x*3,taille_plat_y*3,-1]) // 4e quart

//color([1,0,0])cube([taille_plat_x,taille_plat_y,25]);

difference(){ // pour les transitions
translate([-trans_e/2,-trans_e/2,-2])cube([taille_plat_x+trans_e,taille_plat_y+trans_e,20]);
translate([trans_e/2,trans_e/2,-4]) cube([taille_plat_x-trans_e,taille_plat_y-trans_e,20+6]);
}

/*
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
*/
//translate([0,0,6])
linear_extrude(2)
//resize(newsize=[410,497])
import("mera_v02_10_best.svg");
    }
//}
//}

//intersection(){
  //  color([1,0,0])cube([taille_plat_x,taille_plat_y,25]);

/*
difference(){
translate([-trans_e/2,-trans_e/2,-2])cube([taille_plat_x+trans_e,taille_plat_y+trans_e,20]);
translate([trans_e/2,trans_e/2,-4]) cube([taille_plat_x-trans_e,taille_plat_y-trans_e,20+6]);
}*/
//}

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