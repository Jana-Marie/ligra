$fn=100; 

// PAR-spot file
//
// used to generate the PAR-spot mount that I like to use

if($preview){
    color("DeepPink")par_spot_cage();
} else {
    par_spot_cage();
}

module par_spot_cage(spacing=45){
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
                cylinder(d=54.1+8,h=18);
                // connectors
                for(j = [-1:2:1]){
                    hull(){
                        rotate([0,90,45+i])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5)*j,0.5+24])cube([wt,1,1],center=true);
                        rotate([0,0,45+i-45*j])translate([(54.1+3)/2,0,0])cylinder(d=2,h=17);
                    }
                }
                // screw reinforements
                if(i < 180)
                {
                    translate([0,0,12])rotate([90,0,i])translate([0,0,26])cylinder(d1=12,d2=6,h=8);
                }
            }
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01-wt*3])cylinder(d=12,h=wt*4);
                if(i < 180)
                {
                    translate([0,0,12])rotate([90,0,i])cylinder(d=2.3,h=100);
                }
            }
            // middle sec
            translate([0,0,7])cylinder(d=54.1,h=17);
            translate([0,0,-1])cylinder(d=52,h=10);
        }
    }
}

// todo draw actual PAR spot