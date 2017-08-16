#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_unit","_alarmSound"];
_building = param [0,ObjNull,[ObjNull]];
_unit = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_alarmSound = "alarm_bank";

if(isNull _building) exitWith {};
if((player distance (getMarkerPos "safezone") < 1350)) exitWith {hint "Tu peux pas braquer de maison en Zone Safe"};
if(!(_building isKindOf "House_F")) exitWith {hint "Vous ne regardez pas une porte."};
if((((nearestObject [[20963.186,19199.244,0.602],"Land_Dome_Small_F"]) == _building) || ((nearestObject [[20905.3,19206,0.00143433],"Land_Dome_Big_F"]) == _building))  && ({side _x == west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min")))) exitWith {hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"cops_online_min"))]};
if(life_banque == 1) exitWith {hint "La banque à déja été braquer !"};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

if((nearestObject [[20963.186,19199.244,0.602],"Land_Dome_Small_F"]) == _building || (nearestObject [[20905.3,19206,0.00143433],"Land_Dome_Big_F"]) == _building) then {
	[[_unit, _alarmSound, 300], "life_fnc_alarm_bank", true, false] call life_fnc_MP;
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["life_fnc_broadcast",WEST];
} else {
	_Pos = getPosWorld player;
	_marker = createMarker ["MarkerMaison", _Pos];
	"MarkerMaison" setMarkerColor "ColorRed";
	"MarkerMaison" setMarkerText "Attention, Braquage Maison !";
	"MarkerMaison" setMarkerType "mil_warning";
	[[1,2],"STR_ISTR_Bolt_AlertHouse",true,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};

_doors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _building), "numberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building GVAR [format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {deleteMarker "MarkerMaison"; hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Small_F": {_cpRate = 0.003;};
	default {_cpRate = 0.003;}
};

while {true} do
{
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
	if(_cP >= 1 || !alive player) exitWith {deleteMarker "MarkerMaison";};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; deleteMarker "MarkerMaison"; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;

if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};

_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building GVAR ["locked",false])) then {
	_building SVAR ["locked",false,true];
};
