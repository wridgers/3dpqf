////////////////////////////////////////////////////////////////////////////////

$fn=50; // quality. higher = better/slower

////////////////////////////////////////////////////////////////////////////////

motor_pad_diameter = 23;
motor_diameter = 20;

motor_mount_dia = 12; // dia. of circle which motor mount holes lie on
motor_mount_hole_d = 2 + 0.25; // M2 + tol.
motor_shaft_hole_d = 5 + 0.25; // M5 + tol.

arm_length = 175 / 2;
arm_width = 15;
arm_gutter_width = 8;

// angle between front/rear pair of arms
arm_sweep_angle = 90;

// size of bidge between front and rear arms
arm_bridge_size = 0;

frame_thickness = 6;
frame_recess = 3;

// support spars
spars = true;
spar_width = 6;
spar_height = frame_thickness - 1;
spar_inset = 3; // inset from outer edge of motor pad. 0 for totally flush.

body_border = 7;
body_x = 40;
body_y = 40;

stack_mount_xy = 20;
stack_mount_dia = 2 + 0.25; // M2 + tol.

stack_bolt_head_dia = 4;
stack_bolt_head_h = 1;

////////////////////////////////////////////////////////////////////////////////

include <../frame.scad>;
frame();
