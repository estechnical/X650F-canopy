
antenna_pair_mount();

module frsky_2_4ghz_antenna()
{
    translate([0,25,0]) cube([10,50,6],true);
}

module antenna_pair()
{
    rotate([0,0,45]) translate([0,5,0]) frsky_2_4ghz_antenna();
    rotate([0,90,-45]) translate([0,5,0]) frsky_2_4ghz_antenna();
}

module cable_clearance()
{
    rotate([0,0,45]) translate([0,25,0]) cube([2,50,10],true);
    rotate([0,0,-45]) translate([0,25,0]) cube([2,50,10],true);
}

module antenna_pair_mount()
{
    rotate([90,0,0])
    difference()
    {
        translate([0,6,0]) cube([23,12,12],true);
        #translate([0,0,2]) cable_clearance();
        #antenna_pair();
    }
    
}