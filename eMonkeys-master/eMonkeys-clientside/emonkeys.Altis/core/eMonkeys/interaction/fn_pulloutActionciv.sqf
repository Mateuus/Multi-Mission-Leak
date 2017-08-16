/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

{
	if(side _x != west) then
	{
		_x setVariable ["transportingciv",false,true]; _x setVariable ["Escortingciv",false,true];
		[[_x],"EMonkeys_fnc_pulloutVeh",_x,false] call EMonkeys_fnc_mp;
	};

} foreach _crew;