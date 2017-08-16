#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_gangName","_markername","_gangname2"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["Du musst erst eine Gang gr�nden bevor du es einnehmen kannst!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText["Deine Gang kontroliert dieses Versteck schon!","PLAIN"]};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint"Es kann nur einer einnehmen!";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["Das Versteck wird kontroliert von %1<br/>Bist du sicher das du es �bernehmen willst?",_gangName],
		"Versteck ist schon unter Kontrolle.",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
	format["%1 und seine Gang: %2 versuchen ein Gangversteck zurueck zuerobern.", getMyName,getMyGang] remoteExec ["hint", civilian];
} 
else 
{
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText["�bernahme abgebrochen","PLAIN"];};
DWEV_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Versteck einnehmen...";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100]; //EDIT
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Dur�e action 6.5 secondes
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
			
	if(isNull _ui) then {
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_hideout setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
	if(DWEV_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
	if(DWEV_isdowned) exitWith {_hideout setVariable["inCapture",false,true];}; //gummi
	if(DWEV_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; DWEV_action_inUse = false;_hideout setVariable["inCapture",false,true];};
DWEV_action_inUse = false;

titleText["Versteck wurde eingenommen.","PLAIN"];
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
[[0,1],format["%1 und seine Gang: %2 - haben die Kontrolle ueber ein Gangversteck uebernommen.",getMyName,getMyGang]] remoteExec ["DWEV_fnc_broadcast", civilian];

_markername = str(getPos _hideout);
_gangname2 = formatText["Eingenommen von: %1",getMyGang];
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

_hideout setVariable["inCapture",false,true];
_hideout setVariable["gangOwner",grpPlayer,true];
