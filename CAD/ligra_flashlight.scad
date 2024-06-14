$fn=100;

// flashlight file
//
// my first light source, a good one even, a simple flashlight

if($preview){
    translate([0,0,-146])flashlight();
    color("DeepPink")translate([0,0,0])flashlight_cage(45);
    color("HotPink")translate([0,0,-52])flashlight_counter();
} else {
    flashlight_cage(45);
    *flashlight_counter();
}

module flashlight(){
    difference(){
        union(){
            color("SlateGray")translate([0,0,5])cylinder(d=29.6,h=160-5);
            color("SlateGray")translate([0,0,160-39])cylinder(d=38,h=39);
            color("SlateGray")translate([0,0,160-39-17])cylinder(d2=38,d1=30,h=17);
            color("SlateGray")translate([0,0,160-39-17])cylinder(d2=38,d1=30,h=17);
            color("SlateGray")translate([0,0,5])resize(newsize=[29.6,29.6,10]) sphere(r=10);
        }union(){
            translate([0,0,160-9])cylinder(d=36,h=10);
        }
    }
    color("AliceBlue")translate([0,0,160-5])resize(newsize=[36,36,8]) sphere(r=10);
}

module flashlight_cage(spacing=45){
    // corner
    ch = 28;
    wt = 4;
    difference(){
        union(){
            for(i = [0:90:270]){
                // corner
                rotate([0,0,45+i])translate([spacing-wt/2-1/2,0,ch/2])
                minkowski(){
                    cube([wt-1,19-1,ch-1],center=true);
                    rotate([0,90,0])cylinder(d=1,h=1);
                }
                hull(){
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,9,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,8.5,ch],center=true);
                }
                
                // middle sec
                cylinder(d=38.1+8,h=18);
                // connectors
                for(j = [-1:2:1]){
                    hull(){
                        rotate([0,90,45+i])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5)*j,0.5+24])cube([wt,1,1],center=true);
                        rotate([0,0,45+i-45*j])translate([(38.1+3)/2,0,0])cylinder(d=2,h=17);
                    }
                }
            }
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
                
                rotate([0,0,45+i])translate([0,30,20])cube([30,2,4],center=true);
            }
            // middle sec
            translate([0,0,-1])cylinder(d=38.1,h=17);
            translate([0,0,14])cylinder(d=36,h=5);
        }
    }
}

module flashlight_counter(){
    difference(){
        union(){
            cylinder(d=36,h=10);
            for(i = [0:90:270]){
                hull(){
                    rotate([0,0,45+i-10])translate([33/2,0,8])cylinder(d=3,h=2);
                    rotate([0,0,45+i+10])translate([33/2,0,8])cylinder(d=3,h=2);
                    rotate([0,0,45+i])translate([45/2,0,1])cylinder(d=2,h=2);
                }
            }
        }union(){
            translate([0,0,-0.5])cylinder(d=30,h=20);
        }
    }
}
