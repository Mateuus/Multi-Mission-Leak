/*
	File: fn_pullOutVeh.sqf
	
*/
if((isNull objectParent player)) exitWith {};
if(player getVariable ["restrained", false]) then
{
	detach player;
	player setVariable["Escorting", nil, true];
	player setVariable["transporting", nil, true];
};

player action ["Eject", vehicle player];
[localize "STR_NOTF_PulledOut", false] spawn domsg;