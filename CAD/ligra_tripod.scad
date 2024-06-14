$fn=100;

// tripod mount file
//
// use this file to generate tripod mounts, the generic one should be fine already

color("DeepPink")tripod_plate(45);

module tripod_plate(spacing=45){
    // corner
    ch = 45;
    wt = 5;
    translate([0,-78,0])
    difference(){
        union(){
            hull(){
                for(i = [0:90:90]){
                    // corner
                    rotate([0,0,45+i])translate([spacing-wt/2-1/2,0,ch/2])
                    minkowski(){
                        cube([wt-1,19-1,ch-1],center=true);
                        rotate([0,90,0])cylinder(d=1,h=1);
                    }
                }
            }
            for(i = [0:90:90]){
                hull(){
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,9,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,8.5,ch],center=true);
                }
            }
        }union(){
            // corner
            for(i = [0:90:90]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt*3-0.01])cylinder(d=10,h=wt*3);
                rotate([0,90,45+i])translate([-9.5,0,spacing-wt-wt*3-0.01])cylinder(d=10,h=wt*3);
            }
            rotate([0,90,90])translate([-ch/2,0,20])cylinder(d=8,h=20);
        }
    }
}