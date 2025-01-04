use <ligra_stage.scad>
use <ligra_frame.scad>

$fn=100;

// Lava-Disk file

if($preview){
    // frame
    color("silver")frame(30,45);
    translate([0,-15.5,1.5+4])lava_disk();
    lava_disk_stage();
    mirror([1,0,0])lava_disk_stage();
    mirror([0,1,0])translate([0,-78,0])lava_disk_motor_mount();
    lava_disk_servo_shaft();
    lava_disk_servo_shaft_bulge();
} else {
    lava_disk_motor_mount();
}

module lava_disk_stage(spacing=45){
    // corner
    ch = 34;
    wt = 4;
    i=0;
    difference(){
        union(){
            
            echo(i);
            // corner
            rotate([0,0,45+i])translate([spacing-wt/2-1/2,0,ch/2])
            minkowski(){
                cube([wt-1,19-1,ch-1],center=true);
                rotate([0,90,0])cylinder(d=1,h=1);
            }
            hull(){
                rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,8.5,ch],center=true);
                rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,7.5,ch],center=true);
            }
            
            // screw
            if($preview){
                color("silver")rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                color("silver")rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01])cylinder(d=9.5,h=5);
            }
            
            // ball bearing
            if($preview){
                 rotate([0,0,45+i])translate([spacing-wt/2-1,-20,8])ballbearing();
                 rotate([0,0,45+i])translate([spacing-wt/2-1,-20,8])lava_disk_rolls();
            }
            rotate([0,0,45+i])translate([spacing-wt/2-1,-20,0])cylinder(d=4.05,h=12.5);
            hull(){
                rotate([0,0,45+i])translate([spacing-wt/2-1,-20,0])cylinder(d=4,h=8);
                rotate([0,0,45+i])translate([spacing-wt/2,-7,0])cylinder(d=4,h=4);
                rotate([0,0,45+i])translate([spacing-wt/2, 7,0])cylinder(d=4,h=4);
            }
            
            // fixture
            //back
            hull(){
                rotate([0,0,45+i])translate([spacing-wt/2-1,-20,0])cylinder(d=4,h=5);
                rotate([0,0,45+i])translate([spacing-wt/2,0,0])cylinder(d=4,h=5);
                rotate([0,0,45+i])translate([spacing-wt/2-30,-50,0])cylinder(d=4,h=5);
            }
            hull(){
                rotate([0,0,45+i])translate([spacing-wt/2-1,-20,0])cylinder(d=4,h=5);
                rotate([0,0,45+i])translate([spacing-wt/2,0,0])cylinder(d=4,h=5);
                rotate([0,0,45+i])translate([spacing-wt/2-15,15,0])cylinder(d=4,h=5);
            }
            //front
            hull(){
                rotate([0,0,45+i])translate([spacing-wt/2-15,10,14.75])cylinder(d=4,h=4);
                rotate([0,0,45+i])translate([spacing-wt/2,-7,14.75])cylinder(d=4,h=4);
                rotate([0,0,45+i])translate([spacing-wt/2,7,14.75])cylinder(d=4,h=4);
            }
            hull(){
                rotate([0,0,45+i])translate([spacing-wt/2-10,-10,14.75])cylinder(d=4,h=4);
                rotate([0,0,45+i])translate([spacing-wt/2,-7,14.75])cylinder(d=4,h=4);
                rotate([0,0,45+i])translate([spacing-wt/2,7,14.75])cylinder(d=4,h=4);
            }
        }union(){
            // corner
            if(!$preview){
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                rotate([0,90,45+i])translate([-ch+9.5,0,spacing-wt-wt-0.01-wt*3])cylinder(d=12,h=wt*4);
            }
        }
    }
}

// motor mount
module lava_disk_motor_mount(spacing=45){
    // corner
    ch = 34;
    wt = 4;
    difference(){
        union(){
            for(i = [0:90:90]){
                echo(i);
                // corner                
                rotate([0,0,45+i])translate([spacing-wt/2-1/2,0,ch/2])minkowski(){
                    cube([wt-1,19-1,ch-1],center=true);
                    rotate([0,90,0])cylinder(d=1,h=1);
                }
                
                hull(){
                    rotate([0,0,45+i])translate([spacing-wt/2,0,ch/2])cube([wt,8.5,ch],center=true);
                    rotate([0,0,45+i])translate([spacing-wt/2+0.33/2,0,ch/2])cube([wt+0.33,7.5,ch],center=true);
                }
                
                // screw
                if($preview){
                    color("silver")rotate([0,90,45+i])translate([-9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                    color("silver")rotate([0,90,45+i])translate([-9.5,0,spacing-wt-wt-0.01])cylinder(d=9.5,h=5);
                }
            }
            hull(){
                for(i = [0:90:90]){
                    rotate([0,0,45+i])translate([spacing-wt,10-1,ch-0.5])rotate([0,90,0])cylinder(d=1,h=4);
                    rotate([0,0,45+i])translate([spacing-wt,-10+1,ch-0.5])rotate([0,90,0])cylinder(d=1,h=4);
                    rotate([0,0,45+i])translate([spacing-wt,10-1,ch-15])rotate([0,90,0])cylinder(d=1,h=4);
                    rotate([0,0,45+i])translate([spacing-wt,-10+1,ch-15])rotate([0,90,0])cylinder(d=1,h=4);
                    rotate([0,0,45+i])translate([spacing-wt-15,0,ch-15])rotate([0,90,0])cylinder(d=1,h=4);
                    rotate([0,0,45+i])translate([spacing-wt-15,0,ch-0.5])rotate([0,90,0])cylinder(d=1,h=4);
                }
            }
        }union(){
            for(i = [0:90:90]){
                // corner
                if(!$preview){
                    rotate([0,90,45+i])translate([-9.5,0,spacing-wt-1])cylinder(d=5,h=wt+2);
                    rotate([0,90,45+i])translate([-9.5,0,spacing-wt-wt-0.01-wt*3])cylinder(d=12,h=wt*4);
                }
            }
            translate([23/2-6,0,0])union(){
                translate([0,28,15.5/2+18.5])cube([23,13.5,15.5],center=true);
                translate([0,28,7/2+18.5])cube([33,13.5,7],center=true);
                translate([-1.5/2,28,15.5/2+18.5])cube([24.5,4,15.5],center=true);
                translate([ 27/2,28,5/2+18.5])cylinder(d=1.3, h=10);
                translate([-27/2,28,5/2+18.5])cylinder(d=1.3, h=10);
            }
            //mirror([0,0,1])translate([0,28,-44])lava_disk_motor();
            //translate([0,28,20])cube([13,15,15],center=true);
        }
    }
}

// motor gear
module lava_disk_servo_shaft(){
    difference(){
        union(){
            cylinder(d=7,h=10);
        }union(){
            cylinder(d=5,h=3);
            cylinder(d=2,h=10);
        }
    }
}

// motor gear
module lava_disk_servo_shaft_bulge(){
    difference(){
        union(){
            cylinder(d=7,h=10);
            intersection(){
                translate([0,0,5])scale([1.08,1.08,4])sphere(d=7);
                cylinder(d=30,h=10);
            }
        }union(){
            cylinder(d=5,h=3);
            cylinder(d=2,h=10);
        }
    }
}

// motor gear
module lava_disk_motor(){
    difference(){
        union(){
            color("lavender")intersection(){
                cylinder(d=20, h=25);
                translate([0,0,30/2])cube([30,15,30],center=true);
            }
            color("lavender")translate([0,0,25])cylinder(d=6, h=1.5);
            color("Thistle")translate([0,0,26.5])cylinder(d=2, h=8);
        }union(){
            
        }
    }
}

// just for preview
module lava_disk(){
    color("white")difference(){
        union(){
            translate([0,0,0])cylinder(d=100,h=2);
            translate([0,0,2])cylinder(d=93,h=5);
            translate([0,0,7])cylinder(d=100,h=2);
        }union(){
            translate([0,0,-1])cylinder(d=75, h=11);
        }
    }
    color("lightblue")union(){
        translate([0,0,2.5])cylinder(d=76,h=1);
        translate([0,0,6.5-1])cylinder(d=76,h=1);
    }
}

// ###################################### //

// arm
module lava_disk_arm(){
    color("silver")difference(){
        union(){
            // bracket
            *hull(){
                translate([0,0,4.05])cylinder(d=4.5,h=3.9);
                translate([5,0,4.05])cylinder(d=6.5,h=3.9);
            }
            *translate([5,0,-4])cylinder(d=6.5,h=20);
            // arms
            al=120;
            hull(){
                translate([5,0,-4.5])cylinder(d=6.5,h=4.5);
                translate([al,0,-4.5])cylinder(d=6,h=4.5);
                translate([106.8,0,-4.5])cylinder(d=12,h=4.5);
            }
            hull(){
                translate([106.8,0,-4.5])cylinder(d=12,h=4.5);
                translate([106.8-10,0,-4.5])cylinder(d=12,h=4.5);
                translate([106.8-10,60,-4.5])cylinder(d=22,h=4.5);
            }
            hull(){
                translate([5,0,11])cylinder(d=6.5,h=9.5);
                translate([al,0,11])cylinder(d=6,h=9.5);
                translate([106.8,0,11])cylinder(d=12,h=9.5);
            }
            translate([al,0,-4])cylinder(d=6,h=20);
            //notch
            hull(){
                translate([110,0,-4.5])cylinder(d=6,h=4.5);
                translate([118,8,-4.5])cylinder(d=3,h=4.5);
            }
            hull(){
                translate([110,0,16])cylinder(d=6,h=4.5);
                translate([118,8,16])cylinder(d=3,h=4.5);
            }
        }union(){
            // pin
            #translate([4.5,0,-5])cylinder(d=1.54, h=30);
            translate([4.9,0,11])cylinder(d=9,h=5.1);
            //motor
            translate([106.8,0,-4.5])cylinder(d=9,h=4.5);
        }
    }
}

// ball bearing disks
module lava_disk_rolls(){
    color("silver")difference(){
        union(){
            translate([0,0,0])cylinder(d=14,h=4.5);
        }union(){
            translate([0,0,-1])cylinder(d=9, h=6.5);
        }
    }
}

// motor gear
module lava_disk_motor_gear(){
    color("darksilver")difference(){
        union(){
            translate([0,0,0])cylinder(d=8.8,h=12);
            translate([0,0,0])cylinder(d=14.5,h=4.5);
        }union(){
            intersection(){
                translate([0,0,5])cylinder(d=5.5, h=20);
                cube([4,20,40],center=true);
            }
            translate([0,0,-1])cylinder(d=2, h=20);
        }
    }
}

