// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_funcoes(){

}

// Screenshake
///@function screenshake(valor_da_tremida)
///@arg forca_da_tremida
///@arg [dir_mode]
///@arg direcao
function screenshake(_treme, _dir_mode, _direcao)
{
	var shake = instance_create_layer(0, 0, "instances", obj_screenshake);
	shake.shake = _treme;
	shake.dir_mode = _dir_mode;
	shake.dir = _direcao;
}