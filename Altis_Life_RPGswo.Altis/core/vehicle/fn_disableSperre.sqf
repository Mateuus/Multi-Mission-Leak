/*
	File: fn_disableSperre.sqf
	Author: MarkusSr1984
	
	Description:
	Entschärft eine Montierte Wegfahrsperre
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
if (player != vehicle player) then 
{
	_curTarget = vehicle player;	
}
else
{
	_curTarget = cursorTarget;
};

_distance = 10;

if(DWEV_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {};
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in DWEV_vehicles) exitWith {hint "Du kannst kein Fahrzeug knacken das in deinem Besitz ist!"};
if(_curTarget getVariable["protected",false]) exitWith {hint "Dieses Fahrzeug ist Serverseitig geschützt und kann nicht aufgebrochen werden!"};
if(!(_curTarget getVariable["sperre",false])) exitWith {hint "Dieses Fahrzeug ist nicht mit einer Wegfahrsperre ausgestattet"};
if(!_isVehicle) exitWith {};

if(call DWEV_fnc_isSafeZone) exitWith {hint "In einer absoluten Safezone können keine Hacker tablets verwendet werden!!!"};

DWEV_interrupted = false;

DWEV_action_inUse = true; //Lock out other actions

// Alaram Anlage
if (_isVehicle && (_curTarget getVariable["alarm",false]) && !(_curTarget getVariable["alarm_in_use",false])) then
{
	[_curTarget] spawn
	{
		_vehicle = _this select 0;
		_vehicle setVariable["alarm_in_use",true,true];
		[_vehicle] remoteExec ["DWEV_fnc_carAlarm",-2];
		sleep 120;
		_vehicle setVariable["alarm_in_use",false,true];	
	};
};


//Setup the progress bar
disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText "Versuche die Wegfahrsperre ausser kraft zu setzen";
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
			sleep 1.8;
	
	if(isNull _ui) then {
			5 cutRsc ["DWEV_progress","PLAIN"];
			_ui = uiNamespace getVariable "DWEV_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Versuche die Wegfahrsperre ausser kraft zu setzen"];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText["Du hast dich zuweit entfernt.","PLAIN"]; DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen.","PLAIN"]; DWEV_action_inUse = false;};
if(!([false,"fahrsperre",1] call DWEV_fnc_handlelnv)) exitWith {DWEV_action_inUse = false;};

DWEV_action_inUse = false;

if(_isVehicle && _curTarget getVariable["sperre",false]) then 
{
	_curTarget setVariable["sperre",false,true];
	_curTarget setVariable["wegfahrsperre",false,true];
	hint "Die Wegfahrsperre wurde erfolgreich deaktiert";
	if!(typeOf (_curTarget) in ["B_Truck_01_covered_F"]) then
	{
		_curTarget enableRopeAttach true;
	};
}
else
{
	hint "Dieses Fahrzeug ist nicht mit einer Wegfahrsperre ausgestattet";
};