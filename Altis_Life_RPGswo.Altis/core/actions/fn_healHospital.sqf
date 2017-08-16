/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Doesn't matter, will be revised later.
*/
disableSerialization;
if(dwf_cash < 100) exitWith {hint format["Dir fehlen %1€ für die Behandlung.",100];};
DWEV_action_inUse = true;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Der Doc behandelt dich... (%1%2)...",1,"%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.1;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Der Doc behandelt dich... (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
	if(player distance (_this select 0) > 5) exitWith { };
};

if(player distance (_this select 0) > 5) exitWith { 5 cutText ["","PLAIN"]; titleText["Bleibe innerhalb von 5 m zum Doc.","PLAIN"]; DWEV_action_inUse = false; };


5 cutText ["","PLAIN"];
player setdamage 0;
titleText["Du bist nun komplett geheilt.","PLAIN"];
dwf_cash = dwf_cash - 100;
DWEV_action_inUse = false;
