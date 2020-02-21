//
// ktHOLDER2
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;

in = 26/2 + 2;
out = in+panel_thick;
sh = 5;
rr = 50;
hh = 50;
ss = atan2(hh,rr);
ss2 = ss/2;
rr2 = (rr-3)*cos(ss2);
hh2 = (rr-3)*sin(ss2);
ss3 = ss/2;
rr3 = (rr+out*2+3)*cos(ss3);
hh3 = (rr+out*2+3)*sin(ss3);



translate([-out*2-sh, 0, 0]) L();
mirror([1, 0, 0]) translate([-out*2-sh, 0, 0]) L();

module L()
{
    difference()
    {
        union()
        {
            translate([-rr, 0, 0]) rotate([90, 0, 0])
            rotate_extrude(angle=ss, convexity=10, $fn=300)
            translate([out+rr, 0])
            circle(out);
            
            translate([-rr+rr2, 0, hh2]) rotate([90, -ss2, 0])
            {
                translate([4/2, 0, 0]) cube([4, 8, 8], center=true);
                cylinder(h=8, r=8/2, center=true, $fn=50);
            }
            
            translate([-rr+rr3, 0, hh3]) rotate([90, -ss3, 0])
            {
                translate([-4/2, 0, 0]) cube([4, 8, 8], center=true);
                cylinder(h=8, r=8/2, center=true, $fn=50);
            }
        }
        
        //dell
        translate([-rr, 0, 0]) rotate([90, 0, 0])
        rotate_extrude(angle=ss+gap1, convexity=10, $fn=300)
        translate([out+rr, 0])
        circle(in);
        
        translate([-rr+rr2, 0, hh2]) rotate([90, -ss2, 0])
        {
            translate([0, 0, -5])cylinder(10, 1.6, 1.6, $fn=30);
            translate([0, 0, 1])cylinder(5, 6.5/2+0.1, 6.5/2+0.1, $fn=6);
            translate([0, 0, -5-1])cylinder(5, 6.5/2+0.1, 6.5/2+0.1, $fn=6);
        }
        translate([-rr+rr3, 0, hh3]) rotate([90, -ss3, 0])
        {
            translate([0, 0, -5])cylinder(10, 1.6, 1.6, $fn=30);
            translate([0, 0, 1])cylinder(5, 6.5/2+0.1, 6.5/2+0.1, $fn=6);
            translate([0, 0, -5-1])cylinder(5, 6.5/2+0.1, 6.5/2+0.1, $fn=6);
        }
        
        //half
        translate([-50, 0, -50]) cube([200, 50, 200]);
    }
}
