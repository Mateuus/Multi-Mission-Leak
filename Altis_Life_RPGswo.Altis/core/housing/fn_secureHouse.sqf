#include "..\..\macros.hpp"
/*
	Author: Sink(Al Morise)	Description: Increase the house security level. Modified by: Division Wolf e.V.
*/

private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_securityLvl","_action","_amount","_houseCfg","_numberOfContainers"];

_house = param [0,ObjNull,[ObjNull]];

if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Für dieses Haus gibt es keinen Besitzer"};
_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call DWEV_fnc_isUIDActive)) exitWith {hint "Der Hausbesitzer ist nicht da!";}; //irgendwie nutzlos hier!
if(_uid != getPlayerUid player) exitWith {hint "Du bist nicht der Hausbesitzer.";};
DWEV_action_inUse = true;

_securityLvl = _house getVariable "house_security";
if(_securityLvl == 9) exitWith {hint "Dieses Haus hat bereits die maximale Sicherheitsstufe."; DWEV_action_inUse = false;};
_houseCfg = [(typeOf _house)] call DWEV_fnc_houseConfig;
_numberOfContainers = (_houseCfg select 1);

switch(_securityLvl) do
{
	case 0: {_amount = 0;};
	case 1: {_amount = 200000 * _numberOfContainers;};
	case 2: {_amount = 300000 * _numberOfContainers;};
	case 3: {_amount = 400000 * _numberOfContainers;};
	case 4: {_amount = 500000 * _numberOfContainers;};
	case 5: {_amount = 600000 * _numberOfContainers;};
	case 6: {_amount = 800000 * _numberOfContainers;};
	case 7: {_amount = 1000000 * _numberOfContainers;};
	case 8: {_amount = 1200000 * _numberOfContainers;};
};
_action = [
	format ["Aktuelle Sicherheitsstufe: %1. Die Sicherheitsstufe wird auf %2 aufgerüstet. Es werden %3 € für die Aufrüstung von deinem Bankkonto abgebucht. Fortsetzen?",
	_securityLvl,
	(_securityLvl+1),
	_amount call DWEV_fnc_numberText],
	"Sicherheitssystem aufruesten?","Ja","Nein"
] call BIS_fnc_guiMessage;
	
if(!_action) exitWith {DWEV_action_inUse = false;};
if(dwf_atmcash < _amount) exitWith
{
	hint format["Du hast nicht genug Geld auf deinem Bankkonto! Aufruestung auf Sicherheitsstufe %1 kostet %2 €",(_securityLvl+1),[_amount] call DWEV_fnc_numberText];
	DWEV_action_inUse = false;
};

if(!([false,"sechouse",1] call DWEV_fnc_handlelnv)) exitWith
{
	hint "Du hast nicht das Haus Sicherheitssystem bei dir, um die Sicherheitsstufe aufzuruesten. Du kannst es im Supermarkt kaufen.";
	DWEV_action_inUse = false;
};

//Setup the progress bar
disableSerialization;

_title = "Installiere das Sicherheitssystem...";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;
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
	sleep 0.3;
	
	if(isNull _ui) then
	{
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
	};
	
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	
	if(_cP >= 1 OR !alive player) exitWith {DWEV_action_inUse = false;};
	if(DWEV_interrupted) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(player distance _house > 13) exitWith {DWEV_action_inUse = false;};	
};
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith
{
	DWEV_interrupted = false;
	titleText["Aktion abgebrochen","PLAIN"];
	DWEV_action_inUse = false;
};
if(player distance _house > 13) exitWith {DWEV_action_inUse = false;};
DWEV_action_inUse = false;

if(!([false,"sechouse",1] call DWEV_fnc_handlelnv)) exitWith {hint "Du hast nicht das Haus Sicherheitssystem bei dir, um die Sicherheitsstufe aufzuruesten. Du kannst es im Supermarkt kaufen.";};

hint format["Neues Sicherheitssystem installiert. Aktuelle Sicherheitsstufe: %1",_securityLvl+1];

[_uid,_house,(_securityLvl+1)] remoteExec ["DWF_fnc_upgradeSecurity",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
dwf_atmcash = dwf_atmcash - _amount;
[1] call SOCK_fnc_updatePartial;