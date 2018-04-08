/*
This cover fits 4 mounting holes on the X650F-V4 frame

and is overall 138*144 mm with radiused corners
*/


use <basic_fixings.scad>
use <frsky.scad>
/*
body_base_layer();
translate([0,0,20]) body_mid_layer();
translate([0,0,30]) body_top_layer();
*/
top();

//#electronics_model();
//6#deck_model();

module deck_model()
{
    translate([-65,-40,15])
    {        
        translate([0,0,1]) cube([130,65,2]);
        translate([(130-50)/2,65,1]) cube([50,47,2]);
    }
}

module electronics_model()
{
    // px4 approximation, don't forget cable clearance at the rear and top
    translate([0,0,9]) cube([50,82,18], true);
    
    // frsky radio RX
    translate([44,0,7.5]) cube([30,50,15], true);
    
}

module gps_mast_mounting()
{
    // four bolt holes, on an X pattern
    rotate([0,0,45])
    {
        translate([15,0,-8]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=2);
        translate([-15,0,-8]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=2);
        translate([0,15,-8]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=2);
        translate([0,-15,-8]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=2);
    }
    // cable entry
    translate([-15,0,-6]) cylinder(d=6,h=6);
}

module safety_button_mounting()
{
    // rectangular PCB with button
    // this is a stupid board, with two mounting holes on one end
    translate([0,0,-8]) cylinder(d=10,h=10);
    translate([17,8.75,-10]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=2);
    translate([17,-8.75,-10]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=2);
}

module mountings_model()
{
    // this module describes the mountings on the quad frame, the bolts are delibrately specified
    // with "tall heads" to create the clearance above the fastening plane
    x1 = 20;
    y1 = 64;
    translate([x1,y1,-10]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=100);
    translate([-x1,y1,-10]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=100);
    
    x2 = 60;
    y2 = -36;
    translate([x2,y2,-10]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=100);
    translate([-x2,y2,-10]) Bolt(shaft_dia=3.3,head_dia=8,length=10,head_depth=100);
}
module mountings_model_relief()
{
    // essentially the same model as above but with sizes tweaked to make clearance for wall thickness
    x1 = 20;
    y1 = 64;
    translate([x1,y1,-5]) Bolt(shaft_dia=3.3,head_dia=10,length=5,head_depth=100);
    translate([-x1,y1,-5]) Bolt(shaft_dia=3.3,head_dia=10,length=5,head_depth=100);
    
    x2 = 60;
    y2 = -36;
    translate([x2,y2,-5]) Bolt(shaft_dia=3.3,head_dia=10,length=5,head_depth=100);
    translate([-x2,y2,-5]) Bolt(shaft_dia=3.3,head_dia=10,length=5,head_depth=100);
}

module body_base_layer()
{
    width=135;
    length=145;
    frontX = 30; // half the width
    frontY = 78; // distance from centre line
    translate([frontX,frontY,1]) cube([2,2,2],true);
    translate([-frontX,frontY,1]) cube([2,2,2],true);

    midX = width/2; // half the width
    midY = 30; // distance from centre line
    translate([midX,midY,1]) cube([2,2,2],true);
    translate([-midX,midY,1]) cube([2,2,2],true);

    midX2 = width/2; // half the width
    midY2 = -50; // distance from centre line
    translate([midX2,midY2,1]) cube([2,2,2],true);
    translate([-midX2,midY2,1]) cube([2,2,2],true);

    rearX = 30; // half the width
    rearY = -68; // distance from centre line
    translate([rearX,rearY,1]) cube([2,2,2],true);
    translate([-rearX,rearY,1]) cube([2,2,2],true);

}

module body_mid_layer()
{
    width=135;
    frontX = 25; // half the width
    frontY = 67; // distance from centre line
    translate([frontX,frontY,1]) cube([2,2,2],true);
    translate([-frontX,frontY,1]) cube([2,2,2],true);

    midX = width/2 - 5; // half the width
    midY = 20; // distance from centre line
    translate([midX,midY,1]) cube([2,2,2],true);
    translate([-midX,midY,1]) cube([2,2,2],true);

    midX2 = width/2 -5; // half the width
    midY2 = -38; // distance from centre line
    translate([midX2,midY2,1]) cube([2,2,2],true);
    translate([-midX2,midY2,1]) cube([2,2,2],true);

    rearX = 25; // half the width
    rearY = -65; // distance from centre line
    translate([rearX,rearY,1]) cube([2,2,2],true);
    translate([-rearX,rearY,1]) cube([2,2,2],true);

}

module body_top_layer()
{
    x2 = 18;
    y2 = 35;
    translate([x2,y2,0]) cube([2,2,2],true);
    translate([-x2,y2,0]) cube([2,2,2],true);

    x3 = 35;
    y3 = 0;
    translate([x3,y3,0]) cube([2,2,2],true);
    translate([-x3,y3,0]) cube([2,2,2],true);

    x4 = 20;
    y4 = -40;
    translate([x4,y4,0]) cube([2,2,2],true);
    translate([-x4,y4,0]) cube([2,2,2],true);
}

module body_relief()
{
    // this needs to also model the wall thickness of the recessed mounting features
    difference()
    {
        scale([0.99,0.99,0.99])
        {
            hull()
            {
                #body_base_layer();
                #translate([0,0,20 + 17]) body_mid_layer();
                #translate([0,0,45 + 17]) body_top_layer();
            }
        }
        // some clearance model for the walls of recesses go here
        translate([0,0,15 + 17]) mountings_model_relief();
    }
}

module body()
{
    hull()
    {
        #body_base_layer();
        #translate([0,0,20 + 17]) body_mid_layer();
        #translate([0,0,45 + 17]) body_top_layer();
    }
}

module top()
{
    difference()
    {
        body();
        body_relief();

        #translate([0,0,20 + 17]) mountings_model();
        #translate([0,20,46 + 17]) gps_mast_mounting();
        #translate([0,-10,46 + 17]) safety_button_mounting();
        
        #translate([0,-30,40 + 17]) antenna_mounting();

    }
}

module antenna_mounting()
{
    // antenna installation hole, to allow feeding through from below
    cylinder(r=6,h=10);
    translate([-10,0,8]) rotate([0,180,0]) Bolt(shaft_dia=3.3,head_dia=8,length=6,head_depth=2);
    translate([10,0,8]) rotate([0,180,0]) Bolt(shaft_dia=3.3,head_dia=8,length=6,head_depth=2);
}