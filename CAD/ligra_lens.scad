$fn=100;

// lens planning file
//
// use this file to add your lens model, plan the lens mount
// the generic one should be great already and work on the frontcage.
// The frontcage is a supplementary mount in which the
// lens-front can freely move

if($preview){
    color("HotPink")translate([-70,0,-16])lenscage_fd();
    translate([-70,0,-15])lenscap_fd();
    translate([-70,0,0])lens_fd_28_80();
    color("HotPink")translate([-70,0,90])frontcage_fd_28_80();
    
    color("DeepPink")translate([70,0,-16])lenscage_fd();
    translate([70,0,-15])lenscap_fd();
    translate([70,0,0])lens_fd_70_210();
    color("DeepPink")translate([70,0,180])frontcage_fd_70_210();
}else{
}


// 70-210mm lens
// frontcage
module frontcage_fd_70_210(spacing=45){
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

// lens
module lens_fd_70_210(){
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

// 28-80mm lens
// frontcage
module frontcage_fd_28_80(spacing=45){
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

// lens
module lens_fd_28_80(){
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

// all lenses
// FD-lens back-lenscap
module lenscap_fd(){
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

// generic lens, copy & paste this to add your own lens
module lens_fd(){
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

// generic lenscage for fd lenses
module lenscage_fd(spacing=45){
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

// generic fd lens front support
module lensfrontcage_fd(spacing=45){
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




