size = 1;
diameter = 0.3;
nX = 3;
nY = 3;
nZ = 3;
vecX = [0:size*sqrt(2):(nX*size)];
vecY = [0:size*sqrt(2):(nY*size)];
vecZ = [0:size*sqrt(2):(nZ*size)];
translate([0,0,size])
for (dz = vecZ)
for (dy = vecY)
for (dx = vecX)
    translate([dx,dy,dz])
for (i = [0:45:360]){
    rotate(i,[1,0,0])
    color(c = [1,0,0])
    cylinder(h = size, d = diameter);
    
    rotate(i,[0,1,0])
    color(c = [0,1,0])
    cylinder(h = size, d = diameter);
    
    rotate(90,[0,1,0])
    rotate(i,[1,0,0])
    color(c = [0,0,1])
    cylinder(h = size, d = diameter);
}