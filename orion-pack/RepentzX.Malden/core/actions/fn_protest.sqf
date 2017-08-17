private ["_sign"];

if(!(vehicle player == player)) exitWith {hint format["You cant use this in a vehicle %1!",name player]};

if (animationState player == "amovpercmstpsnonwnondnon_salute") then
	{
		_sign = "Land_Poster_04_F" createVehicle [0,0,0];
		_sign attachTo [player, [0,0,0.6], "righthand"];
		_sign setVectorUp [0,90,-1];

		

		waitUntil{(!(animationState player == "amovpercmstpsnonwnondnon_salute")) or !alive player};

		deleteVehicle _sign;
		[true,"protest",1] call life_fnc_handleInv;
	} else {

player action ["SwitchWeapon", player, player, 100];

waitUntil{animationState player == "amovpercmstpsnonwnondnon"};

player playAction "Salute";

_sign = "Land_Poster_04_F" createVehicle [0,0,0];
_sign attachTo [player, [0,0,0.6], "righthand"];
_sign setVectorUp [0,90,-1];

sleep 1;

waitUntil{(!(animationState player == "amovpercmstpsnonwnondnon_salute")) or !alive player};

deleteVehicle _sign;
[true,"protest",1] call life_fnc_handleInv;
};