/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retextures the nearest vehicle
*/

private ["_vehicle"];

disableSerialization;

_vehicle = (nearestObjects [(vehicle player), ["Air","LandVehicle"],60]) select 0;
if(isNil "_vehicle")exitWith{hint "No vehicle was found nearby to retexture";};

ctrlShow [66654,false];

switch(DS_className)do {
	case "0": {
		if(player distance (getMarkerPos "adminspawnVeh") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\vehicles\scorp_hell.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\vehicles\scorp_hell.jpg"];
		};

		/*
		if(player distance (getMarkerPos "clanVeh1") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
			_vehicle setObjectTextureGlobal [4,""];
			_vehicle setObjectTextureGlobal [5,""];
		};
		*/

		if(player distance (getMarkerPos "clanVeh2") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\fu.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\fu.jpg"];
		};

		if(player distance (getMarkerPos "clanVeh3") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\roca.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\roca.jpg"];
		};

		if(player distance (getMarkerPos "clanVeh4") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\tfo.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\tfo.jpg"];
		};

		/*
		if(player distance (getMarkerPos "clanVeh5") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
			_vehicle setObjectTextureGlobal [4,""];
			_vehicle setObjectTextureGlobal [5,""];
		};
		*/

		/*
		if(player distance (getMarkerPos "clanVeh6") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
			_vehicle setObjectTextureGlobal [4,""];
			_vehicle setObjectTextureGlobal [5,""];
		};
		*/

		if(player distance (getMarkerPos "clanVeh7") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\tf.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\tf.jpg"];
		};

		/*
		if(player distance (getMarkerPos "clanVeh8") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
			_vehicle setObjectTextureGlobal [4,""];
			_vehicle setObjectTextureGlobal [5,""];
		};
		*/

		if(player distance (getMarkerPos "clanVeh9") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\tda.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\tda.jpg"];
		};

		if(player distance (getMarkerPos "clanVeh10") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\cosw.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\cosw.jpg"];
		};

		if(player distance (getMarkerPos "clanVeh11") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [1,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [2,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [3,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [4,"extras\textures\clothing\custom\lsd.jpg"];
			_vehicle setObjectTextureGlobal [5,"extras\textures\clothing\custom\lsd.jpg"];
		};

		/*
		if(player distance (getMarkerPos "clanVeh12") < 500)exitWith {
			_vehicle setObjectTextureGlobal [0,""];
			_vehicle setObjectTextureGlobal [1,""];
			_vehicle setObjectTextureGlobal [2,""];
			_vehicle setObjectTextureGlobal [3,""];
			_vehicle setObjectTextureGlobal [4,""];
			_vehicle setObjectTextureGlobal [5,""];
		};
		*/
	};
};

hint "Vehicle retextured, if you see no results, the vehicle type can not be textured. This is not a permanent change";