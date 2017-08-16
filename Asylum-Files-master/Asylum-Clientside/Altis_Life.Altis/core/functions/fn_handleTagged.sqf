/*
	File: fn_handleTagged.sqf
	Author: John "Paratus" VanderZwet
	
	Description: Been tagged, yo!
*/
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

player setDamage 0;
if (!life_istagged) then
{
	player allowDamage false;
	player setVariable["laserTagged", true, true];
	life_istagged = true;
	[[player],"ASY_fnc_laserEliminated",false,false] spawn life_fnc_MP;
	disableUserInput true;
	
	_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
	_obj setPosATL (getPosATL player);
	player attachTo [_obj,[0,0,0]];
	[[player,"AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	
	{
		if (_x distance (getMarkerPos "lasertag") < 35) then
		{
			[[0,format["%1 was tagged by %2.", profileName, name _unit]],"life_fnc_broadcast",_x,false] spawn life_fnc_MP;
		};
	} forEach allPlayers;
	
	sleep 5;
	
	disableUserInput false;
	detach player;
	deleteVehicle _obj;
	
	player setPos (player getVariable ["life_laser_pos", getMarkerPos "city"]);
	if (count (units life_old_group) < 10) then
	{
		[player] joinSilent (life_old_group);
	}
	else
	{
		[player] joinSilent (createGroup civilian);
	};
	
	life_laser_inprogress = false;
	life_istagged = false;
	sleep 2;
	player allowDamage true;
};