/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	For police to close a clans base down
*/

private["_vehicles","_mcu","_action","_pos","_base","_targets"];

if(DS_doingStuff)exitwith{hint "Error 9938177BG"};

_mcu = false;
_vehicles = nearestObjects [(getpos player),["LandVehicle"],500];
{
	if((_x getVariable ["isMCU",false])&&(!(_x getVariable ["packed",false])))then
		{
		_mcu = true;
		};
}forEach _vehicles;
_vehicles = nearestObjects [(getpos player),["Ship"],500];
{
	if((_x getVariable ["isMCUWater",false])&&(!(_x getVariable ["packed",false])))then
		{
		_mcu = true;
		};
}forEach _vehicles;

if(!_mcu)exitwith{hint "An MCU must be within 500m and set up to do this"};

_action = [
		"Doing this cost $200k from the police bank and will lock down this bases shops for 1 hour, continue?",
		"Close down base",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(DS_policeBank < 200000)exitwith{hint "There is not enough funds in the police bank to do this"};

_base = [] call DS_fnc_getNearestBase;
if(isNull _base)exitwith{hint "No base was found to close down";};

if([player,25,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not close this with a civilian within 25m","PLAIN"];};

_targets = allPlayers select {(!((side _x) isEqualTo west))&&((_x distance player) < 300)};
if(!(_targets isEqualTo []))then{["The police are closing the nearby clan base",false,0] remoteExecCall ["DS_fnc_globalMessage",_targets];};

_pos = (position player);
_upp = "Locking Down Base";
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
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

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

DS_doingStuff = false;
if(!alive player) exitWith {};
if(player distance _pos > 10)exitwith {hint "You moved too far away"};

if([player,25,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not close this with a civilian within 25m","PLAIN"];};
if(DS_policeBank < 200000)exitwith{hint "There is not enough funds in the police bank to do this"};
[_base] remoteExec ["HUNT_fnc_closeBase",2];
[] call DS_cop_addEvictMarker;

hint "Base is now closing down...";
if((DS_infoArray select 21) == 32)then { [3] call DS_fnc_questCompleted };