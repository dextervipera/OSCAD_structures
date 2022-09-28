// global variables
size_x = 25;
size_y = 25;
size_z = 4;
$fn = 20;

sX = -size_x/2;
fX =  size_x/2;
sY = -size_y/2;
fY =  size_y/2;
sZ = 0;
fZ = size_z;

diameter_x = 0.3;
diameter_y = 0.3;
diameter_z = 0.3;

x_raster = 2 * diameter_x;
y_raster = 2 * diameter_y;
translate([0,0,3])
union(){    
    cylinder(h=5, r = 12.5);
    for (dx = [sX:(x_raster*2):fX])
    for (dy = [sY:(y_raster*2):fY])
    {
        translate([dx,dy,-3])
        color([1,1,1])
        cylinder(h = 3, d = diameter_z*0.7);
    };
};
