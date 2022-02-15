
//linear_extrude(1)
//import("mera_v02_10_best.svg");


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