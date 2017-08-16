#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_gangName","_markername","_gangname2","_catputeTime"];
_group = illegal_leader_flag_1 getVariable ["gangOwner",grpNull];
_catputeTime = (8 * 60); // 8 Minuten

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["Du musst erst eine Gang gr�nden bevor du es einnehmen kannst!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText["Deine Gang kontroliert die illegalen Haendler schon!","PLAIN"]};

_checkFlag1 = (illegal_leader_flag_1 getVariable ["inCapture",FALSE]);
_checkFlag2 = ((illegal_leader_flag_1 getVariable["captureTime",0]) <= serverTime);

if(_checkFlag1 && !_checkFlag2) exitWith {hint"Es kann nur einer einnehmen!";};

if(!isNull _group) then 
{
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["Der Bereich wird kontroliert von %1<br/>Bist du sicher das du es �bernehmen willst?",_gangName],
		"Bereich ist schon unter Kontrolle.",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;
	
	_catputeTime = (10 * 60); // 10 Minuten
	format["%1 und seine Gang: %2 versuchen die Kontrolle ueber die illegalen Haendler zu uebernehmen",getMyName,(group player) getVariable "gang_name"] remoteExec ["hint", civilian];
} 
else 
{
	_catputeTime = (5 * 60); // 5 Minuten
};

if(!isNil "_action" && {!_action}) exitWith {titleText["�bernahme abgebrochen","PLAIN"];};
format["%1 und seine Gang: %2 versuchen die Kontrolle ueber die illegalen Haendler zu uebernehmen",getMyName,(group player) getVariable "gang_name"] remoteExec ["hint", civilian];
DWEV_action_inUse = true;
illegal_leader_flag_1 setVariable["captureTime",(serverTime + _catputeTime),true];

//Setup the progress bar
disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText "Nehme Bereich ein...";
_progressBar progressSetPosition 0.00;

_hundredpercent = _catputeTime;
_onepercent = (_hundredpercent / 100);

while {true} do
{
	sleep 1;
			
	if(isNull _ui) then
	{
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_timeDiff = ((illegal_leader_flag_1 getVariable["captureTime",0]) - serverTime);
	_currentPercent = ((100 / _hundredpercent) * (_hundredpercent - _timeDiff));
	_cp = (_currentPercent / 100);
	
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Nehme Bereich ein %1", [_timeDiff] call DWEV_fnc_formatTime];
	illegal_leader_flag_1 setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {illegal_leader_flag_1 setVariable["inCapture",false,true];};
	if(DWEV_istazed) exitWith {illegal_leader_flag_1 setVariable["inCapture",false,true];}; //Tazed
	if(DWEV_isdowned) exitWith {illegal_leader_flag_1 setVariable["inCapture",false,true];}; //gummi
	if ((player distance illegal_leader_flag_1) > 10) exitWith {illegal_leader_flag_1 setVariable["inCapture",false,true];}; //Zu Weit entfernt
	if ((vehicle player) != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;illegal_leader_flag_1 setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;illegal_leader_flag_1 setVariable["inCapture",false,true];};
if ((player distance illegal_leader_flag_1) > 10) exitWith {DWEV_action_inUse = false;illegal_leader_flag_1 setVariable["inCapture",false,true]; titleText["Du hast dich zu weit von der Flagge entfernt!","PLAIN"];};
if ((vehicle player) != player) exitWith {DWEV_action_inUse = false;illegal_leader_flag_1 setVariable["inCapture",false,true]; titleText["Du musst ausserhalb des Fahzeugs bleiben um die Flagge einzunehmen!","PLAIN"];};
DWEV_action_inUse = false;

titleText["Bereich wurde eingenommen.","PLAIN"];
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
illegal_leader_flag_1 setFlagTexture _flagTexture;
[[0,1],format["%1 und seine Gang: %2 - haben die Kontrolle ueber die Illegalen Haendler uebernommen.",getMyName,(group player) getVariable "gang_name" ]] remoteExec ["DWEV_fnc_broadcast", civilian];

_markername = str(getPos illegal_leader_flag_1);
_gangname2 = formatText["Eingenommen von: %1",(group player) getVariable "gang_name"];
if (getMarkerColor _markername == "") then
{
	gang_owner_marker = createMarker [_markername, position player];
	_markername setMarkerShape "ICON";
	_markername setMarkerType "hd_warning";
	_markername setMarkerColor "ColorRed";
	_markername setMarkerText str(_gangname2);
	gang_owner_marker = "";
}
else
{
	_markername setMarkerText str(_gangname2);
};

illegal_leader_flag_1 setVariable["inCapture",false,true];
illegal_leader_flag_1 setVariable["gangOwner",grpPlayer,true];