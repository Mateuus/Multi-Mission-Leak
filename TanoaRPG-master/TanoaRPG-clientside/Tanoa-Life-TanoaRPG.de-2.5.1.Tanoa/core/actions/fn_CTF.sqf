#include <macro.h>
/*
	by A4P
*/
private["_group","_CTF","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2"];
_CTF = (nearestObjects[getPosATL player,["Land_WoodenBox_F"],25]) select 0;
_group = _CTF getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["Du musst erst einer Gang angehören, um die Flagge einzunehmen!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText["Diese Flagge wurde bereits von deiner Gruppe eingenommen!","PLAIN"]};
if((_CTF getVariable ["inCapture",FALSE])) exitWith {hint "Nur eine Person kann die Flagge einnehmen!";};

if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["Die Flagge wird durch %1 kontrolliert.&lt;&gt;&lt;&gt;Bist du sicher, dass du dessen Flagge übernehmen möchtest?",_gangName],
		localize "Flagge ist derzeit unter Kontrolle...",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText["Einnehmen abgebrochen!","PLAIN"];};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Flagge einnehmen";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
	{
		if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
			player action ["SwitchWeapon", player, player, 100];
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			player playActionNow "stop";
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			player playActionNow "stop";
			player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_CTF setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_CTF setVariable["inCapture",false,true];};
	if(life_istazed) exitWith {_CTF setVariable["inCapture",false,true];}; //Tazed
	if(life_interrupted) exitWith {_CTF setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_CTF setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_CTF setVariable["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Einnehmen abgebrochen!","PLAIN"]; life_action_inUse = false;_CTF setVariable["inCapture",false,true];};
life_action_inUse = false;

titleText["Flagge ist eingenommen!","PLAIN"];
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
[[0,1],format["%1 und seine Gang: %2 - haben die Kontrolle über eine Flagge übernommen!",name player,(group player) getVariable "gang_name" ]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];

// CREATE MARKER AT MAP BY Pictureclass

_markername = str(getPos _CTF);
_gangname2 = formatText["Eingenommen von: %1",(group player) getVariable "gang_name"];
if (getMarkerColor _markername == "") then
{
	gang_owner_marker = createMarker [_markername, position player];
	_markername setMarkerShape "ICON";
	_markername setMarkerType "hd_warning";
	_markername setMarkerColor "ColorBlue";
	_markername setMarkerText str(_gangname2);
	gang_owner_marker = "";
}
else
{
	_markername setMarkerText str(_gangname2);
};

_CTF setVariable["inCapture",false,true];
_CTF setVariable["gangOwner",grpPlayer,true];