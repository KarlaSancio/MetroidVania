// Já mudei de room
if(mudei)
{
	alpha -= .02;
}
else // Ainda não mudei de room
{
	alpha += .02;
}

// Quando o alpha passar de 1, mudo de room
if(alpha >= 1)
{
	room_goto(destino);
	
	// Controlando a posição do player
	obj_player.x = destino_x;
	obj_player.y = destino_y;
}

// Me destruindo depois de estar transparente e ter mudado de room
if(mudei && alpha <= 0)
{
	instance_destroy();	
}