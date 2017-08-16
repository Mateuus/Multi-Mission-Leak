/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
life_corpse = _corpse;

player setVariable ["customTexture", nil, true];
player setVariable ["customTextureBP", nil, true];

if(life_is_arrested) then
{
	hint "You tried to suicide from jail, you will be jailed again.";
	life_is_arrested = false;
	["kavala"] spawn life_fnc_jail;
}
else
{
	switch(playerSide) do
	{
		case west: 
		{
			if (life_coprole == "detective" || (str player) in ["cop_detective_1","cop_detective_2","cop_detective_3"]) then { [] call life_fnc_detectiveGear }
			else { 
				[] spawn life_fnc_loadGear; 
				_unit setVariable["copLevel", life_coplevel, true]; // for showing rank, etc
				//if(life_coplevel > 2) then {_unit setVariable["swatlevel",1,true]};
			};
			if (life_swatlevel > 0) then { _unit setVariable["swatlevel", life_swatlevel, true]; };
			if (life_coplevel < 1) then {["NotWhitelisted",false,false] call BIS_fnc_endMission;};
		};
		
		case civilian:
		{
			_unit setVariable["restrained",nil,true];
			_unit setVariable["Escorting",nil,true];
			_unit setVariable["transporting",nil,true];
			_unit setVariable["last_revived",-1000,true];
			[[_unit,false],"life_fnc_setRestrained",false,false] spawn life_fnc_MP;
			if (headGear player != "") then {removeHeadgear player;};
			if (goggles player != "") then {removeGoggles player;};
			if (life_gang != "0") then {_unit setVariable["gang", life_gang, true];};
			if (life_gang_name != "") then {_unit setVariable["gangName", life_gang_name, true];};
			if (!isNull(life_gang_group)) then {_unit setVariable["gangGroup", life_gang_group, true];};
			if (!(isNull life_corpse)) then { [life_corpse,true] spawn life_fnc_dropItems; };
		};
	};
};

_unit addRating 9999999999999999;

if (life_radio_chan > -1) then { [nil,nil,nil,-1] spawn life_fnc_useRadio; };
player setVariable ["BIS_noCoreConversations", true];

[] call life_fnc_hudUpdate;
cutText ["","BLACK IN"];

[] call life_fnc_fetchGear;
[] call life_fnc_equipGear;
[] spawn life_fnc_hudUpdate;