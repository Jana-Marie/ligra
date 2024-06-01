$fn = 200;

cap();

module cap(){
    difference(){
        union(){
            translate([0,0,1.5])minkowski(){
                cube([19,19,0.5],center=true);
                rotate([0,0,45])cube([1,1,0.5],center=true);
            }
            hull(){
                translate([0,0,6/2+0.5])cube([8,8,4],center=true);
                translate([0,0,2/2+0.5])cube([12,12,1],center=true);
            }
        }union(){
            translate([0,0,-0.5])cylinder(d=5.2,h=3);
            translate([0,0,4/2+2.1])cube([7.3,7.3,4.1],center=true);
            
            translate([0,0,4/2+2.1])rotate([0,0,45])cube([1.7,20,4.1],center=true);
            translate([0,0,4/2+2.1])rotate([0,0,-45])cube([1.7,20,4.1],center=true);
        }
    }
}