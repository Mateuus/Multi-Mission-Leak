/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retextures players, vehicles and backpacks
*/

private ["_vehicle"];

if(DS_donorLevel < 1)exitWith{hint "This option is for donors only"};
if(DS_gearfix)exitWith{hint "You've used this option too recently"};
DS_gearfix = true;

switch(_this select 0)do {
	case 0: {
		/*
		if((getPlayerUID player) in DS_clanBase1)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			player setObjectTextureGlobal [2,""];
			player setObjectTextureGlobal [3,""];
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
		*/

		if((getPlayerUID player) in DS_clanBase2)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\fu.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\fu.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\fu.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\fu.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\fu.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase3)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\roca.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\roca.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\roca.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\roca.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\roca.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase4)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfo.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\tfo.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\tfo.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\tfo.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfo.jpg"];
		};

		/*
		if((getPlayerUID player) in DS_clanBase5)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			player setObjectTextureGlobal [2,""];
			player setObjectTextureGlobal [3,""];
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
		*/

		if((getPlayerUID player) in DS_clanBase6)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\vehicles\scorp_hell.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\vehicles\scorp_hell.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\vehicles\scorp_hell.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase7)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\tf.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\tf.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\tf.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\tf.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tf.jpg"];
		};

		/*
		if((getPlayerUID player) in DS_clanBase8)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			player setObjectTextureGlobal [2,""];
			player setObjectTextureGlobal [3,""];
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
		*/

		if((getPlayerUID player) in DS_clanBase9)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\tda.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\tda.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\tda.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\tda.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tda.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase10)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\cosw.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\cosw.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\cosw.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\cosw.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\cosw.jpg"];

		};

		if((getPlayerUID player) in DS_clanBase11)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\lsd.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\lsd.jpg"];
			player setObjectTextureGlobal [2,"extras\textures\clothing\custom\lsd.jpg"];
			player setObjectTextureGlobal [3,"extras\textures\clothing\custom\lsd.jpg"];
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\lsd.jpg"];
		};

		/*
		if((getPlayerUID player) in DS_clanBase12)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			player setObjectTextureGlobal [2,""];
			player setObjectTextureGlobal [3,""];
			(backpackContainer player) setObjectTextureGlobal [0,""];
		};
		*/
	};
	case 1: {
		_vehicle = vehicle player;

		if(isNull objectParent player)exitWith{};
		if(!(_vehicle in DS_keyRing))exitWith{};
		if(_vehicle getVariable ["policeVehicle",false])exitWith{};

		/*
		if((getPlayerUID player) in DS_clanBase1)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
		};
		*/

		if((getPlayerUID player) in DS_clanBase2)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\fu.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase3)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\roca.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase4)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\tfo.jpg"];
		};

		/*
		if((getPlayerUID player) in DS_clanBase5)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
		};
		*/

		if((getPlayerUID player) in DS_clanBase6)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\vehicles\scorp_hell.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase7)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\tf.jpg"];
		};

		/*
		if((getPlayerUID player) in DS_clanBase8)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
		};
		*/

		if((getPlayerUID player) in DS_clanBase9)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\tda.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase10)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\cosw.jpg"];
		};

		if((getPlayerUID player) in DS_clanBase11)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\lsd.jpg"];
		};

		/*
		if((getPlayerUID player) in DS_clanBase12)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
		};
		*/
	};
};

sleep 5;
DS_gearfix = false;