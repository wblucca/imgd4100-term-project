/// @description Take damage from sword and die

// Take damage
health -= 1.0;
instance_destroy(other);

// And die
if (health <= 0) {
	room_restart();
}
