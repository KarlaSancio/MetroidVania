// Criando a tela de game over
if(game_over)
{
	// Pegando algumas informações
	var x1 = camera_get_view_x(view_camera[0]); // pega começo da camera (horizontal)
	var w = camera_get_view_width(view_camera[0]); // pega largura da camera
	var x2 = x1 + w; // final da camera horizontal
	var meio_w = x1 + w/2; // meio da camera horizontal
	var y1 = camera_get_view_y(view_camera[0]); // pega começo da camera (vertical)
	var h = camera_get_view_height(view_camera[0]); // pega altura da camera
	var y2 = y1 + h; //final da camera vertical
	var meio_h = y1 + h/2; // meio da camera vertical
	
	var qtd = h * .15;
	
	valor = lerp(valor, 1, .02);
	
	draw_set_color(c_black);
	// Escurecendo a tela
	draw_set_alpha(valor - .3);
	draw_rectangle(x1, y1, x2, y2, false);
	
	// Desenhando o retângulo de cima
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2, y1 + qtd * valor, false);
	
	// Desenhando o retângulo de baixo
	draw_rectangle(x1, y2, x2, y2 - qtd * valor, false);
	
	
	draw_set_alpha(1);
	draw_set_color(-1);
}
else
{
	valor = 0;	
}