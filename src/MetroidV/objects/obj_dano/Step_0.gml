var outro = instance_place(x, y, obj_entidade);

// Se eu estou tocando em alguem
if(outro)
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