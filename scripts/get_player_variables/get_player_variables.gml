/// @desc Get the variables for the player
/// @param {string} player Description
function get_player_variables(player){
	switch (player) {
	    case "mash":
	        // velocidade máxima do personagem
			global.max_spd = 50;
			// o quanto de velocidade o personagem ganha.(vai de 0.1 a 2);
			global.acceleration = 0.5;
			// o tempo de duração do boost.
			global.boosttime = 60*8;
			// a velocidade do drift
			global.drift = 75;
			// o peso do personagem (vai de 0.1 a 2);
			global.weight = 1;
			//o sprite do personagem
			global.sprite[0] = spr_mash;
			global.sprite[1] = spr_mash_flip;
			global.sprite[2] = spr_mash_lback;
			global.sprite[3] = spr_mash_lback_flip;
	        break;
	    case "misha":
	        // velocidade máxima do personagem
			global.max_spd = 20;
			// o quanto de velocidade o personagem ganha.(vai de 0.1 a 2);
			global.acceleration = 0.5;
			// o tempo de duração do boost.
			global.boosttime = 60*8;
			// a velocidade do drift
			global.drift = 20;
			// o peso do personagem (vai de 0.1 a 2);
			global.weight = 0.5;
	        break;
	    case "lucas":
	        // velocidade máxima do personagem
			global.max_spd = 20;
			// o quanto de velocidade o personagem ganha.(vai de 0.1 a 2);
			global.acceleration = 0.5;
			// o tempo de duração do boost.
			global.boosttime = 60*8;
			// a velocidade do drift
			global.drift = 2;
			// o peso do personagem (vai de 0.1 a 2);
			global.weight = 0.5;
	        break;
	    default:
	        show_error("No player selected.", true);
	        break;
	}
}