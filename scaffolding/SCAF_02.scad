size = 2;
diameter = 0.5;
n = 5;
vec = [0:size*sqrt(2):(n*size)];
union()
for (dz = vec)
for (dy = vec)
for (dx = vec)
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