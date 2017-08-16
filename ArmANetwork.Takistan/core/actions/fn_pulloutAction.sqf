/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew","_veh"];
_veh = param [0,ObjNull,[ObjNull]];
_crew = crew _veh;

if(_veh distance player > 3.5) exitWith {};
if(speed _veh > 1) exitWith {};

{
	switch(playerSide) do
	{
		case independent:
		{

		};
		case civilian:
		{
			if((_x getVariable "restrainedtype") == "civ") then
			{
				_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
				[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
			};
		};
		case west:
		{
			_x setVariable ["transporting",false,true];
			_x setVariable ["Escorting",false,true];
			[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
		};
	};
} foreach _crew;
