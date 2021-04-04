$fa = 1;
$fs = 0.1;

//zip tie ring
module zip_tie_slot(x = 0) {
    difference() {
        translate([x, 0, 0])
            rotate([90, 0, 90])
                cylinder(h = 4, r = 12, center = true);
        
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
                    cube([20, 22, 10], center = true);  

                rotate([90, 0, 90])    
                    cylinder(h = 20, r = 11, center = true);
            }

            intersection() {
                translate([0, 0, 6])
                    cube([20, 18, 12], center = true);
          
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
        translate([-6, 0, 13])
            cube([8, 5.5, 2.75], center = true);

        translate([-6, 1.25, 13])
            cube([10, 2, 2], center = true);

        translate([-6, -1.25, 13])
            cube([10, 2, 2], center = true);
    }
}

module rx_ant_guide_tube() {
    difference() {
        rotate([90, 0, 90])
            cylinder(h = 15, r = 2, center = true);

        rotate([90, 0, 90])
            cylinder(h = 17, r = 1, center = true);
    }
}

module rx_ant_guide_out() {
    translate([8, 8, 13])
        rotate([0, 0, 45])
            rx_ant_guide_tube();

    translate([8, -8, 13])
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