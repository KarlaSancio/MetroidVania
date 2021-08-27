var chao = place_meeting(x, y + 1, obj_block);

if(!chao)
{
	velv += GRAVIDADE * massa * global.vel_mult;	
}

switch(estado)
{
	#region parado
	case "parado":
	{
		timer_estado++;
		
		// Arrumando a sprite
		if(sprite_index != spr_slime_idle)
		{
			sprite_index =  spr_slime_idle;
			image_index = 0;
		}
		
		// Fazendo a image_index ir só até o 4
		image_index %= 4;
		
		// Saindo do estado
		if(random(timer_estado) > 450)
		{
			estado = choose("parado", "movendo");	
			timer_estado = 0;
		}
		break;
	}
	#endregion parado
	
	case "movendo":
	{
		if(sprite_index != spr_slime_idle)
		{
			sprite_index = spr_slime_idle;
			image_index = 0;
		}
		
		//Garantindo que o sprite nao tenha as animações parado
		image_index = clamp(image_index, 3, 8)
		
		if(velh == 0)
		{
			velh = choose(-1, 1);	
		}
		
		if(random(timer_estado) > 200)
		{
			estado = choose("parado", "parado", "movendo");
		}
		
		break;
	}
}