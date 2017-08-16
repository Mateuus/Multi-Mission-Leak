#include <macro.h>
/*
	Author: Sink(Al Morise)
	
	Description:
	Increase the house security level.
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_securityLvl","_action","_amount","_houseCfg","_numberOfContainers"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};
_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
if(_uid != getPlayerUid player) exitWith {hint "Vous n'etes pas le proprietaire de cette maison.";};
life_action_inUse = true;
_securityLvl = _house getVariable "house_security";
if(_securityLvl == 5) exitWith {hint "Cette maison a deja la securite maximale.";life_action_inUse = false;};
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
_numberOfContainers = (_houseCfg select 1);
switch(_securityLvl) do {
	case 0: {_amount = 0;};
	case 1: {_amount = 100000 * _numberOfContainers;};
	case 2: {_amount = 100000 * _numberOfContainers;};
	case 3: {_amount = 200000 * _numberOfContainers;};
	case 4: {_amount = 200000 * _numberOfContainers;};
};
_action = [format ["Niveau de securite actuel : %1/5. La securite va passer au niveau : %2. Cout total de mise en place : %3. Continuez ?",_securityLvl,_securityLvl+1,_amount call life_fnc_numberText],"Confirmer l'augmentation du niveau de securite","Oui","Non"] call BIS_fnc_guiMessage;
if(!_action) exitWith {life_action_inUse = false;};
if(compte_banque < _amount) exitWith {hint "Pas assez d'argent sur votre compte.";life_action_inUse = false;};
//if((missionNamespace getVariable (["sechouse",0] call life_fnc_varHandle))==0) exitWith {hint "Vous n'avez pas l'objet necessaire. Vous pouvez en acheter au marche.";life_action_inUse = false;};
if(!([false,"sechouse",1] call life_fnc_handleInv)) exitWith {hint "Vous n'avez pas l'objet necessaire. Vous pouvez en acheter au marche.";};
disableSerialization;
_title = "Installation du systeme de securite...";
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
	uiSleep 0.26;
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
5 cutText ["","PLAIN"];
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player distance _house > 13) exitWith {life_action_inUse = false;};
if(!alive player) exitWith {life_action_inUse = false;};
life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
hint format["Nouveau systeme de securite. Niveau actuel : %1/5",_securityLvl+1];
[[_uid,_house,_securityLvl+1],"TON_fnc_upgradeSecurity",false,false] spawn life_fnc_MP;
compte_banque = compte_banque - _amount;
[1] call SOCK_fnc_updatePartial;