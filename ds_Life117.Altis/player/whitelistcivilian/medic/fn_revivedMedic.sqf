/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Runs on a player when he is revived by a Medic
*/
private["_rebel","_dir","_oldGear","_payment"];
_rebel = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_payment = [_this,1,10000,[0]] call BIS_fnc_param;
_oldGear = [DS_deadBody] call DS_fnc_getDeadGear;
[_oldGear] spawn DS_fnc_loadDeadGear;
DS_deadBody setVariable["name",nil,true];
[[DS_deadBody],"DS_fnc_removeDead",nil,FALSE] spawn BIS_fnc_MP;
_dir = getDir DS_deadBody;
hint format["Medic %1 has revived you",_rebel];
DS_NLR = false;
DS_revived = true;
DS_doingStuff = false;
DS_requestedMedic = false;
if(DS_rebelAdv_removed) then
	{
	DSL_rebelAdv = true;
	DSL_rebel = true;
	DS_rebelAdv_removed = false;
	};
if((playerside) == civilian) then {DS_currentWeight = 0;};
closeDialog 0;

player setDir _dir;
player setPosASL (visiblePositionASL DS_deadBody);
DS_deadBody setVariable["Revive",false,TRUE];
DS_deadBody setVariable["name",nil,TRUE];
[[DS_deadBody],"DS_fnc_removeDead",true,false] spawn BIS_fnc_MP;
hideBody DS_deadBody;

player setVariable["Revive",false,TRUE];
DS_deadBody setVariable["name",profileName,true];
player setVariable["Reviving",false,TRUE];
[] call DS_fnc_updateHud; 

if(playerside != west)then
	{
	systemchat format ["For his services you have paid this medic $%1",_payment];
	hint format ["For his services you have paid this medic $%1",_payment];
	[_payment,true,false] call DS_fnc_handleMoney;
	};

[] call DS_fnc_compileData;
[] call DS_fnc_setupPlayerActions;
player setVariable ["bounty",(DS_wanted_Stats select 0),true];

if(playerside == west)then
	{
	[[west,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
	player setVariable ["policeAction","",true];
	}
	else
	{
	[[civilian,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
	};

if(DS_mechanic)then
	{
	player setVariable ["mechanic",true,true];
	};
	
if(DSL_security)then
	{
	player setVariable ["security",true,true];
	};
	
if(DS_medic)then
	{
	player setVariable ["medic",true,true];
	};
	
if(player getVariable ["security",false])then{[[west,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;};

DS_armour = 15;
DS_medicRevived = true;
[] call DS_fnc_stamina;
[] spawn DS_fnc_earPlugs;
[] spawn
	{
	_time = time + 3600;
	waitUntil{((!alive player)||(time > _time))};
	DS_medicRevived = false;
	};
