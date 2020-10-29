// Iniciando Variaveis
var right, left, jump, attack, dash;
var chao = place_meeting(x, y + 1, obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("K"));
attack = keyboard_check_pressed(ord("J"));
dash = keyboard_check_pressed(ord("L"));

if(ataque_buff > 0) ataque_buff -= 1;


// Aplicando Gravidade
if(!chao)
{
	if(velv < max_velv * 2)
	{
		velv += GRAVIDADE * massa * global.vel_mult;
	}
}

// Código de Movimentação
velh = (right - left) * max_velh;


// Iniciando a state machine
switch(estado)
{
	#region parado
	case "parado":
		// Comportamento do estado
		sprite_index = spr_player_parado1;
		
		// Condição de troca de estado
		// Movendo
		if(right || left)
		{
			estado = "movendo";		
		}
		
		else if(jump || velv != 0)
		{
			
			estado = "pulando";
			velv = (-max_velv * jump);
			image_index = 0;
		}
		else if(attack)
		{
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		else if(dash)
		{
			estado = "dash";
			image_index = 0;
		}
		
		break;
	#endregion
	
	#region movendo
	case "movendo":
		// Comportamento do estado de movimento
		sprite_index = spr_player_run;
		
		
		// Condição de troca de estado
		// Parado
		if(abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}
		else if(jump || velv != 0)
		{
			estado = "pulando";
			velv = (-max_velv * jump);
			image_index = 0;
		}
		else if(attack)
		{
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		else if(dash)
		{
			estado = "dash";
			image_index = 0;
		}
		
		break;
	#endregion;
	
	#region pulando
	case "pulando":
		// Caindo
		if(velv > 0)
		{
			sprite_index = spr_player_fall;	
		}
		else // Pulando
		{
			sprite_index = spr_player_pulo;
			// Garantindo que a animação não se repita
			if(image_index >= image_number - 1)
			{
				image_index = image_number - 1;
			}
		}
		// Condição de troca de estado
		if(chao) // Se eu toquei no chão logo depois de cair
		{
			estado = "parado"	
			velh = 0;
		}
		
		break;
	#endregion;
	
	#region ataque
	case "ataque":
		velh = 0;
		
		if(combo == 0)
		{
			sprite_index = spr_player_ataque1;
		}
		else if(combo == 1)
		{
			sprite_index = spr_player_ataque2;	
		}
		else if(combo == 2)
		{
			sprite_index = spr_player_ataque3;	
		}
		
		// Criando o objeto de dano
		if(image_index >= 2 && dano == noone && posso)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/3, layer, obj_dano);	
			dano.dano = ataque * ataque_mult;
			dano.pai = id;
			posso = false;
		}
		
		// Configurando com o buff
		if(attack && combo < 2)
		{
			ataque_buff = room_speed;	
		}
		
		if(ataque_buff && combo < 2 && image_index >= image_number - 1)
		{
			combo++;
			image_index = 0;
			posso = true;
			ataque_mult += .7;
			if(dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
			
			// Zerando o buffer
			ataque_buff = 0;
			
		}
		
		if(image_index > image_number - 1)
		{
			estado = "parado";
			velh = 0;
			combo = 0;
			posso = true;
			ataque_mult = 1;
			if(dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		if(dash)
		{
			estado = "dash";
			image_index = 0;
			combo = 0;
			if(dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		if(velv != 0)
		{
			estado = "pulando";
			image_index = 0;
		}
		
		break;
	#endregion;
	
	#region dash
	case "dash":
	
		sprite_index = spr_player_dash;
		
		// Velocidade
		velh = image_xscale * dash_vel;
		
		// Saindo do estado
		if(image_index >= image_number - 1)
		{
			estado = "parado";	
		}
		break;
		
	#endregion;
	
	case "hit":
		
		if(sprite_index != spr_player_hit)
		{
			sprite_index = spr_player_hit;
			image_index = 0;
			
			// Tremendo a tela
			screenshake(3);
		}
		
		// Ficando parado ao levar dano
		velh = 0;
		
		
		// Saindo do estado
		
		// Checando se eu devo morrer
		
		if(vida_atual > 0){
			if(image_index >= image_number - 1)
			{
				estado = "parado";	
			}
		}
		else
		{
			if(image_index >= image_number - 1)
			{
				estado = "dead";	
			}
		}
		
		break;
		
	case "dead":
	
		// Checando se o controlador existe
		if(instance_exists(obj_game_controller))
		{
			with(obj_game_controller)
			{
				game_over = true;	
			}
		}
	
		velh = 0;
		
		if(sprite_index != spr_player_dead)
		{
			image_index = 0;
			sprite_index = spr_player_dead;
		}
		
		// Ficando parado depois de morrer
		if(image_index >= image_number - 1)
		{
			image_index = image_number - 1;	
		}
		
		break;
	
	// Estado padrão
	default:
	{
		estado = "parado";	
	}
}

if(keyboard_check(vk_backspace)) game_restart();
