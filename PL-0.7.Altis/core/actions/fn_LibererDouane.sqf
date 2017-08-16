#include "..\..\script_macros.hpp"
/*
Fichier: LibererDouane.sqf
Auteur: Skrow
Description: Apprend à DEV au lieu de prendre mon script
*/

private["_drapeau","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_drapeau = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_interrupted = false;

if(isNull _drapeau) exitWith {};
if(playerSide != west) exitWith {hint "Tu ne peux pas liberer la douane !";};

if((nearestObject [[15729.1,17432.6,0],"Flag_Red_F"]) == _drapeau) then {
	//Début bar de progression
	life_action_inUse = true;
	_upp = format[localize "STR_NOTF_Douane"];

	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = GVAR_UINS "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	while{true} do {
		if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
			player playActionNow "stop";
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			player playActionNow "stop";
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		};

		sleep 0.195; // 3 fois 6.5 secondes = 19,5secondes
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
	//FIN bar de progression

	[[0,1,2],"STR_ISTR_Bolt_Douane2",true,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	deleteMarker "MarkerDouane";
	deleteMarker "MarkerDouaneText";
	life_actionLimite = 0; //On débloque la banque et la douane.
};