#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if(EQUAL((lbCurSel 2621),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",(lbData[2621,(lbCurSel 2621)])];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_TransferSelf"};

_action = [
	format[localize "STR_GNOTF_TransferMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(EQUAL(_unitID,"")) exitWith {hint "Bad UID?"}; //Unlikely?
	group player setVariable ["gang_owner",_unitID,true];
	group player selectLeader _unit;
	[_unit,group player] remoteExec ["ES_fnc_clientGangLeader",_unit]; //Boot that bitch!
	[3,group player] remoteExec ["ES_fnc_updateGang",2]; //Update the database.
} else {
	hint localize "STR_GNOTF_TransferCancel";
};
[] call ES_fnc_gangMenu;