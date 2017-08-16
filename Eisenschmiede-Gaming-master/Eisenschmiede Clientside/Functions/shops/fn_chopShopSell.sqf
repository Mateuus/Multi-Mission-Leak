#include "..\script_macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2","_aborted","_cP","_playernear"];

_playernear = (nearestObjects[player, ["Man"], 20]) arrayIntersect playableUnits;

if(count _playernear > 1) exitWith {hint "Ein Spieler ist in deiner Nähe!"};

if(!DarfAutoVerkaufen) exitWith {hint localize "STR_NOTF_Sell_Vehicle_Stop";};
if(DarfAutoVerkaufen) then {
	DarfAutoVerkaufen = false;
	[] spawn {
		sleep 60;
		DarfAutoVerkaufen = true;
	};
};

if(!(isNull objectParent player)) exitWith { hint "Bitte steige zum Verkauf aus dem Fahrzeug aus"; };

_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos ES_chopShop,["Car","Truck","Air","Ship"],25];
_vehicle = SEL(_nearVehicles,_vehicle);
if(isNull _vehicle) exitWith { hint "Es ist ein Fehler aufgetreten"; };
closeDialog 0;
ES_action_inUse = true;
disableSerialization;
_title = "Warte auf Verkaufsbestätigung...";
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_aborted = false;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["ES_fnc_animSync",0];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.01;
	if(isNull _ui) then {
		5 cutRsc ["ES_progress","PLAIN"];
		_ui = uiNamespace getVariable "ES_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.00025;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(ES_istazed) exitWith { _aborted= true; hint"Der Verkaufsvorgang wurde abgebrochen, da du getazert wurdest";};
	if(!alive player) exitWith {_aborted= true; hint"Der Verkaufsvorgang wurde auf Grund deines Todes abgebrochen";};
	if(!(isNull objectParent player)) exitWith { _aborted= true; hint"Der Verkaufsvorgang wurde abgebrochen, da du in ein Fahrzeug gestiegen bist";};
	if(ES_interrupted) exitWith { _aborted= true; hint"Der Verkaufsvorgang wurde abgebrochen, da du dich bewegt hast";};
};

if(_aborted) exitWith { ES_action_inUse= false; 5 cutText ["","PLAIN"]; player playActionNow "stop";};
5 cutText ["","PLAIN"];
player playActionNow "stop";

ES_action_inUse = true;
_price2 = ES_cash + _price;
[player,_vehicle,_price,_price2] remoteExec ["ES_fnc_chopShopSell",2];