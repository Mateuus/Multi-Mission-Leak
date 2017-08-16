_curTarget = _this select 0;

if(!(_curTarget getVariable ["onkill",false])) exitWith {};
if(_curTarget getVariable "ausgeraubt") exitWith {};
if(player distance _curTarget > 2.5) exitWith {};

_curTarget setVariable["ausgeraubt",true,true]; 
if ([west,getPos player,350] call EMonkeys_fnc_nearUnits) then 
{
	[[getPlayerUID player,name player,"46"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
};