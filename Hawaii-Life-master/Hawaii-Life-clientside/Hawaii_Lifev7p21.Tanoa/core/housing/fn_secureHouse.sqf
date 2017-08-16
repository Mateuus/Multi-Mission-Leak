#include "..\..\script_macros.hpp"
/*
	Author: Sink(Al Morise)
	
	Description:
	Increase the house security level.
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_securityLvl","_action","_amount","_houseCfg","_numberOfContainers"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};
_uid = (_house GVAR "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
if(_uid != getPlayerUid player) exitWith {hint "Das ist nicht dein Haus.";};
life_action_inUse = true;
_securityLvl = _house GVAR "house_security";
if(_securityLvl isEqualTo 5) exitWith {hint "Dieses Haus hat bereits das letzte Level.";life_action_inUse = false;};
if(!([false,"sechouse",1] call life_fnc_handleInv)) exitWith {hint "Du musst das Haus Security Item in deinem Inventar haben. Dieses kannst du am Markt kaufen.";life_action_inUse = false;};
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
_numberOfContainers = (_houseCfg select 1);
switch(_securityLvl) do {
	case 0: {_amount = 0;};
	case 1: {_amount = 200000 * _numberOfContainers;};
	case 2: {_amount = 300000 * _numberOfContainers;};
	case 3: {_amount = 400000 * _numberOfContainers;};
	case 4: {_amount = 500000 * _numberOfContainers;};
};

_action = [format ["Current security level: %1. Dein Security Level wird sein: %2. Dieser Betrag wird von deinem Konto abgebucht werden: %3. Fortfahren?",_securityLvl,_securityLvl+1,_amount call life_fnc_numberText],"Confirm security upgrade","Ja","Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {life_action_inUse = false;};
if(BANK < _amount) exitWith {hint "Du hast nicht genug Geld auf dem Konto.";life_action_inUse = false;};
if((missionNamespace GVAR (["sechouse",0] call life_fnc_varHandle))==0) exitWith {hint "Du musst das Haus Security Item in deinem Inventar haben. Dieses kannst du am Markt kaufen.";life_action_inUse = false;};
//Setup the progress bar
disableSerialization;
_title = "Installiere Security System...";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {life_action_inUse = false;};
	if(life_interrupted) exitWith {};
	if(player distance _house > 13) exitWith {life_action_inUse = false;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player distance _house > 13) exitWith {life_action_inUse = false;};
if(!alive player) exitWith {life_action_inUse = false;};
life_action_inUse = false;
hint format["Neues Security Level wurde installiert. Aktuelles Security Level: %1",_securityLvl+1];
if (life_HC_isActive) then {
	[_uid,_house,_securityLvl+1] remoteExecCall ["HC_fnc_upgradeSecurity",HC_Life];
} else {
	[_uid,_house,_securityLvl+1] remoteExecCall ["TON_fnc_upgradeSecurity",RSERV];
};
SUB(BANK,_amount);
[1] call SOCK_fnc_updatePartial;
