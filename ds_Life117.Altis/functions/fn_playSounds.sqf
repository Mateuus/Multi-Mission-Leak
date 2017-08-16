private ["_long"];

_long = [_this,2,false,[false]] call BIS_fnc_param;

if(_long)then
	{
	(_this select 0) say3D [(_this select 1),500,1];
	}
	else
	{
	if(player distance (_this select 0) > 100)exitwith{};
	(_this select 0) say3D (_this select 1);
	};

