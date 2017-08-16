#include "..\..\script_macros.hpp"
/*
Fichier: captureDouane.sqf
Auteur: Skrow
Description: Apprend à DEV au lieu de prendre mon script
*/

private["_drapeau","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_drapeau = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_interrupted = false;

if(life_actionLimite == 1) exitWith {hint localize "STR_Action_Douane_Nonok";};; //Avant tout, on vérifie la banque.

if(isNull _drapeau) exitWith {};
if(playerSide != civilian) exitWith {hint "Tu peux pas capturer la douane !";};
if(currentWeapon player == "") exitWith{hint"Vous devez être armé avant de capturer la douane !";};
if(isNil {(group player) getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
//if((_drapeau GVAR ["CaptureD",FALSE])) exitWith {hint localize "STR_D_Captured";};
if(life_douane == 1) exitWith {hint "La douane est déja capturer";};
if({side _x == west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min"))) exitWith {hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"cops_online_min"))]}; // Pas assez de gendarme

if((nearestObject [[15729.1,17432.6,0],"Flag_Red_F"]) == _drapeau && life_douane == 0) then {
	life_douane = 1;
	life_actionLimite = 1; //On bloque la banque.
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
		//_drapeau SVAR ["CaptureD",true,true];
		if(_cP >= 1 || !alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_istazed) exitWith {}; //Tazed
		if(life_isknocked) exitWith {}; //Knocked
		if(life_interrupted) exitWith {};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];
	life_action_inUse = false;};
	//FIN bar de progression

	//Marker
	_Pos = getpos _drapeau;
	_marker = createMarker ["MarkerDouane", _Pos];
	"MarkerDouane" setMarkerColor "ColorBlack";
	"MarkerDouane" setMarkerType "Empty";
	"MarkerDouane" setMarkerShape "ELLIPSE";
	"MarkerDouane" setMarkerSize [500,500];
	_markerTexts = createMarker ["MarkerDouaneText", _Pos];
	"MarkerDouaneText" setMarkerColor "ColorWhite";
	"MarkerDouaneText" setMarkerText format ["%1 ont capturé la douane !",(group player) getVariable "gang_name"];
	"MarkerDouaneText" setMarkerType "mil_warning";
	[[0,1,2],"STR_ISTR_Bolt_Douane",true,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	[] spawn life_fnc_timerDouane;
		//_drapeau SVAR ["CaptureD",false,true];
	sleep (30 * 60);
	deleteMarker "MarkerDouane";
	deleteMarker "MarkerDouaneText";
	life_actionLimite = 0; //On débloque la banque et la douane.
		//_drapeau SVAR ["CaptureD",true,false];
};