randomize();

// Criando a camera
var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;

// Inherit the parent event
event_inherited();

vida_max = 2;
vida_atual = vida_max;

max_velh = 4;
max_velv = 6;
dash_vel = 6;

mostra_estado = true;

combo = 0;
dano = noone;


ataque = 1;
posso = true;
ataque_mult = 1;

ataque_buff = room_speed;
ataque_down = false;

//Metodo para iniciar o ataque
/// @method inicia_ataque(chao)
/// @arg {bool} chao
inicia_ataque = function(chao)
{
	if(chao)
	{
		estado = "ataque";
		velh = 0;
		image_index = 0;
	}
	else // Não estou no chao
	{
		if(keyboard_check(ord("S")))
		{
			estado = "ataque aereo down";
			velh = 0;
			image_index = 0;
		}
		else
		{
			estado = "ataque aereo";
			image_index = 0;
		}
	}
}

finaliza_ataque =  function()
{
	posso = true;
	if(dano)
	{
		instance_destroy(dano, false);
		dano = noone;
	}
}