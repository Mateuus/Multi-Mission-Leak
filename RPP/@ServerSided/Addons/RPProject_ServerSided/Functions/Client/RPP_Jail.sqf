/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Jail.sqf

Description:
Jail System
*/
["RPP_Police_JailMenu", {
	private ["_target"];
	_target = cursorTarget;
	if (!(_target isKindOf "man")) exitWith {
		systemChat "Not a unit.";
	};
	if (_target getVariable "RPP_Revive") exitWith {
		systemChat "He is waiting for revive.";
	};
	if (!isplayer _target) exitWith {
		systemChat "Not a player.";
	};
	if (player distance _target >= 4) exitWith {
		systemChat "To far away.";
	};
	if (_target getVariable "RPP_Injail") then {
		[[player], "RPP_Police_GetJailTime", _target] call BIS_FNC_MP;
	} else {
		_msg = "This player don't have any jail time.";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
	createDialog "RPP_JailMenu";
	buttonSetAction [1600, "[] call RPP_Police_Jail;"];
	buttonSetAction [1601, "[] call RPP_Police_JailRevoke;"];
}] call RPP_Function;
publicVariable "RPP_Police_JailMenu";

["RPP_Police_GetJailTime", {
	private ["_cop","_jh","_jm","_js"];
	_cop = _this select 0;
	_jh = RPP_JailTime_H;
	_jm = RPP_JailTime_M;
	_js = RPP_JailTime_S;

	[[player,_jh,_jm,_js], "RPP_Police_JailTime_Return",_cop] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_GetJailTime";

["RPP_Police_JailTime_Return", {
	_msg = format ["Jail Time: Hour(s) %1: Minute(s) %2: Second(s) %3",_this select 1,_this select 2,_this select 3];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_JailTime_Return";

["RPP_Police_Jail", {
	private ["_target","_h","_m","_s","_hText","_mText","_sText"];
	_target = cursorTarget;
	_hText = ctrlText 1400;
	_mText = ctrlText 1401;
	_sText = ctrlText 1402;
	_h = round(parseNumber(ctrlText 1400));
	_m = round(parseNumber(ctrlText 1401));
	_s = round(parseNumber(ctrlText 1402));
	if (_mText isEqualTo "") exitWith {
		_msg = "You must at least arrest him for 1 min.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player,_h,_m,_s], "RPP_Police_JailStart",_target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_Jail";

["RPP_Police_JailStart", {
	private ["_cop"];
	if (player getVariable "RPP_Injail") exitWith {
		_msg = "You can't be arrest 2 times :)";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_cop = _this select 0;
	RPP_JailTime_H = _this select 1;
	RPP_JailTime_M = _this select 2;
	RPP_JailTime_S = _this select 3;
	playSound "RPP_Jail_Sound";
	player setVariable ["RPP_InJail",true,true];
	player setVariable ["RPP_JailEscape",false,true];
	Jail_Marker = createMarkerLocal ["Jail_Marker", getpos player];
	RPP_Jail_Pos = getPosATL player;
	RPP_Jail_Dir = getDir player;
	_msg = format ["%1 Arrested you for: %2:%3:%4",name _cop, RPP_JailTime_H, RPP_JailTime_M, RPP_JailTime_S];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	[] call RPP_MySQL_Client_SendStats;
	while {player getVariable "RPP_InJail"} do {
		titleText [format ["Jail Timer: Hour(s) %1: Minute(s) %2: Second(s) %3",RPP_JailTime_H,RPP_JailTime_M,RPP_JailTime_S], "PLAIN"];
		sleep 1;
		if (RPP_JailTime_S <= 0 && RPP_JailTime_M <= 0 && RPP_JailTime_H <= 0) exitWith {
			_msg = "Your jail time is now over.";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;
			player setVariable ["RPP_InJail",false,true];
			deleteMarkerLocal Jail_Marker;
			[] call RPP_MySQL_Client_SendStats;
		};
		if (RPP_JailTime_S <= 0 && RPP_JailTime_M <= 0 && RPP_JailTime_H >= 1) then {
			RPP_JailTime_H = RPP_JailTime_H - 1;
			RPP_JailTime_M = 59;
			RPP_JailTime_S = 59;
		};
		if (RPP_JailTime_S <= 0 && RPP_JailTime_M >= 1) then {
			RPP_JailTime_M = RPP_JailTime_M - 1;
			RPP_JailTime_S = 59;
		};
		if (player distance (getMarkerPos "Jail_Marker") > 200) exitWith {
			_msg = "You escaped the prison.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			player setVariable ["RPP_JailEscape",true,true];
			deleteMarkerLocal Jail_Marker;
			[[], "RPP_Police_JailAlarmStart", true,true] call BIS_FNC_MP;
			[] call RPP_MySQL_Client_SendStats;
		};
		RPP_JailTime_S = RPP_JailTime_S - 1;
		RPP_Jail_Pos = getPosATL player;
		RPP_Jail_Dir = getDir player;
	};
}] call RPP_Function;
publicVariable "RPP_Police_JailStart";

["RPP_Police_JailAlarmStart", {
	JailAlarm say3d "RPP_Jail_Alarm";
	systemChat "Someone escaped from Jail";
}] call RPP_Function;
publicVariable "RPP_Police_JailAlarmStart";

["RPP_Police_JailRevoke", {
	_target = cursorTarget;
	_h = round(parseNumber(ctrlText 1400));
	_m = round(parseNumber(ctrlText 1401));
	_s = round(parseNumber(ctrlText 1402));

	[[player,_h,_m,_s], "RPP_Police_JailRevoke_Do",_target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_JailRevoke";

["RPP_Police_JailRevoke_Do", {
	private ["_cop","_H","_m","_s"];
	_cop = _this select 0;
	_h = _this select 1;
	_m = _this select 2;
	_s = _this select 3;

	if (_h > JailTime_H) exitWith {
		hint format ["%1 tried to revoke more then what your jail time is.",name _cop]; // Might need changing
	};
	if (_m > JailTime_M) exitWith {
		hint format ["%1 tried to revoke more then what your jail time is.",name _cop];
	};
	if (_s > JailTime_S) exitWith {
		hint format ["%1 tried to revoke more then what your jail time is.",name _cop];
	};

	RPP_JailTime_H = RPP_JailTime_H - _h;
	RPP_JailTime_M = RPP_JailTime_M - _m;
	RPP_JailTime_S = RPP_JailTime_S - _s;
	systemChat format ["%1 Revoked your jail time by: %2:%3:%4",name _cop,_h,_m,_s];
}] call RPP_Function;
publicVariable "RPP_Police_JailRevoke_Do";


["RPP_Police_JailStart_Backinjail", {
	[_this select 0, _this select 1, _this select 2] spawn {
	private ["_cop"];
	playSound "RPP_Jail_Sound";
	player setVariable ["RPP_InJail",true,true];
	player setVariable ["RPP_JailEscape",false,true];

	RPP_JailTime_S = _this select 0;
	RPP_JailTime_M = _this select 1;
	RPP_JailTime_H = _this select 2;

	Jail_Marker = createMarkerLocal ["Jail_Marker", getpos player];
	RPP_Jail_Pos = getPosATL player;
	RPP_Jail_Dir = getDir player;
	[] call RPP_MySQL_Client_SendStats;
	while {player getVariable "RPP_InJail"} do {
		titleText [format ["Jail Timer: Hour(s) %1: Minute(s) %2: Second(s) %3",RPP_JailTime_H,RPP_JailTime_M,RPP_JailTime_S], "PLAIN"];
		sleep 1;
		if (RPP_JailTime_S <= 0 && RPP_JailTime_M <= 0 && RPP_JailTime_H <= 0) exitWith {
			_msg = "Your jail time is now over.";
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;
			player setVariable ["RPP_InJail",false,true];
			deleteMarkerLocal Jail_Marker;
			[] call RPP_MySQL_Client_SendStats;
		};
		if (RPP_JailTime_S <= 0 && RPP_JailTime_M <= 0 && RPP_JailTime_H >= 1) then {
			RPP_JailTime_H = RPP_JailTime_H - 1;
			RPP_JailTime_M = 59;
			RPP_JailTime_S = 59;
		};
		if (RPP_JailTime_S <= 0 && RPP_JailTime_M >= 1) then {
			RPP_JailTime_M = RPP_JailTime_M - 1;
			RPP_JailTime_S = 59;
		};
		if (player distance (getMarkerPos "Jail_Marker") > 200) exitWith {
			_msg = "You escaped the Prison.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			player setVariable ["RPP_JailEscape",true,true];
			deleteMarkerLocal Jail_Marker;
			[[], "RPP_Police_JailAlarmStart", true,true] call BIS_FNC_MP;
			[] call RPP_MySQL_Client_SendStats;
		};
		RPP_JailTime_S = RPP_JailTime_S - 1;
		RPP_Jail_Pos = getPosATL player;
		RPP_Jail_Dir = getDir player;
	};
};
}] call RPP_Function;
publicVariable "RPP_Police_JailStart";