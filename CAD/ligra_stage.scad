include <gears.scad>

// gear calculations, ignore this
m=1;n1=10;n2=57;ad=(m/2)*(n1+n2);

$fn=100;

// stage file
//
// as stage, for example a stencil is meant. On the stage resides what will become the focus
// of ligra, figuratively and metaphorically. Use this file to plan what will be projected

// this file is still a bit messy ;-;

if($preview){
    stage_motor_rot_assembly();
}else{
}

module stage_motor_rot_assembly(spacing=45){
    stage_motor_rot_base(spacing);
    color("PaleVioletRed")stage_motor_rot_rotor();
    color("HotPink")translate([0,0,4.1])stencil_cage();
    color("DeepPink")translate([0,0,6])stencil_cage_counter();
    if($preview)translate([0,0,6.0])stencil();
        
    // optional for motor use, but handy for hand usage
    translate([0,0,-3])rotate([180,0,0])stage_motor_rot_gear_l();
    // optional for motor use
    translate([-34.5,0,-3])rotate([180,0,0])stage_motor_rot_gear_s();
}

// motor-rot stage for 2D printed stencils, this is the most useful one imo
// its base
module stage_motor_rot_base(spacing=45){
    //translate([0,0,0])stage_rot_2();
    // corner
    ch = 25;
    wt = 4;
    difference(){
        color("LightPink")union(){
            for(i = [0:90:270]){
                // corner
                rotate([0,0,45+i])translate([spacing-wt/2-1/2,0,ch/2-0.5])
                minkowski(){
                    cube([wt-1,19-1,ch-1],center=true);
                    rotate([0,90,0])cylinder(d=1,h=1);
                }
                hull(){
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2-0.5])cube([wt,9,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2-0.5])cube([wt+0.33,8.5,ch],center=true);
                }
            }
            // middle cylinder
            for(i = [0:90:270]){
                hull(){
                    translate([0,0,-0.4])cylinder(d=58,h=5.05);
                    rotate([0,0,45+i])translate([spacing-wt/2-1/2,0,3.6/2-0.5])cube([1,19-1,3.6],center=true);
                }
            }
            // motor
            translate([-34,0,-0.5])cylinder(d=8,h=6);
            
        }union(){
            // corner
            for(i = [00:90:270]){
                rotate([0,90,45+i-90])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
                rotate([0,0,45+i])translate([spacing+1,0,0])rotate([0,-45,0])cube([wt,22,2],center=true);
                rotate([0,0,45+i])translate([spacing+1,0,ch])rotate([0,45,0])cube([wt,22,2],center=true);
                // screwhole
                rotate([0,0,45+i])translate([33,0,-1])cylinder(d=2.3,h=5);                
                
            }
            // middle
            translate([0,0,0.4])union(){
                translate([0,0,-1])cylinder(d=51.1,h=6);
                *translate([0,0,-0.25])cylinder(d2=51.1,d1=50.5,h=0.5);
                *translate([0,0,-1])cylinder(d=50,h=3.5);
            }
            // motor
            translate([-34,0,-0.75])cylinder(d=5.99,h=8);
            // ball bearing
            for(i = [0:1:4]){
                rotate([0,0,360/4*i+29])translate([56/2+1,0,0.7/4])cylinder(d=10,h=5);
            }
        }
    }
    
    // ball bearing
    if($preview){
        for(i = [0:1:4]){
            rotate([0,0,360/4*i+29])translate([56/2+1,0,0.7/4])ballbearing();
        }
    }
    for(i = [0:1:4]){
        rotate([0,0,360/4*i+29])translate([56/2+1,0,0.7/4])cylinder(d=4,h=3);
    }
}


module stage_motor_rot_rotor(){
    difference(){
        union(){
            intersection(){
                translate([0,0,0])minkowski(){
                    cylinder(d=49-0.7+0.8,h=5-0.7);
                    sphere(d=0.7);
                }
                translate([0,0,0.7/4-0.05/2])union(){
                    cylinder(d=48.8,h=4.05);
                    translate([0,0,4.05])cylinder(d1=49,d2=54,h=1);
                    translate([0,0,-1])cylinder(d2=49,d1=54,h=1);
                }
            }
        }union(){
            // optical path
            translate([0,0,-1])cylinder(d=37,h=11);
            // magnets!!!1!
            for(i = [0:1:12]){
                if(i != 2 && i != 6 && i != 10){
                    rotate([0,0,360/12*i])translate([42/2+1,0,-0.5])cylinder(d=3.1,h=5.1);
                }
                if( i == 0 || i == 4 || i == 8){
                    rotate([0,0,360/12*i+60])translate([42/2+1,0,-0.5])cylinder(d=2.2,h=6);
                }
            }
        }
    }
}

module stencil_cage_counter(){
    // Stencil
    difference(){
        union(){
            translate([0,0,0])cylinder(d=39.2,h=1);
        }union(){
            // inner cylinders
            translate([0,0,-1])cylinder(d=35,h=11);
        }
    }
}

module stencil_cage(){
    // Stencil
    *translate([0,0,1.55])union(){
        color("black")cylinder(d=35,h=0.201);
        color("red")cylinder(d=39,h=0.2);
    }
    difference(){
        union(){
            translate([0,0,0.2])minkowski(){
                hull(){
                    // cylinder
                    translate([0,0,])cylinder(d=42,h=2.5-0.4);
                    // magnets
                    for(i = [0:1:2]){
                        rotate([0,0,360/3*i])translate([42/2+1,0,0])cylinder(d=5.1,h=2.5);
                    }
                }
                // chamfer thingie
                sphere(d=0.4);
            }
        }union(){
            // inner cylinders
            translate([0,0,1.5])cylinder(d=39.2,h=11);
            translate([0,0,-1])cylinder(d=35,h=11);
            
            // magnets
            for(i = [0:1:2]){
                rotate([0,0,360/3*i])translate([42/2+1,0,0.5])cylinder(d=3.1,h=2.6);
            }
            // alignment
            translate([-15,0,1+1.5])cube([30,2,2],center=true);
        }
    }
}

module ballbearing(id=4,od=9,h=4){
    color("silver")
    difference(){
        union(){
            cylinder(d=od,h=h);
        }union(){
            translate([0,0,-1])cylinder(d=id,h=h+2);
        }
    }
}

module stencil(){
    color("LightSteelBlue")cylinder(d=38,h=0.1);
}


module stage_motor_rot_gear_l(spacing=45){
    color("yellow")
    intersection(){
        difference(){
            union(){
                spur_gear(m, n2, 3, 49,optimized=false);
                translate([0,0,-2.7])cylinder(d=49,h=5.7);
            }union(){
                // middle
                translate([0,0,-3])cylinder(d=38,h=10);
                for(i = [0:1:12]){
                    if( i == 0 || i == 4 || i == 8){
                        rotate([0,0,360/12*i+60])translate([42/2+1,0,-3])cylinder(d=3.05,h=10);
                    }
                }
            }
        }
        union(){
            translate([0,0,-2.7])cylinder(d=54.8,h=15);
            translate([0,0,0.5])cylinder(d=59,h=2);
            translate([0,0,2.5])cylinder(d1=59,d2=54.8,h=0.5);
            translate([0,0,00])cylinder(d2=59,d1=54.8,h=0.5);
        }
    }
}

module stage_motor_rot_gear_s(spacing=45){
    color("yellow")
    intersection(){
        difference(){
            union(){
                translate([0,0,0])spur_gear(m, n1, 3, 2.05,optimized=false);
                translate([2-0.45,0,3/2])cube([2,2,3],center=true);
            }union(){
            }
        }
        union(){
            translate([0,0,0.5])cylinder(d=12,h=2);
            translate([0,0,2.5])cylinder(d1=12,d2=7.5,h=0.5);
            translate([0,0,00])cylinder(d1=7.5,d2=12,h=0.5);
        }
    }
}


// other, clean me uwu 
module stage_motor_rot_gear(){
    difference(){
        union(){
            // base cylinder
            translate([0,0,-1])cylinder(d=49,h=4);
            cylinder(d=52,h=2.45);
        }union(){
            // optical path
            translate([0,0,-2])cylinder(d=40,h=12);
            
            // magnets!!!1!
            for(i = [0:1:2]){
                rotate([0,0,360/3*i+60])translate([42/2+1,0,-1.1])cylinder(d=3,h=6);
            }
        }
    }
}

module stage_fix_top2(spacing=45){
    color("yellow")
    difference(){
        union(){
            hull(){
                for(i = [0:90:270]){
                    rotate([0,0,45+i])translate([33,0,0])cylinder(d=12,h=1);
                }
                cylinder(d=50.5,h=1);
            }
            for(i = [0:1:4]){
                rotate([0,0,360/4*i+29])translate([56/2+1,0,-1.5])cylinder(d=4,h=1.5);
            }
        }union(){
            // corner
            for(i = [00:90:270]){
                // screwhole
                rotate([0,0,45+i])translate([33,0,-1])cylinder(d=3.05,h=5);                
                
            }
            // middle
            translate([0,0,-2])cylinder(d=50,h=3.5);
        }
    }
}


module stage_fix_top(spacing=45){
    color("yellow")
    difference(){
        union(){
            hull(){
                for(i = [0:90:270]){
                    rotate([0,0,45+i])translate([33,0,0])cylinder(d=12,h=1);
                }
                cylinder(d=50.5,h=1);
            }
        }union(){
            // corner
            for(i = [00:90:270]){
                // screwhole
                rotate([0,0,45+i])translate([33,0,-1])cylinder(d=3.05,h=5);                
                
            }
            // middle
            translate([0,0,-2])cylinder(d=50,h=3.5);
        }
    }
}





module stage_rot_yaw(){
    *translate([0,0,0])stage_rot();
    difference(){
        union(){
            translate([0,0,-0.4])cylinder(d=58,h=4);
            
            // hook
            rotate([0,0,-45-55])translate([58/2+0.8,0,4/2-0.4])rotate([0,0,20])cube([1,10,4],center=true);
            rotate([0,0,-45+55])translate([58/2+0.8,0,4/2-0.4])rotate([0,0,-20])cube([1,10,4],center=true);
            
            // screws
            hull(){
                rotate([0,0,180])translate([58/2+4,0,-0.4])cylinder(d=8,h=4);
                translate([0,0,-0.4])cylinder(d=58,h=4);
            }
            hull(){
                rotate([0,0,180-90])translate([58/2+4,0,-0.4])cylinder(d=8,h=4);
                translate([0,0,-0.4])cylinder(d=58,h=4);
            }
            rotate([0,0,90])translate([58/2+10.5,0,1.5])rotate([0,-90,0])cylinder(d=2,h=6);
            rotate([0,0,180])translate([58/2+10.5,0,1.5])rotate([0,-90,0])cylinder(d=2,h=6);
            if($preview){
                color("pink")rotate([0,0,-45])translate([58-10,0,1.5])rotate([0,-90,0])cylinder(d=2.9,h=20);
                color("pink")rotate([0,0,-45])translate([58-10,0,1.5])rotate([0,-90,0])cylinder(d=5,h=2);
                
                color("pink")rotate([0,0,90])translate([58/2+4,0,-10])cylinder(d=4.05,h=30);
                color("pink")rotate([0,0,90])translate([58/2+4,0,-10])cylinder(d=8.05,h=4);
                
                color("pink")rotate([0,0,180])translate([58/2+4,0,-10])cylinder(d=2.9,h=30);
                color("pink")rotate([0,0,180])translate([58/2+4,0,-10])cylinder(d=5,h=2);
            }
        }union(){
            translate([0,0,-1.25])cylinder(d=51.1,h=4);
            translate([0,0,2.75])cylinder(d1=51.1,d2=50.5,h=0.5);
            translate([0,0,0.25])cylinder(d=50,h=3.5);
            // head
            rotate([0,0,-45])translate([58/2-0.6,0,-0.5+2])sphere(d=3);
            // screws
            rotate([0,0,180-90])translate([58/2+4,0,-0.5])cylinder(d=3.3,h=4.2);
            rotate([0,0,180])translate([58/2+4,0,-0.5])cylinder(d=3.3,h=4.2);
            
        }
    }
}




module stage_rot(){
    *translate([0,0,3.1])stencil_cage();
    *translate([0,0,-3])stage_gear();
    difference(){
        union(){
            // magnets and rotation
            for(i = [0:1:12]){
                if(i != 2 && i != 6 && i != 10){
                    hull(){
                        // base cylinder
                        cylinder(d=42,h=3);
                        
                        minkowski(){
                            rotate([0,0,360/12*i])translate([42/2+1,0,0.7/2])cylinder(d=7-0.7-0.1,h=3-0.7);
                            sphere(d=0.7);
                        }
                    }
                }
                // gear conn
                hull(){
                    // base cylinder
                    cylinder(d=42,h=3);
                    minkowski(){
                        rotate([0,0,360/3*i+60])translate([42/2+1,0,0.25])cylinder(d=5-0.5,h=3-0.5);
                        sphere(d=0.5);
                    }
                }
            }
        }union(){
            // optical path
            translate([0,0,-1])cylinder(d=37,h=11);
            
            // magnets!!!1!
            for(i = [0:1:12]){
                if(i != 2 && i != 6 && i != 10){
                    rotate([0,0,360/12*i])translate([42/2+1,0,-0.1])cylinder(d=3.1,h=2.6);
                }
                if( i == 0 || i == 4 || i == 8){
                    rotate([0,0,360/12*i+60])translate([42/2+1,0,-0.1])cylinder(d=2.2,h=5);
                }
            }
        }
    }
}

module stage_gear(){
    difference(){
        union(){
            // base cylinder
            translate([0,0,-1])cylinder(d=49,h=4);
            cylinder(d=52,h=2.45);
        }union(){
            // optical path
            translate([0,0,-2])cylinder(d=40,h=12);
            
            // magnets!!!1!
            for(i = [0:1:2]){
                rotate([0,0,360/3*i+60])translate([42/2+1,0,-1.1])cylinder(d=3,h=6);
            }
        }
    }
}



module stage(spacing=45){
    // corner
    ch = 30;
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
                if(i == 0 || i == 270){
                    hull(){
                        rotate([0,90,45+i-90])translate([-ch+0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                    }
                    hull(){
                        rotate([0,90,45+i])translate([-ch+0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i-90])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                    }
                }
                // stage connect
                if(i == 90 || i == 180){
                    hull(){
                        rotate([0,90,45+i])translate([-ch+0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-ch+2.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i-90])translate([-ch+0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i-90])translate([-ch+2.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,i])translate([58/2+4,0,ch-wt+1])cylinder(d=6,h=2.5);
                    }
                    rotate([0,0,i])translate([58/2+4,0,ch-wt+2])rotate([0,-90,0])cylinder(d=2,h=6);
                }
            }
            hull(){
                rotate([0,90,45+90])translate([-ch+0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                rotate([0,0,90])translate([58/2+4,0,ch-wt+1])cylinder(d=6,h=2.5);
            }
            hull(){
                rotate([0,90,45+90])translate([-ch+0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                rotate([0,0,180])translate([58/2+4,0,ch-wt+1])cylinder(d=6,h=2.5);
            }
        }union(){
            // corner
            for(i = [90:90:270]){
                rotate([0,90,45+i-90])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
                rotate([0,0,45+i])translate([spacing+0.5,0,0])rotate([0,-45,0])cube([wt,22,2],center=true);
                rotate([0,0,i])translate([58/2+4,0,ch-wt+1-0.1])cylinder(d=3.2,h=0.5);
                
            }
            // pin
            rotate([0,0,-45])translate([58/2-0.25,0,8.5])rotate([0,90,0])cylinder(d=2.3,h=30);

            // upper lip
            hull(){
                rotate([0,0,-45])translate([58/2-0.25,-3,8.5+7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
                rotate([0,0,-45])translate([58/2-0.25,+3,8.5+7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
            }
            hull(){
                rotate([0,0,-45])translate([58/2-0.25,-3,8.5+7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
                rotate([0,0,-45])translate([58/2-0.25,-2,8.5+4])rotate([0,90,0])cylinder(d=2.3,h=30);
            }
            hull(){
                rotate([0,0,-45])translate([58/2-0.25,+3,8.5+7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
                rotate([0,0,-45])translate([58/2-0.25,+2,8.5+4])rotate([0,90,0])cylinder(d=2.3,h=30);
            }
            // lower lip
            hull(){
                rotate([0,0,-45])translate([58/2-0.25,-3,8.5-7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
                rotate([0,0,-45])translate([58/2-0.25,+3,8.5-7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
            }
            hull(){
                rotate([0,0,-45])translate([58/2-0.25,-3,8.5-7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
                rotate([0,0,-45])translate([58/2-0.25,-2,8.5-4])rotate([0,90,0])cylinder(d=2.3,h=30);
            }
            hull(){
                rotate([0,0,-45])translate([58/2-0.25,+3,8.5-7.6])rotate([0,90,0])cylinder(d=2.3,h=30);
                rotate([0,0,-45])translate([58/2-0.25,+2,8.5-4])rotate([0,90,0])cylinder(d=2.3,h=30);
            }
        }
    }
}




module STENCILcage(spacing=40){
    // corner
    ch = 22;
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
                
                // bars
                hull(){
                    rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                    rotate([0,90,45+i-90])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                    rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5),0.5+4])cube([wt,1,1],center=true);
                    rotate([0,0,45+i-90])translate([spacing-wt/2,(19/2-0.5),0.5+4])cube([wt,1,1],center=true);
                }
                
                // pins
                for(k = [-1:2:1], l = [-1:2:1]){
                    hull(){
                    #translate([52/2*k,69/2*l,0])cylinder(d=wt,h=2);
                    #translate([69/2*k,52/2*l,0])cylinder(d=wt,h=2);
                    translate([40.5/2*k,40.5/2*l,0])cylinder(d=4,h=2);
                    }
                    hull(){
                        translate([40.5/2*k,40.5/2*l,0])cylinder(d=2.95,h=1);
                        translate([40.5/2*k,40.5/2*l,3])sphere(d=3.05);
                    }
                }
            }
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
            }
        }
    }
}

