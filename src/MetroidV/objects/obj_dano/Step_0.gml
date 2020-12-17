var outro;
var outro_lista = ds_list_create();
var quantidade = instance_place_list(x, y, obj_entidade, outro_lista, 0);


// Adicionando todos que foram colididos na lista de aplicar dano
for(var i = 0; i < quantidade; i++)
{
	// Checando o atual
	var atual = outro_lista[| i];
	
	// Checando se o alvo atual esta invencivel
	if(atual.invencivel)
	{
		continue;//isso permite que o dano ignore o alvo, não aplicando dano a ele	
	}
	
	//show_message(object_get_name(atual.object_index));
	// Checando se a colisão não é entre filho e pai
	if(object_get_parent(atual.object_index) != object_get_parent(pai.object_index))
	{	
		
		// Checar se eu realmente posso dar dano
		
		
		// Checar se o atual ja está na lista
		var pos = ds_list_find_index(aplicar_dano, atual);
		if(pos == -1)
		{
			// Se o atual nao estiver na lista, ele é adicionado
			ds_list_add(aplicar_dano, atual);	
		}
	}
}

// Aplicando o dano
var tam_lista = ds_list_size(aplicar_dano);
for(var i = 0; i < tam_lista; i++)
{
	outro = aplicar_dano[| i].id;
	if(outro.vida_atual > 0)
	{
		outro.estado = "hit";
		outro.image_index = 0;
		outro.vida_atual -= dano;
		instance_destroy();
	}
}

ds_list_destroy(aplicar_dano);
ds_list_destroy(outro_lista);

if(morrer)
{
	instance_destroy();
}
else
{
	y = pai.y - pai.sprite_height/2;
	
	if(quantidade)
	{
		instance_destroy();	
	}
}

// Se eu estou tocando em alguem
/*if(outro)
{
	// Se o objeto não toca o pai
	if(outro.id != pai)
	{
		//Debug message
			show_debug_message("foi!!" + string(id));
		
		// Checando quem eh o pai
		var papi = object_get_parent(outro.object_index);
		if(papi != object_get_parent(pai.object_index))
		{
			
			if(outro.vida_atual > 0)
			{
				outro.estado = "hit";
				outro.image_index = 0;
				outro.vida_atual -= dano;
				instance_destroy();
			}
		}
	}
}