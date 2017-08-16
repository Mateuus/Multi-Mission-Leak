if!(_this isKindOf "LandVehicle") exitWith {};
closedialog 0;

if(life_veh_kfz == "") then {
	hint "Du besitzt noch kein Kennzeichen, beantrage es in einer Werkstatt!";
} else {
	[_this] call life_fnc_kennzeichen;
};