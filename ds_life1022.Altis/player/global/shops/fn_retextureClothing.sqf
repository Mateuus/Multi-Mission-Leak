/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retextures the player's clothing
*/

private ["_fail"];

disableSerialization;

_fail = true;

ctrlShow [66654,false];

switch(DS_className)do {
	case "0": {
		if(player distance (getMarkerPos "adminspawnVeh") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\vehicles\scorp_hell.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn1") < 500)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			_fail = false;
		};
		*/

		if(player distance (getMarkerPos "clanBaseSpawn2") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\fu.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\fu.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn3") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\roca.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\roca.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn4") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfo.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\tfo.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn5") < 500)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			_fail = false;
		};
		*/

		/*
		if(player distance (getMarkerPos "clanBaseSpawn6") < 500)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			_fail = false;
		};
		*/

		if(player distance (getMarkerPos "clanBaseSpawn7") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\tf.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\tf.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn8") < 500)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			_fail = false;
		};
		*/

		if(player distance (getMarkerPos "clanBaseSpawn9") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\tda.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\tda.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn10") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\cosw.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\cosw.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn11") < 500)exitWith {
			player setObjectTextureGlobal [0,"extras\textures\clothing\custom\lsd.jpg"];
			player setObjectTextureGlobal [1,"extras\textures\clothing\custom\lsd.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn12") < 500)exitWith {
			player setObjectTextureGlobal [0,""];
			player setObjectTextureGlobal [1,""];
			_fail = false;
		};
		*/
	};
	case "1": {
		if(player distance (getMarkerPos "adminspawnVeh") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "fd") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn1") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,""];
			_fail = false;
		};
		*/

		if(player distance (getMarkerPos "clanBaseSpawn2") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\fu.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn3") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\roca.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn4") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfo.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn5") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,""];
			_fail = false;
		};
		*/

		/*
		if(player distance (getMarkerPos "clanBaseSpawn6") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,""];
			_fail = false;
		};
		*/

		if(player distance (getMarkerPos "clanBaseSpawn7") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tf.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn8") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,""];
			_fail = false;
		};
		*/

		if(player distance (getMarkerPos "clanBaseSpawn9") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\tda.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn10") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\cosw.jpg"];
			_fail = false;
		};

		if(player distance (getMarkerPos "clanBaseSpawn11") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,"extras\textures\clothing\custom\lsd.jpg"];
			_fail = false;
		};

		/*
		if(player distance (getMarkerPos "clanBaseSpawn12") < 500)exitWith {
			(backpackContainer player) setObjectTextureGlobal [0,""];
			_fail = false;
		};
		*/
	};
};

if(_fail)exitWith{hint "This is not your texture to use"};
hint "Clothing retextured. If you see no results, the clothing type you are wearing can not be textured";