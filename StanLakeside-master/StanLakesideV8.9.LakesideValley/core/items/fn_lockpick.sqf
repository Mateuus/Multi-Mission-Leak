/*
	File: fn_lockpick.sqf
	
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {[localize "STR_ISTR_Lock_AlreadyHave", false] spawn domsg;};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
	_cP = 0;
	if(karma_level > 0) then {
		_cp = karma_level / 100;
	};
player setVariable ["lockpicking",true,true];
//make this play max once per xx time or something to prevent spam

_towtrucks = nearestObjects [player, ["A3L_Towtruck"], 11];

if(count _towtrucks == 0) then { 
	if(_isVehicle) then {
			playSound3D ["cg_sndimg\sounds\caralarm.ogg", player, false, getPosASL player, 1, 1, 155];
	};
};

while {true} do
{
	if(animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
		
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR deadPlayer) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
player setVariable ["lockpicking", nil, true];
if(deadPlayer OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {[localize "STR_ISTR_Lock_TooFar", false] spawn domsg; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", false] spawn domsg; life_action_inUse = false;};
//if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained", nil, true];
	_curTarget setVariable["Escorting", nil, true];
	_curTarget setVariable["transporting", nil, true];
	player setVariable ["lockpicking", nil ,true];
} else {
	_dice = random(100);
	if(_dice < 21) then {
		[_curTarget,0] remoteExecCall ["life_fnc_lockVehicle",_curTarget];
		["Pomyslnie udalo Ci sie otworzyc pojazd wytrychem!",20,"green"] spawn domsg;
		playSound3D ["cg_sndimg\sounds\caralarm.ogg", player, false, getPosASL player, 1, 1.2, 355];
		player setVariable ["lockpicking", nil, true];
		if(count _towtrucks == 0) then { 
		_reason = "487";
		if(side player == civilian || side player == east) then {
			[player,player,_reason] spawn life_fnc_createEvidence;
		};
		};
	} else {
		//[0,format[localize "STR_ISTR_Lock_FailedNOTF",profileName]] remoteExecCall ["life_fnc_broadcast", west];
		["Nie udalo Ci sie otworzyc pojazdu wytrychem!",20,"red"] spawn domsg;
		player setVariable ["lockpicking", nil, true];
	};
};