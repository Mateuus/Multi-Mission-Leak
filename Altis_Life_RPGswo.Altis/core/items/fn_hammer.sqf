/*
	File: fn_hammer.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: Division Wolf e.V. - Sandmann
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_house","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_fail","_sleep","_uid","_securityLvl"];
closeDialog 0;
_curTarget = cursorTarget;
_house = nearestBuilding (getPosATL player);
_uid = (_house getVariable "house_owner") select 0;
_securityLvl = _house getVariable "house_security";

if !((typeOf _curTarget) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {hint "Du schaust nicht auf eine Lagerkiste";};
if ((getPlayerUID player) == _uid) exitwith {hint "In das eigene Haus, kann man nicht einbrechen.";};
if(!([_uid] call DWEV_fnc_isUIDActive) && _securityLvl >= 6) exitWith {hint "Der Hausbesitzer ist nicht da, daher kannst du das Haus nicht Pluendern!";};
if(_securityLvl == 10) exitWith {hint "Diese Kiste kann nicht aufgebrochen werden";};

if(isNull _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {};

if(!(_curTarget getVariable ["BoxRobbed",false])) exitWith {hint "Die Kiste ist schon aufgebrochen."};

_distance = 10;

DWEV_action_inUse = true;

switch (typeof _curTarget) do
	{
		case "Box_IND_Grenades_F":{_fail = 20; _sleep = 0.90;}; // 90 sekunden
		case "B_supplyCrate_F":{_fail = 20; _sleep = 1.20;}; // 120 sekunden	
		default {_fail = 20; _sleep = 0.90;};	
	};

disableSerialization;
_title = "Breche Lagerkiste auf.";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then
	{
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	
	sleep _sleep;
	
	if(isNull _ui) then
	{
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText["Du hast dich zuweit entfernt.","PLAIN"]; DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen.","PLAIN"]; DWEV_action_inUse = false;};
if(!([false,"hammer",1] call DWEV_fnc_handlelnv)) exitWith {DWEV_action_inUse = false;};

DWEV_action_inUse = false;

_dice = floor (random 100);
if(_dice >= _fail) then 
	{
		titleText["Du hast die Lagerkiste erfolgreich aufgebrochen.","PLAIN"];
		_curTarget setVariable["BoxRobbed",false,true];
	} 
	else 
	{
		titleText["Der Hammer ist durchgebrochen.","PLAIN"];
	};