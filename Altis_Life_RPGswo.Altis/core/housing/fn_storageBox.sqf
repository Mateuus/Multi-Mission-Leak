#include "..\..\macros.hpp"
/*
	Author: Division Wolf e.V.
	
	Description:
	Plaziere Lagerkisten in einem Haus
*/

private["_house","_uid","_cP","_cpRate","_title","_titleText","_itembig","_itemsmall","_ui","_containers","_houseCfg","_slots","_positions","_pos","_boxType","_progressBar","_action","_amount","_name"];
closeDialog 0;
_house = param [0,ObjNull,[ObjNull]];

if(!(_house in DWEV_vehicles)) exitWith {hint "Du musst in deinem Haus sein um die Lagerkiste zuplatzieren."};
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Für dieses Haus gibt es keinen Besitzer"};
_uid = (_house getVariable "house_owner") select 0;
if(_uid != getPlayerUid player) exitWith {hint "Du bist nicht der Hausbesitzer.";};
_containers = _house getVariable["containers",[]];
_houseCfg = [(typeOf _house)] call DWEV_fnc_houseConfig;
_boxType = "";
_itembig = ITEM_VALUE("storagebig");
_itemsmall = ITEM_VALUE("storagesmall");

if(_itembig > 0) then{_boxType = "storagebig";};
if(_itemsmall > 0) then{_boxType = "storagesmall";};
_name = M_CONFIG(getText,"VirtualItems",_boxType,"displayName");

if((_itembig > 0) && (_itemsmall > 0)) exitwith {hint "Du darfst nicht zwei verschiedene Lagerkisten bei dir Tragen."; DWEV_action_inUse = false;};
if((_itembig == 0) && (_itemsmall == 0)) exitwith {hint "Du hast keine Lagerkiste bei dir, du kannst sie dir bei der Waffenfabrik herstellen."; DWEV_action_inUse = false;};
DWEV_action_inUse = true;

if(count _houseCfg == 0) exitWith {DWEV_action_inUse = false;};
if(count _containers >= (_houseCfg select 1)) exitWith {hint "Du hast kein Platz für mehr Lagerkisten in deinem Haus."; DWEV_action_inUse = false;};

switch((count _containers)) do
{
	case 0: {_amount = 0;};
	case 1: {_amount = 50000 * (count _containers);};
	case 2: {_amount = 50000 * (count _containers);};
	case 3: {_amount = 50000 * (count _containers);};
};

_action = [
	format ["Aktuelle Lagerkiste: %1. Dein Haus wird um eine %2 aufgerüstet. Es werden %3 € für die Aufrüstung von deinem Bankkonto abgebucht. Fortsetzen?",
	(count _containers),
	_name,
	_amount call DWEV_fnc_numberText],
	"Lagerkiste aufrüsten?","Ja","Nein"
] call BIS_fnc_guiMessage;
	
if(!_action) exitWith {DWEV_action_inUse = false;};

_slots = _house getVariable ["slots",[]];
_positions = [_house] call DWEV_fnc_getBuildingPositions;
_pos = [0,0,0];
{
	_slots = _house getVariable ["slots",[]];
	if(!(_forEachIndex in _slots)) exitWith 
	{
		_slots pushBack _forEachIndex;
		_house setVariable["slots",_slots,true];
		_pos = _x;
		DWEV_action_inUse = false;
	};
} foreach _positions;
if(_pos isEqualTo [0,0,0]) exitWith {hint "Du hast kein Platz für mehr Lagerkisten in deinem Haus."; DWEV_action_inUse = false;};

//Setup the progress bar
disableSerialization;

_title = "Installiere die Lagerkiste...";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;
while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then
	{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.3;
	
	if(isNull _ui) then
	{
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
	};
	
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	
	if(_cP >= 1 OR !alive player) exitWith {DWEV_action_inUse = false;};
	if(DWEV_interrupted) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(player distance _house > 13) exitWith {DWEV_action_inUse = false;};	
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith
{
	DWEV_interrupted = false;
	titleText["Aktion abgebrochen","PLAIN"];
	DWEV_action_inUse = false;
};
if(player distance _house > 13) exitWith {DWEV_action_inUse = false;};
DWEV_action_inUse = false;

if(!([false,_boxType,1] call DWEV_fnc_handlelnv)) exitWith {hint "Du hast keine Lagerkiste bei dir, du kannst sie dir bei der Waffenfabrik herstellen.";};

switch (_boxType) do 
{
	case "storagesmall": 
	{
/*		_container = "Box_IND_Grenades_F" createVehicle [0,0,0];
		_container allowDamage false;
		_container setPosATL _pos;
		
		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[_container,_house,_uid,player] remoteExec ["DWF_fnc_insertHouseContainer",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
*/
		["Box_IND_Grenades_F",_house,_uid,player,_pos] remoteExec ["DWF_fnc_insertHouseContainer",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
	
	case "storagebig": 
	{
/*		_container = "B_supplyCrate_F" createVehicle [0,0,0];
		_container allowDamage false;
		_container setPosATL _pos;
		
		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[_container,_house,_uid,player] remoteExec ["DWF_fnc_insertHouseContainer",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
		*/
		["B_supplyCrate_F",_house,_uid,player,_pos] remoteExec ["DWF_fnc_insertHouseContainer",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};

};
dwf_atmcash = dwf_atmcash - _amount;
[1] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
hint "Neue Lagerkiste installiert.";