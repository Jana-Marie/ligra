$fn=100;

// frame & extrusion file
//
// the extrusions and frame are generated in here

frame(100);

// Base frame
module frame(l=10,spacing=45){
    b = spacing/sin(45);
    echo("a = ", spacing);
    echo("b = ", b);
    echo("h = " , b*sin(spacing));
    
    for(i = [0:90:270]){
        rotate([0,0,45+i])translate([spacing+10,0,0])profile(l);
    }
}

// 20x20mm Aluminium extrusion generator
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