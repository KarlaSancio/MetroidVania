// Sistema de colisão e movimentação
var _velh = sign(velh);
var _velv = sign(velv);


// Horizontal
repeat(abs(velh))
{
	if(place_meeting(x + _velh, y, obj_block))
	{
		velh = 0;
		break;
	}
	x += _velh;
}

// Vertical
repeat(abs(velv))
{
	if(place_meeting(x, y + _velv, obj_block))
	{
		velv = 0;
		break;
	}
	y += _velv;
}