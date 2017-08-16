#include <macro.h>
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = cursorTarget;
if(isNull _target) exitWith {}; 
if (vehicle player != player) exitWith { hint "Vous ne pouvez pas depuis votre vehicule !" };
_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint "Quelqu'un est deja en train de reanimer cette personne";};
if(player distance _target > 5) exitWith {};
_targetName = _target getVariable["name","Unknown"];
_title = format["Reanimation %1",_targetName];
life_action_inUse = true;
_target SVAR["Reviving",player,TRUE];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.15;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint "Quelqu'un reanime deja cette personne"};
_target SVAR["Reviving",NIL,TRUE];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint "Cette personne est soit reapparu ou a deja ete secourue."};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText["Vous etes trop loin de la cible.","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulee","PLAIN"]; life_action_inUse = false;};
compte_banque = compte_banque + 2000;
life_action_inUse = false;
_target SVAR["Revive",TRUE,TRUE];
[[profileName],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;
titleText[format["Vous avez secourue %1 et vous avez recu 2000€ pour vos services.",_targetName],"PLAIN"];
uiSleep 0.6;
player reveal _target;