if(!dir_mode)
{
	// Tremendo
	view_xport[0] =  random_range(-shake, shake);
	view_yport[0] = random_range(-shake, shake);

	shake *= .95;

	//Destruindo
	if(shake <= .2)
	{
		instance_destroy();	
	}
}
else
{
	if(!voltar)
	{
		// Descobrir para onde mover
		var _x = lengthdir_x(shake, dir); // valor horizontal
		var _y = lengthdir_y(shake, dir); // valor vertical
	
		// Movendo as viewports
		view_xport[0] = _x;
		view_yport[0] = _y;
		
		voltar = true;
	}
	else
	{
		view_xport[0] = lerp(view_xport[0], 0, .3); // Voltando de forma suave
		view_yport[0] = lerp(view_yport[0], 0, .3);
		
		var _xport = abs(view_xport[0]);
		var _yport = abs(view_yport[0]);
		
		if(_xport <= 1 && _yport <= 1)
		{
			instance_destroy();	
		}
	}
}