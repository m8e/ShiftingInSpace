/// @desc
x = x + h_speed;
y = y + v_speed;

v_speed += player.grav;

#region Collisions
//Horizontal Collision
if(place_meeting(x+h_speed,y,wall)) {
	
	while (!place_meeting(x+sign(h_speed),y,wall)) {
		
		x = x + sign(h_speed);
		
	}
	h_speed = 0;
	
}

//Vertical Collision
if(place_meeting(x,y+v_speed,wall)) {
	//sign returns if a varible is positive(1) or negative(-1)
	while (!place_meeting(x,y+sign(v_speed),wall)) {
		
		y = y + sign(v_speed);
			
	}
	v_speed = 0;
	
}

//Door Collision
if(place_meeting(x+h_speed,y,door)) {
	
	while (!place_meeting(x+sign(h_speed),y,door)) {
		
		x = x + sign(h_speed);
		
	}
h_speed = 0;
	
}

//Smashable Wall Collision
if(place_meeting(x+h_speed,y,smashableWall)) {
	//sign returns if a varible is positive(1) or negative(-1)
	while (!place_meeting(x+sign(h_speed),y,smashableWall)) {
		
		x = x + sign(h_speed);
			
	}
	h_speed = 0;
	
}

if(place_meeting(x+h_speed,y,crate)) {
	
	while (!place_meeting(x+sign(h_speed),y,crate)) {
		
		x = x + sign(h_speed);
		
	}
	h_speed = 0;
	
}

//Vertical Collision
if(place_meeting(x,y+v_speed,crate)) {
	//sign returns if a varible is positive(1) or negative(-1)
	while (!place_meeting(x,y+sign(v_speed),crate)) {
		
		y = y + sign(v_speed);
			
	}
	v_speed = 0;
	
}
#endregion

turnTimer = turnTimer - 1;

if (turnTimer < 0) {
	turnTimer = turnTimerReset;
	image_xscale = sign(image_xscale) * -1;
}

var CanSee = collision_line(x, y, player.x, player.y, wall, false , true);  
var IsInsideRadius = distance_to_point(player.x,player.y) < radius;  

if(CanSee && IsInsideRadius){  
    show_message("DEBUG");
}  