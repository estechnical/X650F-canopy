module Nut(width,thickness){
    translate([-width/2,-width/2,0]) cube([width,width,thickness]);
}

module NutSideAccess(nut_width,y,nut_thickness){
    // to allow depth for the hex nut in the slot, we multiply the width of the nut by the ratio here. Half of this is used to account for the depth in the hole. This is needed because hex nuts will sit on a point in the slot with two flat faces against the sides
    ratio = 1.15;
    depth = nut_width * ratio / 2;
    translate([-nut_width/2,-depth,0]) cube([nut_width,y+depth,nut_thickness]);
}

module Bolt(shaft_dia,head_dia,length,head_depth){
    cylinder(d=shaft_dia,h=length);
    translate([0,0,length]) cylinder(d=head_dia,h=head_depth);
}

module angle_bolt_boss(face_angle,bolt_shaft_dia,bolt_head_dia,bolt_length,head_depth,nut_width,nut_thickness){
    difference(){
        cube([15,20,15]);
        rotate([face_angle,0,0]) cube([30,30,30]);
        translate([7.5,10,8]) rotate([face_angle,0,0]) union(){
            Nut(nut_width,nut_thickness);
            translate([0,0,-5]) Bolt(bolt_shaft_dia,bolt_head_dia,bolt_length,head_depth);
            NutSideAccess(nut_width,20,nut_thickness);
        }
    }
}

angle_bolt_boss(face_angle=65,bolt_shaft_dia=3.6,bolt_head_dia=6.5,bolt_length=20,head_depth=3.5,nut_width=6.6,nut_thickness=2.5);