/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Repairs safes at fortknox
	*/
private["_infoArray","_pos"];


_infoArray = [];
_pos = (position player);

switch (true) do
	{
	case (player distance knox_safe1 < 7) : {_infoArray = [0,knox_safe1,"cracking","closed"]};
	case (player distance knox_safe2 < 7) : {_infoArray = [0,knox_safe2,"cracking","closed"]};
	};
if([getPos player,30,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not repair this when a civilian is so nearby","PLAIN"];};
if(_infoArray isEqualTo [])exitwith{hint "You are not close enough to a safe"};
if(!((_infoArray select 1) getVariable [(_infoArray select 2),false]))exitwith{hint "This safe is not currently being cracked"};	
	DS_doingStuff = true;
	_upp = "Disabling Safe Cracker";
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
			
	while{true} do
		{
		sleep 0.1;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(player distance _pos > 10)exitwith {};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
DS_doingStuff = false;
if(!alive player)exitwith{};
if(player != vehicle player) exitWith {};	
if(player distance _pos > 10)exitwith {hint "You moved too far away"};
(_infoArray select 1) setVariable [(_infoArray select 2),false,true];
(_infoArray select 1) setVariable [(_infoArray select 3),true,true];
[[(_infoArray select 0),(_infoArray select 1)],"HUNT_fnc_knox",false,false] spawn BIS_fnc_MP;	
{
	if(side _x == west)then
		{
		[[25000,"Locked a safe at Fortknox",name player],"DS_fnc_copRewards",_x,false] spawn BIS_fnc_MP;
		};
}forEach playableUnits;




