/*
	File: fn_closeBase.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	For police to close a clans base down
*/
private["_vehicles","_mcu","_action","_pos","_base"];

if(DS_doingStuff)exitwith{hint "Error 9938177BG"};

_mcu = false;
_vehicles = nearestObjects [(getpos player),["LandVehicle"],30];
{
	if((_x getVariable ["isMCU",false])&&(!(_x getVariable ["packed",false])))then
		{
		_mcu = true;
		};
}forEach _vehicles;

if(!_mcu)exitwith{hint "The MCU must be nearby and set up to do this"};

_action = [
		"Doing this cost $200k from the police bank and will lock down this bases shops for 1 hour, continue?",
		"Close down base",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_policeBank < 200000)exitwith{hint "There is not enough funds in the police bank to do this"};

switch(true)do
	{
	case (player distance baseClan1 < 100):
		{
		_base = baseClan1;
		};
	case (player distance baseClan2 < 100):
		{
		_base = baseClan2;
		};
	case (player distance baseClan3 < 100):
		{
		_base = baseClan3;
		};
	case (player distance baseClan4 < 100):
		{
		_base = baseClan4;
		};
	case (player distance baseClan5 < 100):
		{
		_base = baseClan5;
		};
	case (player distance baseClan6 < 100):
		{
		_base = baseClan6;
		};
	case (player distance baseClan7 < 100):
		{
		_base = baseClan7;
		};
	case (player distance baseClan8 < 100):
		{
		_base = baseClan8;
		};
	};
	
if([getPos player,200,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not close this with a civilian within 200m","PLAIN"];};
	
	_pos = (position player);
	_upp = "Locking Down Base";
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
DS_doingStuff = true;			
	while{true} do
		{
		sleep 0.5;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player distance _pos > 10)exitwith {};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
DS_doingStuff = false;
if(!alive player) exitWith {};	
if(player distance _pos > 10)exitwith {hint "You moved too far away"};


if([getPos player,200,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not close this with a civilian within 200m","PLAIN"];};
if(DS_policeBank < 200000)exitwith{hint "There is not enough funds in the police bank to do this"};
[[_base],"HUNT_fnc_closeBase",false,false] spawn BIS_fnc_MP;

hint "Base is now closing down.....";