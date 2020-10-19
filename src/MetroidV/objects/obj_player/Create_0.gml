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