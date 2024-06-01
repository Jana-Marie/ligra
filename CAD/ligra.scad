include <gears.scad>

m=1;n1=10;n2=57;ad=(m/2)*(n1+n2);
echo(ad)

if($preview){
    $fn=60;
    *LAMPcage(45);
    projector_b();
    *stage();
    *translate([0,0,0])stage_fix();
    *translate([0,0,4.6])stage_fix_top2();
    *translate([-34,0,5.6])stage_fix_gear_s();
    *translate([0,0,5.6])stage_fix_gear_l();
    *stencil_cage_counter();
    *FDFrontcage_70_210(45);
    *stage_rot_2();
} else {
    $fn=300;
    TRIPODconn(45);
}

module projector_b(){
    $fn=60;
    offx=170;
    color("silver")frame(300,45);
    
    color("Khaki")translate([0,0,offx])FDcage(45);
    color("Khaki")translate([0,0,offx+98+6])FDFrontcage_28_80(45);

    translate([0,0,offx+1])lenscap();
    translate([0,0,offx+1+13.6])lens_28_80();
    
    color("Tomato")translate([0,0,160])TRIPODconn(45);
    //color("Tomato")translate([0,0,200])TRIPODconn(45);

    translate([0,0,offx-40+2.1])rotate([0,0,0])stencil();
    color("MediumVioletRed")translate([0,0,offx-40])STENCILcage(45);
    
    translate([0,0,40])LAMPcage(45);
    
    *translate([47,0,0])rotate([0,-90,0])wall_patterned();
    *translate([60,0,0])rotate([0,-90,0])wall_patterned();
    
    *translate([0,0,20])flashlight();
    *color("Olive")translate([0,0,166])FLASHLIGHTcage(45);
    *color("Olive")translate([0,0,100])FLASHLIGHTcounter();
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

module projector_a(){
    $fn=100;
    offx=280;
    color("silver")frame(400,45);
    
    color("Khaki")translate([0,0,offx])FDcage(45);
    color("Khaki")translate([0,0,offx+185+6])FDFrontcage(45);

    translate([0,0,offx+1])lenscap();
    translate([0,0,offx+1+13.6])lens();
    
    color("Tomato")translate([0,0,400])TRIPODconn(45);
    color("Tomato")translate([0,0,200])TRIPODconn(45);
    translate([0,0,offx-40+2.1])rotate([0,0,0])stencil();
    color("MediumVioletRed")translate([0,0,offx-40])STENCILcage(45);
    translate([0,0,20])flashlight();
    color("Olive")translate([0,0,166])FLASHLIGHTcage(45);
    color("Olive")translate([0,0,100])FLASHLIGHTcounter();
}

module stage_fix_gear_l(spacing=45){
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

module stage_fix_gear_s(spacing=45){
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


module stage_fix(spacing=45){
    //translate([0,0,0])stage_rot_2();
    // corner
    ch = 25;
    wt = 4;
    difference(){
        union(){
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

module stage_rot_2(){
    *translate([0,0,3.1])stencil_cage();
    *translate([0,0,-3])stage_gear();
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

module LAMPcage(spacing=45){
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
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01-wt*3])cylinder(d=10,h=wt*4);
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

module FDcage(spacing=40){
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
                hull(){
                    rotate([0,0,i])translate([30,0,13.1/2])cube([2,14,8],center=true);
                    cylinder(d=51+8,h=14);
                }
                // connectors
                for(j = [-1:2:1]){
                    hull(){
                        rotate([0,90,45+i])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5)*j,0.5+24])cube([wt,1,1],center=true);
                        rotate([0,0,45+i-45*j])translate([(51+4)/2,0,0])cylinder(d=2,h=8);
                    }
                }
            }
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
                rotate([0,90,i])translate([-13.1/2,0,51/2])cylinder(d=3.2,h=10);
            }
            // middle sec
            translate([0,0,1])cylinder(d=51.2,h=13.1);
            translate([0,0,-1])cylinder(d=48,h=3);
            translate([0,0,-0.5])cylinder(d1=48+1+0.8,d2=48-1+0.8,h=1);
            translate([0,0,14])cylinder(d=69,h=10);
        }
    }
}

module FDFrontcage_70_210(spacing=40){
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
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,9,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,8.5,ch],center=true);
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
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
            }
            // middle sec
            translate([0,0,-1])cylinder(d=66.1,h=15);
            translate([0,0,-1])cylinder(d=48,h=3);
        }
    }
}

module FDFrontcage_28_80(spacing=40){
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
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,9,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,8.5,ch],center=true);
                }
                
                // middle sec
                cylinder(d=70+6,h=8);

                // connectors
                for(j = [-1:2:1]){
                    hull(){
                        rotate([0,90,45+i])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5)*j,0.5+12])cube([wt,1,1],center=true);
                        rotate([0,0,45+i-30*j])translate([(70+3)/2,0,0])cylinder(d=1,h=8);
                    }
                }
            }
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
            }
            // middle sec
            translate([0,0,-1])cylinder(d=70.1,h=15);
            translate([0,0,-1])cylinder(d=48,h=3);
        }
    }
}

module FDFrontcage(spacing=40){
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
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,9,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,8.5,ch],center=true);
                }
                
                // middle sec
                cylinder(d=65+6,h=8);

                // connectors
                for(j = [-1:2:1]){
                    hull(){
                        rotate([0,90,45+i])translate([-0.5,19/2-0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,90,45+i])translate([-0.5,-19/2+0.5,spacing-wt])cylinder(d=1,h=wt);
                        rotate([0,0,45+i])translate([spacing-wt/2,(-19/2+0.5)*j,0.5+12])cube([wt,1,1],center=true);
                        rotate([0,0,45+i-30*j])translate([(65+3)/2,0,0])cylinder(d=1,h=8);
                    }
                }
            }
            
            
        }union(){
            // corner
            for(i = [0:90:270]){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=10,h=wt);
            }
            // middle sec
            translate([0,0,-1])cylinder(d=65.1,h=15);
            translate([0,0,-1])cylinder(d=48,h=3);
        }
    }
}

module TRIPODconn(spacing=40){
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

module stencil(){
    difference(){
        color("LightSteelBlue")cube([50,50,0.1],center=true);
        union(){
            for(i = [-1:2:1], j = [-1:2:1]){
                translate([40.5/2*j,40.5/2*i,-1])cylinder(d=3,h=2);
            }
        }
    }
}

module FLASHLIGHTcage(spacing=40){
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

module FLASHLIGHTcounter(){
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


module lenscap(){
    difference(){
        union(){
            color("darkgrey")cylinder(d=51,h=16);
            color("darkgrey")translate([0,0,15])cylinder(d=54,h=1);
        }union(){
            translate([0,0,1])cylinder(d=48,h=16);
            translate([0,0,-1])cylinder(d=45,h=3);
        }
    }
}

module lens_28_80(){
    difference(){
        union(){
            color("DimGray")cylinder(d=64,h=17);
            color("DimGray")translate([0,0,17])cylinder(d=62,h=62);
            color("DimGray")translate([0,0,17+3])cylinder(d=68,h=33);
            color("DimGray")translate([0,0,17+3+33+5])cylinder(d=68,h=20);
            color("DimGray")translate([0,0,17+62])cylinder(d1=65,d2=70,h=8.5);
            color("DimGray")translate([0,0,17+62+8.5])cylinder(d=70,h=10);
        }union(){
            translate([0,0,-0.1])cylinder(d1=36, d2=60,h=62+17+0.2);
            translate([0,0,-0.1+62+17])cylinder(d1=60, d2=68,h=20);
        }
    }
    color("AliceBlue")translate([0,0,92])resize(newsize=[68,68,14]) sphere(r=10);
    color("AliceBlue")translate([0,0,10])resize(newsize=[38,38,8]) sphere(r=10);
}

module lens(){
    difference(){
        union(){
            color("DimGray")cylinder(d=65,h=185);
            color("DimGray")translate([0,0,60])cylinder(d=78,h=85);
            color("DimGray")translate([0,0,60-14])cylinder(d2=78, d1=67,h=14);
            color("DimGray")translate([0,0,60+85])cylinder(d1=78, d2=67,h=2);
        }union(){
            translate([0,0,-0.1])cylinder(d1=36, d2=62,h=185+0.2);
        }
    }
    color("AliceBlue")translate([0,0,180])resize(newsize=[62,62,8]) sphere(r=10);
    color("AliceBlue")translate([0,0,10])resize(newsize=[38,38,8]) sphere(r=10);
}

module frame(l=10,spacing=40){
    b = spacing/sin(45);
    echo("a = ", spacing);
    echo("b = ", b);
    echo("h = " , b*sin(spacing));
    
    for(i = [0:90:270]){
        rotate([0,0,45+i])translate([spacing+10,0,0])profile(l);
    }
}

module profile(l=10){
    difference(){
        union(){
            translate([0,0,l/2-0.001/2])
            minkowski(){
                cube([20-2,20-2,l-0.001], center=true);
                cylinder(d=2,h=0.001);
            }
        }union(){
            for(i = [0:90:270]){
                rotate([0,0,i])
                hull(){
                    translate([0,9,l/2-0.1])cube([6,2,l+0.3],center=true);
                    translate([0,11,l/2-0.1])cube([9,2,l+0.3],center=true);
                }
            }
            translate([0,0,-0.1])cylinder(d=4.2, h=l+0.3);
        }
    }
}