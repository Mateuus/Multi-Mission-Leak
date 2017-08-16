/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_curTarget = cursorTarget;
eM_interrupted = false;
if(eM_action_inUse) exitWith {};
if(!(( { player distance (getMarkerPos _x) < 50 } count ["park_1","markt_1","markt_2"] ) < 1)) exitWith {hint "Du bist in einer Savezone!!"};



if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (typeof _curTarget in _boxType) OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in EMonkeys_vehic164) exitWith {hint "Du hast für dieses Fahrzeug bereits einen Schlüssel."};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && (!(_curTarget getVariable["restrained",false]) && !(_curTarget getVariable["restrainedciv",false]))) exitWith {};
_title = format["Knacke %1",if(!_isVehicle) then {"Handschellen"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
eM_action_inUse = true; //Lock out other actions
		if(currentWeapon player != "") then {
			EMonkeys_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		};
//Setup the progress bar
disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNamespace getVariable "EMonkeys_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				uisleep 0.8;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
	uisleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["EMonkeys_progress","PLAIN"];
		_ui = uiNamespace getVariable "EMonkeys_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR ((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
	if(eM_istazed) exitWith {}; //Tazed
	if(eM_interrupted) exitWith {};
	if((player getVariable["restrained",false]) && (player getVariable["restrainedciv",false])) exitWith {};

	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
		if(!isNil "EMonkeys_curWep_h" && {(EMonkeys_curWep_h != "")}) then {
			if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon EMonkeys_curWep_h;
			};
		};
if(((!alive player) || (player getVariable["onkill",FALSE])) OR eM_istazed) exitWith {eM_action_inUse = false;};
if((player getVariable["restrained",false]) && (player getVariable["restrainedciv",false]) ) exitWith {eM_action_inUse = false;};

if(!isNil "_badDistance") exitWith {titleText["Das Fahrzeug ist zu weit entfernt!","PLAIN"]; eM_action_inUse = false;};
if(eM_interrupted) exitWith {eM_interrupted = false; titleText["Action cancelled","PLAIN"]; eM_action_inUse = false;};
if(!([false,"lockpick",1] call EMonkeys_fnc_handleInv)) exitWith {eM_action_inUse = false;};

eM_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
	_curTarget setVariable["restrainedciv",false,true];
	_curTarget setVariable["Escortingciv",false,true];
	_curTarget setVariable["transportingciv",false,true];

} else {
	_dice = random(100);
	if(_dice < 30 || side player == independent) then {
		titleText["Du hast das Fahrzeug geknackt und kurzgeschlossen!","PLAIN"];
		//EMonkeys_vehic164 pushBack _curTarget;
		_curTarget setVariable ["lock_trunk",false,true];
		[[_curTarget,0], "EMonkeys_fnc_lockVehicle",_curTarget,false] call EMonkeys_fnc_mp;
		_owners = _curTarget getVariable "vehicle_info_owners";
		_owners pushBack [getPlayerUID player,profileName];
		_curTarget setVariable ["vehicle_info_owners",_owners,true];
		[[getPlayerUID player,profileName,"487"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
	} else {
		[[_curTarget,"alarmanlage"],"EMonkeys_fnc_say3D",nil,true] call EMonkeys_fnc_mp;
		uisleep 1;
		titleText["Der Dietrich ist abgebrochen.","PLAIN"];
	};
};