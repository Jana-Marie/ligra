use <ligra_flashlight.scad>
use <ligra_par_spot.scad>
use <ligra_tripod.scad>
use <ligra_lens.scad>
use <ligra_stage.scad>
use <ligra_lava_disk.scad>
use <ligra_frame.scad>
use <ligra_misc.scad>

// nya! Welcome to the 3D planning & design file of ligra
// use this file to plan your porjector, see the two pre-planned-
// projectors (28_80_300 & 70_210_400) below. Use all the files in this
// directory to design and adapt custom parts. You can work on the parts
// in their respective files and just use them here afterwards.
// That should keep everything easy to understand and fast to work on.
// Please plan your files (F5) in the $preview clause and add them to the
// 'else' clause for rendering (F6).
// Enjoy~
// 
// - Jana

if($preview){
    // Canon FD 28-80mm base projector, PAR Spot, rot-stencil stage, 300mm frame
    translate([-70,0,60])rotate([80,0,0])translate([0,0,-150])projector_28_80_300();
    
    // Canon FD 70-210mm base projector, PAR Spot, rot-stencil stage, 400mm frame
    translate([ 70,0,60])rotate([80,0,0])translate([0,0,-150])projector_70_210_400();
} else{
}

// Canon FD 28-80mm base projector, PAR Spot, rot-stencil stage, 300mm frame
module projector_28_80_300(){
    $fn=60;
    offx=170;
    
    // frame
    color("silver")frame(300,45);
    
    // lens
    color("Khaki")translate([0,0,offx])lenscage_fd(45);
    color("Khaki")translate([0,0,offx+98+6])frontcage_fd_28_80(45);
    
    translate([0,0,offx+1])lenscap_fd();
    translate([0,0,offx+1+13.6])lens_fd_28_80();
    
    // tripod mount
    color("Tomato")translate([0,0,160])tripod_plate(45);

    // stencil stage
    translate([0,0,offx-40])stage_motor_rot_assembly(45);
    
    // PAR Spot
    translate([0,0,120])rotate([180,0,0])par_spot_cage(45);
    
    // PCB
    color("DarkslateGray")translate([0,0,302.6])rotate([180,0,0])front_pcb();
    color("DarkslateGray")translate([0,0,-1])rotate([180,0,0])back_pcb();
    
    
    for(i=[-1:2:1],j=[-1:2:1]){
        // foot
        color("DarkTurquoise")translate([i*38.6,j*38.6,-1.6])rotate([180,0,0])foot();
        // cap
        color("Red")translate([i*38.6,j*38.6,-2])rotate([0,0,45])cap();
        color("Red")translate([i*38.6,j*38.6,302])rotate([180,0,45])cap();
    }
    
    // Obsolete, flashlight light source
    *translate([0,0,20])flashlight();
    *color("Olive")translate([0,0,166])flashlight_cage(45);
    *color("Olive")translate([0,0,100])flashlight_counter();
}

// Canon FD 70-210mm base projector, PAR Spot, rot-stencil stage, 400mm frame
module projector_70_210_400(){
    $fn=60;
    offx=185;
    // frame
    color("silver")frame(400,45);
    
    // lens
    color("Khaki")translate([0,0,offx])lenscage_fd(45);
    color("Khaki")translate([0,0,offx+185+6])frontcage_fd_70_210(45);

    translate([0,0,offx+1])lenscap_fd();
    translate([0,0,offx+1+13.6])lens_fd_70_210();
    
    // tripod mount
    color("Tomato")translate([0,0,260])tripod_plate(45);
    color("Tomato")translate([0,0,80])tripod_plate(45);
    
    // stencil stage
    translate([0,0,offx-40])stage_motor_rot_assembly();
    
    // PAR Spot
    translate([0,0,120])rotate([180,0,0])par_spot_cage(45);
    
    // PCB
    color("DarkslateGray")translate([0,0,402.6])rotate([180,0,0])front_pcb();
    color("DarkslateGray")translate([0,0,0])rotate([180,0,0])back_pcb();
    
    for(i=[-1:2:1],j=[-1:2:1]){
        // foot
        color("DarkTurquoise")translate([i*38.6,j*38.6,-1.6])rotate([180,0,0])foot();
        // cap
        color("Red")translate([i*38.6,j*38.6,-2])rotate([0,0,45])cap();
        color("Red")translate([i*38.6,j*38.6,402])rotate([180,0,45])cap();
    }
    
    // Obsolete, flashlight light source
    *translate([0,0,20])flashlight();
    *color("Olive")translate([0,0,166])flashlight_cage(45);
    *color("Olive")translate([0,0,100])flashlight_counter();
}

