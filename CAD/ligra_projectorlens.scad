$fn=100;

// lens planning file
//
// use this file to add your lens model, plan the lens mount
// the generic one should be great already and work on the frontcage.
// The frontcage is a supplementary mount in which the
// lens-front can freely move

if($preview){
    color("pink")rotate([180,0,30])projectorlens_lens();
    translate([0,0,0])projectorlens_connector();
}else{
    projectorlens_connector();
}


// frontcage
module projectorlens_connector(spacing=45){
    // corner
    ch = 23;
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
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,8,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,7,ch],center=true);
                }
                
                // middle sec
                cylinder(d=66+6,h=8);

                // connectors
                for(j = [-1:2:1]){
                    hull(){
                        rotate([0,90,45+i])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5)*j,0.5+12])cube([wt,1,1],center=true);
                        rotate([0,0,45+i-30*j])translate([(66+3)/2,0,0])cylinder(d=1,h=8);
                    }
                }
            }
            rotate([0,0,30])intersection(){
                translate([0,0,6/2])cube([75,75,6],center=true);
                translate([0,0,6/2])rotate([0,0,45])cube([102,102,6],center=true);
            }
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
            }
            // middle sec
            translate([0,0,-1])cylinder(d=66.1,h=15);
            translate([0,0,-1])cylinder(d=48,h=3);
            // lens screes
            rotate([0,0,30])
            union(){for(i = [-1:2:1], j = [-1:2:1]){
                translate([i*64/2,j*65/2,-0.1])cylinder(d=4.2,h=6.2);
            }
        }
        }
    }
}

// Lens
module projectorlens_lens(spacing=45){
    difference(){
        union(){
            intersection(){
                translate([0,0,3/2])cube([75,75,3],center=true);
                translate([0,0,3/2])rotate([0,0,45])cube([102,102,3],center=true);
            }
            translate([0,0,3])cylinder(d=75,h=26);
        }union(){
            translate([0,0,-1])cylinder(d=69,h=100);
            for(i = [-1:2:1], j = [-1:2:1]){
                translate([i*64/2,j*65/2,-0.1])cylinder(d=4.2,h=3.2);
            }
        }
    }
}