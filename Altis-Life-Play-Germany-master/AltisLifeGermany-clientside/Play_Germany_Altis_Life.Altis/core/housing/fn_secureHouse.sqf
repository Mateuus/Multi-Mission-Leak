#include <macro.h>
/*
	Author: Sink(Al Morise)
	
	Description:
	Increase the house security level.
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_securityLvl","_action","_amount","_numberOfContainers"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};
_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActiveCiv)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
if(_uid != getPlayerUid player) exitWith {hint "Du bist nicht der Haus Eigentümer.";};
life_action_inUse = true;
_securityLvl = _house getVariable ["house_security",0];
if(_securityLvl == 5) exitWith {
	hint "Dieses Haus ist bereits im Besitz des maximalen Einbruchsschutz.";
	life_action_inUse = false;
};
_numberOfContainers = M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage");
switch(_securityLvl) do {
	case 0: {_amount = 0;};
	case 1: {_amount = 200000 * _numberOfContainers;};
	case 2: {_amount = 300000 * _numberOfContainers;};
	case 3: {_amount = 400000 * _numberOfContainers;};
	case 4: {_amount = 500000 * _numberOfContainers;};
};

_action = [format ["Aktuelles Sicherheitslevel: %1. Upgrade auf: %2. Die folgende Summe wird beim Upgraden von deinem Konto abgehoben: %3. Fortfahren?",_securityLvl,_securityLvl+1,_amount call life_fnc_numberText],"Upgrade bestätigen","Ja","Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {life_action_inUse = false;};
if(PG_bank < _amount) exitWith {
	hint "Du hast nicht genug Geld auf deinem Bankkonto.";
	life_action_inUse = false;
};
if((missionNamespace getVariable "life_inv_houseIDS")==0) exitWith {
	hint "Du hast das notwendige Upgrade für das Einbruchsschutz System nicht dabei. Du kannst es im Markt kaufen.";
	life_action_inUse = false;
};

//Setup the progress bar
disableSerialization;
_title = "Installiere Einbruchsschutz System...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
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
if(!([false,"houseIDS",1] call life_fnc_handleInv)) exitWith {hint "Du hast das notwendige Upgrade für das Einbruchsschutz System nicht dabei. Du kannst es im Markt kaufen.";};
hint format["Einbruchsschutz System erfolgreich aufgewertet. Aktuelles Sicherheitslevel: %1",_securityLvl+1];
[[_uid,_house,_securityLvl+1],"TON_fnc_upgradeSecurity",false,false] spawn life_fnc_MP;
PG_bank = PG_bank - _amount;
[1] call SOCK_fnc_updatePartial;