// Checar se estou colidindo com o player
var player = place_meeting(x, y, obj_player);

// Interação com a tecla "espaço"
var espaco = keyboard_check_released(vk_space);

// O player está colidindo comigo
if(player && espaco)
{
	// Código da transição
	var tran = instance_create_layer(0, 0, layer, obj_transicao);
	tran.destino = destino;
	tran.destino_x =  destino_x;
	tran.destino_y =  destino_y;
	
}