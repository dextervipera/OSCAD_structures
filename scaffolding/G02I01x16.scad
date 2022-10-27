// global variables
size_x = 11.5;
size_y = 11.5;
size_z = 10.5;
$fn = 12;


support_height = 2;
support_size = 0.6;

sX = -size_x/2;
fX =  size_x/2;
sY = -size_y/2;
fY =  size_y/2;
sZ = 0;
fZ = size_z;

separator_height = 0.2;

diameter_a = 0.5;
diameter_b = 0.5;
diameter_l = size_x;

column_a = .5;
column_b = .5;

x_raster = 2.5 * diameter_a;
y_raster = 2.5 * diameter_a;
z_raster = 1;

module node(size_x, size_y, size_z){
    cube([size_x, size_y, size_z], center=false);
};

module layer(raster, size_x, size_y, rot, _color = [0,0,1]){
    sX = -size_x/2;
    fX =  size_x/2;
    rotate([0,0,rot])
    for (dx = [sX:x_raster:fX]){
        translate([dx,-size_y/2,0])
        color(_color)
        node(diameter_a, diameter_l, diameter_b);
        };
};

module column(size_x, size_y, size_z, color=[0,1,0]){
color([0,1,0])        
cube([size_x,size_y,size_z], center=false);
}

module columns(raster, size_x, size_y){
    sX = -size_x/2;
    fX =  size_x/2;
    sY = -size_y/2;
    fY =  size_y/2;
    for (dx = [sX:x_raster:fX])
    for (dy = [sY:y_raster:fY])
       translate([dx, dy, 0])
       column(column_a, column_b, size_z);
}

module supports(raster, size_x, size_y){
    sX = -size_x/2;
    fX =  size_x/2;
    sY = -size_y/2;
    fY =  size_y/2;
    for (dx = [sX:x_raster:fX])
    for (dy = [sY:y_raster:fY])
       //translate([column_a*support_size/5, column_b*support_size/5, 0]) 
       translate([dx, dy, -support_height])
       color([1,0,0])
       cube([column_a*support_size, column_b*support_size, support_height]);
}

translate([4*-11.5/2, -11.5/2, 0])
scale([1.37, 1.37, 1])
union()
for (dx = [0:1:15])
    translate([dx/4*12.5, dx % 4 * 12.5, 0])
union(){    
for (dz = [0:1:10]) translate([0,0,dz*z_raster]) layer(1, size_x, size_y, dz % 2 * 90);
columns(1, size_x, size_y);
supports(1, size_x, size_y);



}