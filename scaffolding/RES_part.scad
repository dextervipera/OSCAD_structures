additional_dst = 3;
$fn = 20;

module tube (dout, din, height){
    difference(){
        cylinder(h = height, r = dout/2);
        translate([0,0,-0.5])
        cylinder(h = additional_dst+1, r = 2);
        }
}
translate([0,0,-1.5])
cube([3,13.7,3], center=true);
translate([0, -17.5/2, -additional_dst]) tube(6.5,3,3,additional_dst);
translate([0,  17.5/2, -additional_dst]) tube(6.5,3,3,additional_dst);