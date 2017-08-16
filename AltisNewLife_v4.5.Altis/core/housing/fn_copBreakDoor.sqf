#include <macro.h>
private["_house","_uid","_door","_title","_titleText","_progressBar","_cpRate","_cP"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Cette maison n'appartient a personne !"};
_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint "Le proprietaire n'est pas en connecté vous ne pouvez pas forcer cette maison !"};
_door = [_house] call life_fnc_nearestDoor;
if(_door == 0) exitWith {hint "Vous n'etes pas assez pres de la porte !"};
if((_house getVariable [format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "La porte est deja deverrouillé"};
life_action_inUse = true;
disableSerialization;
_title = "Cassage de la porte en cours...";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0092;
[[2,format["%1 votre maison a été fracturée par la police !",(_house GVAR "house_owner") select 1]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Annuler action","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_house animate [format["door_%1_rot",_door],1];
_house SVAR[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.