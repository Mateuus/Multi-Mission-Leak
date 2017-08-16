/*
	File: fn_p_UpdatePlayer.sqf
	Author: Copusirum
	
	Description:
	Updates the "Give" Combobox with the Name of the nearest guy´s
*/

//Nobody want this variablen
private["_dialog","_near_i","_near","_near_units","_side"];

//Because Boehmia isnt so good they think
disableSerialization;

//Find The Dialog and the Box
_dialog = findDisplay 2001;
_near_i = _dialog displayCtrl 2023;
_near = _dialog displayCtrl 2022;

//Clear it to prevent overshitting
lbClear _near;
lbClear _near_i;

//Near players finding and Adding
_near_units = [];
{ if(player distance _x < 6) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 6 && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_side = "Cop"};
			case independent: {_side = "Med"};
			case civilian: {_side = "Civ"};
			case east: {_side = "Civ"};
		};

		_near lbAdd format["%1 - %2",_x getVariable["realname",name _x], _side];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_x getVariable["realname",name _x], _side];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;