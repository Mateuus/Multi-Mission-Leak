#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "DWEV_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;}; //Bad juju
_gangName = grpPlayer getVariable "gang_name";
_gangBank = grpPlayer getVariable "gang_bank";
_gangMax = grpPlayer getVariable "gang_maxMembers";
_gangMembers = grpPlayer getVariable ["gang_members",[]];

if(_ownerID != steamid) then {
	//-	(getControl(2620,2622)) ctrlEnable false; //Upgrade
	//-	(getControl(2620,2624)) ctrlEnable false; //Kick
	//- (getControl(2620,2625)) ctrlEnable false; //Set New Leader
	//- (getControl(2620,2631)) ctrlEnable false; //Disband Gang
	//	(getControl(2620,2630)) ctrlEnable false; //Invite Player
	//	(getControl(2620,507015)) ctrlEnable false; //Upgrade grafik
	//	(getControl(2620,507016)) ctrlEnable false; //Upgrade button
	//	(getControl(2620,507017)) ctrlEnable false; //Kick grafik
	//	(getControl(2620,507018)) ctrlEnable false; //Kick button
	//	(getControl(2620,507019)) ctrlEnable false; //Set New Leader grafik
	//	(getControl(2620,507020)) ctrlEnable false; //Set New Leader button
	//	(getControl(2620,507023)) ctrlEnable false; //Invite Player grafik
	//	(getControl(2620,507024)) ctrlEnable false; //Invite Player button
	//	(getControl(2620,507021)) ctrlEnable false; //Disband Gang grafik
	//	(getControl(2620,507022)) ctrlEnable false; //Disband Gang grafik
};

(getControl(2620,2629)) ctrlSetText _gangName;
(getControl(2620,601)) ctrlSetText format["Geld: %1€",[_gangBank] call DWEV_fnc_numberText];



//Loop through the players.
_members = getControl(2620,2621);
lbClear _members;

{
	_uid = (_x select 0);
	_name = (_x select 1);
	_rank = (_x select 2);
	_rankText = ([_rank] call DWEV_fnc_convertArmaRank);
	
	_isOnline = [_uid] call DWEV_fnc_isUIDActive;
	_statusText = (if (_isOnline) then {"ONLINE"} else {"OFFLINE"});
	
	if(_uid == _ownerID) then
	{
		_members lbAdd format["(%2) %1 (Gang Leader)",_name,_statusText];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} 
	else 
	{
		_members lbAdd format["(%2) %1 (%3)",_name,_statusText,_rankText];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
	false;
} count _gangMembers;

_grpMembers = units grpPlayer;
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
_allUnits = _allUnits - [-1];

_ctrl = getControl(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",getPlayerDName(_x)];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
	false;
} count _allUnits;