module frame() {
    difference() {
        union() {
            // four arms
            for (i = [-1, 1]) {
                for (j = [-1, 1]) {
                    translate([0, -(arm_bridge_size / 2) * i, 0])
                    rotate([0, 0, ((i + 1) * 90) + j * arm_sweep_angle / 2])
                    union() {
                        translate([-arm_width / 2, 0, 0]) cube([arm_width, arm_length, frame_thickness]);
                        translate([0, arm_length, 0]) cylinder(h=frame_thickness, r=(motor_pad_diameter / 2));
                    }

                }
            }

            // bottom plate
            translate([-body_x/2, -body_y/2, 0])
            cube([body_x, body_y, frame_thickness]);

            // spars
            if (spars) {
                for (i = [-1, 1]) {
                    adj = cos(90 - (arm_sweep_angle / 2)) * arm_length;
                    opo = sin(90 - (arm_sweep_angle / 2)) * arm_length;

                    // left/right
                    translate([
                        (-spar_width / 2) + i * (adj + (motor_pad_diameter / 2) - (spar_width / 2) - spar_inset),
                        - (2 * opo + arm_bridge_size) / 2,
                        0
                    ])
                    cube([spar_width, 2 * opo + arm_bridge_size, spar_height]);

                    // front/back
                    translate([
                        -adj,
                        (-spar_width / 2) + i * ((arm_bridge_size / 2) + opo + (motor_pad_diameter / 2) - (spar_width / 2) - spar_inset),
                        0]
                    )
                    cube([2 * adj, spar_width, spar_height]);
                }
            }
        }

        // weight saving recess and motor holes
        for (i = [-1, 1]) {
            for (j = [-1, 1]) {
                translate([0, -(arm_bridge_size / 2) * i, 0])
                rotate([0, 0, ((i + 1) * 90) + j * arm_sweep_angle / 2])
                union() {
                    translate([-arm_gutter_width / 2, 0, frame_recess]) cube([arm_gutter_width, arm_length, frame_thickness]);
                    translate([0, arm_length, frame_recess]) cylinder(h=frame_thickness, r=(motor_diameter / 2));


                    // motor mount and shaft holes
                    translate([0, arm_length, 0])
                    rotate([0,0,45])
                    union() {
                        translate([motor_mount_dia / 2, 0, 0]) cylinder(h=frame_thickness, r=motor_mount_hole_d / 2);
                        translate([-motor_mount_dia / 2, 0, 0]) cylinder(h=frame_thickness, r=motor_mount_hole_d / 2);
                        translate([0, motor_mount_dia / 2, 0]) cylinder(h=frame_thickness, r=motor_mount_hole_d / 2);
                        translate([0, -motor_mount_dia / 2, 0]) cylinder(h=frame_thickness, r=motor_mount_hole_d / 2);

                        cylinder(h=frame_thickness, r=motor_shaft_hole_d / 2);
                    }
                }
            }
        }

        // stack area
        translate([-(body_x - body_border)/2, -(body_y - body_border)/2, frame_recess])
        cube([body_x - body_border, body_y - body_border, frame_thickness]);

        // stack holes
        for (i = [-1, 1]) {
            for (j = [-1, 1]) {
                translate([i * (stack_mount_xy/2), j * (stack_mount_xy/2), 0])
                cylinder(h=frame_thickness, r=stack_mount_dia / 2);
            }
        }

        // stack bolt head recess
        for (i = [-1, 1]) {
            for (j = [-1, 1]) {
                translate([i * (stack_mount_xy/2), j * (stack_mount_xy/2), 0])
                cylinder(h=stack_bolt_head_h, r=stack_bolt_head_dia / 2);
            }
        }
    }
};
