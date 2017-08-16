#include "..\..\script_macros.hpp"
/*
	File: fn_captureHideout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout GVAR ["gangOwner",grpNull];

if(isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[ "Du musst erst in einer Gang sein, um diesen Bereich einnehmen zu können!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText[ "Deine Gang hat bereits die Kontrolle über dieses Versteck!","PLAIN"]};
if((_hideout GVAR ["inCapture",FALSE])) exitWith {hint  "Nur eine Person kann das Versteck einnehmen!";};
if(!isNull _group) then {
	_gangName = _group GVAR ["gang_name",""];
	_action = [
		format[ "Das Versteck wird durch %1 kontrolliert.<br/><br/>Bist du sicher, dass du ihr Gang Gebiet übernehmen möchtest?",_gangName],
		 "Versteck ist derzeit unter Kontrolle...",
		 "Ja",
		 "Nein"
	] call BIS_fnc_guiMessage;

	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText[ "Einnehmen abgebrochen","PLAIN"];};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title =  "Versteck einnehmen";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_hideout SVAR ["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_hideout SVAR ["inCapture",false,true];};
	if(life_istazed) exitWith {_hideout SVAR ["inCapture",false,true];}; //Tazed
	if(life_isknocked) exitWith {_hideout SVAR ["inCapture",false,true];}; //Knocked
	if(life_interrupted) exitWith {_hideout SVAR ["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;_hideout SVAR ["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout SVAR ["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText[ "Einnehmen abgebrochen","PLAIN"]; life_action_inUse = false;_hideout SVAR ["inCapture",false,true];};
life_action_inUse = false;

titleText["Hideout has been captured.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
[[0,1],"%1 und seine Gang: 2% - haben die Kontrolle über ein lokales Versteck übernommen!",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
_hideout SVAR ["inCapture",false,true];
_hideout SVAR ["gangOwner",grpPlayer,true];
