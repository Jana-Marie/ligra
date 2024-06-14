$fn=100;

// misc file
//
// everything else belongs in this file, currently
// the PCB feet, the PCB spacer and a wall prototype

if($preview){
    for(i=[-1:2:1],j=[-1:2:1]){
        color("DeepPink")translate([15*i,15*j-30,0])cap();
        color("HotPink")translate([10*i,10*j+20,0])foot();
    }
    color("PaleVioletRed")translate([35,-10,0])wall_patterned();
} else {
    foot();
    *cap();
}

module foot(){
    difference(){
        union(){
            cylinder(d1=12,d2=9,h=15);
        }union(){
            cylinder(d=5.1,h=15);
        }
    }
}

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

module wall_patterned(l=50){
    w=76;
    h=4;
    gw=2;//gl=10;
    gl=round((l-16)/10)-1;
    difference(){
        union(){
            translate([l/2,0,h/2])cube([l,w,h],center=true);
        }union(){
            *translate([l/2,0,h/2-0.1])cube([l-16,w-16,h+0.2],center=true);
            for(i=[-gw:1:gw],j=[0:1:gl]){
                translate([12*j+8+5,12*i,h/2])rotate([0,0,12])cube([10,10,h+0.2],center=true);
            }
        }
    }
}
