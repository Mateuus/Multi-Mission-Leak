/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991
	
	Description:
	Figure it out.
*/
private["_display","_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 1000;
_info = lbData[2902,lbCurSel (2902)];
_info = call compile format["%1", _info];
if(isNil "_info") exitWith {_text ctrlSetText "Player no longer exist";};
if(isNull _info) exitWith {_text ctrlSetText "Query Failed";};
[[player],"DS_fnc_player_query",_info,false] spawn BIS_fnc_MP;
_text ctrlSetText "Querying...";