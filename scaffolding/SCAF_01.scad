// global variables
size_x = 05;
size_y = 05;
size_z = 2.2;
$fn = 20;

sX = -size_x/2;
fX =  size_x/2;
sY = -size_y/2;
fY =  size_y/2;
sZ = 0;
fZ = size_z;

diameter_x = 0.2;
diameter_y = 0.2;
diameter_z = 0.2;

x_raster = 3 * diameter_x;
y_raster = 3 * diameter_y;
z_raster = 1 * max(diameter_x, diameter_y, diameter_z);

for (dz = [sZ:(2*z_raster):fZ])
translate([0,0,dz]){
// Y-oriented, X-translated nodes
    for (dx = [sX:x_raster:fX]){
        translate([dx,-diameter_y/2,0])
        rotate(90, [1,0,0])
        color([1,0,0])
        cylinder(h = size_y, d = diameter_x, center=true);
        }
    // X-oriented, Y-translated nodes
    translate([0,0, z_raster])    
    for (dy = [sY:y_raster:fY]){
        translate([-diameter_x/2,dy,0])
        rotate(90,[0,1,0])
        color([0,1,0])
        cylinder(h = size_x, d = diameter_y, center = true);
    }
}
for (dx = [sX:x_raster:fX])
for (dy = [sY:y_raster:fY])
{
    translate([dx,dy,0])
    color([0,0,1])
    cylinder(h = size_z, d = diameter_z);
}

for (dx = [sX:x_raster:fX])
for (dy = [sY:y_raster:fY])
for (dz = [sZ:z_raster:fZ]) translate([dx, dy, dz]) sphere(0.12);