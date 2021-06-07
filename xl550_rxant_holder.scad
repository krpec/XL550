//author: Roman 'krpec' Dittrich (dittrich.r@gmail.com)
//XL550 antenna holder, version 1.3

$fa = 1;
$fs = 0.1;

//zip tie ring
module zip_tie_slot(x = 0) {
    difference() {
        translate([x, 0, 0])
            rotate([90, 0, 90])
                cylinder(h = 4, r = 12.25, center = true);
        
        translate([x, 0, 0])
            rotate([90, 0, 90])
                cylinder(h = 5, r = 10.75, center = true);
    }
}

//holder base
module rx_holder_base() {
    difference() {
        union() {
            intersection() {
                translate([0, 0, 5])
                    cube([20, 22, 15], center = true);  

                rotate([90, 0, 90])    
                    cylinder(h = 20, r = 12, center = true);
            }

            intersection() {
                translate([0, 0, 6])
                    cube([20, 18, 14], center = true);
          
                rotate([90, 0, 90])
                    cylinder(h = 20, r = 14, center = true);
            }
        }
        
        zip_tie_slot(-5);
        zip_tie_slot(5);
    }
}


//rx ant 1st part
module rx_ant_guide_in() {
    difference(){
        intersection() {
            translate([-6, 0, 15])
                cube([8, 11, 5], center = true);
            
            translate([-6, 0, 13.5])
                rotate([90, 0, 90])
                    cylinder(h = 8, r = 6, center = true);
        }

        translate([-6, 2.5, 14.5])
            //cube([10, 2, 2], center = true);
            rotate([90, 0, 90])
                cylinder(h = 10, r = 2, center = true);

        translate([-6, -2.5, 14.5])
            //cube([10, 2, 2], center = true);
            rotate([90, 0, 90])
                cylinder(h = 10, r = 2, center = true);
    }
}

module rx_ant_guide_tube() {
    difference() {
        rotate([90, 0, 90])
            cylinder(h = 15, r = 3, center = true);

        rotate([90, 0, 90])
            cylinder(h = 17, r = 2, center = true);
    }
}

module rx_ant_guide_out() {
    translate([8, 8, 14.5])
        rotate([0, 0, 45])
            rx_ant_guide_tube();

    translate([8, -8, 14.5])
        rotate([0, 0, -45])
            rx_ant_guide_tube();
}

//main
difference() {
    union() {
        rx_holder_base();
        rx_ant_guide_in();
        rx_ant_guide_out();
    }
    
    //tail tube
    rotate([90, 0, 90])
        cylinder(h = 100, r = 10, center = true);
}
