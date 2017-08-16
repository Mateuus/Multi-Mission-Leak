/*
	File: fn_jailbreak.sqf
	Author: Herman "Mordin" Othelius
	modified by: Rafi Quak | David Alvarez for PlayGermany
	Description: Should pop up a progressbar :)
*/
private["_cpRate","_title","_progressBar","_titleText","_cp","_ui","_object","_publicMarker"];
if(PG_jailHackInProgress) exitWith {hint "Es wird bereits ein Gefangener befreit";};
if({side _x == west} count playableUnits < 6) exitWith {hint "Es sind zu wenige Polizisten im Dienst, um das Gefängiss zu hacken"};
PG_jailHackInProgress = true;
publicVariable "PG_jailHackInProgress";
_object = _this Select 0;
//Setup the progress bar
_cpRate = 0.000541;
disableSerialization;
_title = "Gefängnissoftware hacken";
life_action_inUse = true;
[[1,"Die Infrasturktur des Staatsgefängnisses wird angegriffen!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
//Setup the progress bar
disableSerialization;
_title = "Gefängnissoftware hacken";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0;
_i = 0;
_publicMarker = createMarker ["Ausbruch", (position player)];
_publicMarker setMarkerColor "ColorRed";
_publicMarker setMarkerText "!Achtung! >>> Gefängnisausbruch <<< !Achtung!";
_publicMarker setMarkerType "mil_warning";
Hint "Hack der Gefängnissoftware läuft! Vorraussichtliche Dauer: 8 Minuten";
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1" && _i mod 3 == 0) then {
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_i = _i + 1;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};
deleteMarker _publicMarker;
PG_jailHackInProgress = false;
publicVariable "PG_jailHackInProgress";
[[getPlayerUID player,profileName,"32"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false; deleteMarker _publicMarker;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false; deleteMarker _publicMarker;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false; deleteMarker _publicMarker;};
life_action_inUse = false;

if ((_object distance (getMarkerPos "jail_marker")) < 50) then{
	_object setVariable ["breakout",true,true];
	//_object setPos (getMarkerPos "jail_breakout");
	hint "Gefängnis erfolgreich gehackt!";
} else {
	hint "Spieler befindet sich nicht mehr im Gefängnis";
};
deleteMarker _publicMarker;
