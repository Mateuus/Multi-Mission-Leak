#include "..\..\script_macros.hpp"
/*
    File: fn_captureHideout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_Pos","_grp"];
_value = [_this,3,"",[""]] call BIS_fnc_param;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_Barracks_01_camo_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if (playerside isEqualTo independent) exitwith {hint"You don't know what to do with this giantic object!";};
if (playerside isequalto civilian) then {

if (isNil {group player getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
if (_group isequalto group player) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if ((_hideout getVariable ["inCapture",false])) exitWith {hint localize "STR_GNOTF_onePersonAtATime";};
if (!isNull _group) then {
    _gangName = _group getVariable ["gang_name",""];
    _action = [
        format[localize "STR_GNOTF_AlreadyControlled",_gangName],
        localize "STR_GNOTF_CurrentCapture",
        localize "STR_Global_Yes",
        localize "STR_Global_No"
    ] call BIS_fnc_guiMessage;

    _cpRate = 0.0045;
} else {
    _cpRate = 0.0075;
};

if (!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_GNOTF_Capturing";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    uiSleep 0.26;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    _hideout setVariable ["inCapture",true,true];
    if (_cP >= 1 || !alive player) exitWith {_hideout setVariable ["inCapture",false,true];};
    if (life_istazed) exitWith {_hideout setVariable ["inCapture",false,true];}; //Tazed
    if (life_isknocked) exitWith {_hideout setVariable ["inCapture",false,true];}; //Knocked
    if (life_interrupted) exitWith {_hideout setVariable ["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
life_action_inUse = false;

titleText[localize "STR_GNOTF_Captured","PLAIN"];
[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
_hideout setVariable ["inCapture",false,true];
_hideout setVariable ["gangOwner",group player,true];
_Pos = position _hideout;

//diag_log format["Group player: %1",group player];

player say3D "rage";

switch (_value) do {
	case "gang_1": {
	deleteMarker "gangmarker1";
	deleteMarker "gangmarkertext1";
	 _marker = createMarker ["gangmarker1", _Pos];
	"gangmarker1" setMarkerColor "ColorRed";
	"gangmarker1" setMarkerType "Empty";
	"gangmarker1" setMarkerShape "ELLIPSE";
	"gangmarker1" setMarkerSize [200,200];
	_markerText = createMarker ["gangmarkertext1", _Pos];
	"gangmarkertext1" setMarkerColor "ColorBlack";
	"gangmarkertext1" setMarkerText format["%1 controls this area",(group player) getVariable "gang_name"];
	"gangmarkertext1" setMarkerType "mil_warning";
	};
	case "gang_2": {
	deleteMarker "gangmarker2";
	deleteMarker "gangmarkertext2";
	 _marker = createMarker ["gangmarker2", _Pos];
	"gangmarker2" setMarkerColor "ColorRed";
	"gangmarker2" setMarkerType "Empty";
	"gangmarker2" setMarkerShape "ELLIPSE";
	"gangmarker2" setMarkerSize [200,200];
	_markerText = createMarker ["gangmarkertext2", _Pos];
	"gangmarkertext2" setMarkerColor "ColorBlack";
	"gangmarkertext2" setMarkerText format["%1 controls this area",(group player) getVariable "gang_name"];
	"gangmarkertext2" setMarkerType "mil_warning";
	};
	case "gang_3": {
	deleteMarker "gangmarker3";
	deleteMarker "gangmarkertext3";
	 _marker = createMarker ["gangmarker3", _Pos];
	"gangmarker3" setMarkerColor "ColorRed";
	"gangmarker3" setMarkerType "Empty";
	"gangmarker3" setMarkerShape "ELLIPSE";
	"gangmarker3" setMarkerSize [200,200];
	_markerText = createMarker ["gangmarkertext3", _Pos];
	"gangmarkertext3" setMarkerColor "ColorBlack";
	"gangmarkertext3" setMarkerText format["%1 controls this area",(group player) getVariable "gang_name"];
	"gangmarkertext3" setMarkerType "mil_warning";
	};
	case "gang_4": {
	deleteMarker "gangmarker4";
	deleteMarker "gangmarkertext4";
	 _marker = createMarker ["gangmarker4", _Pos];
	"gangmarker4" setMarkerColor "ColorRed";
	"gangmarker4" setMarkerType "Empty";
	"gangmarker4" setMarkerShape "ELLIPSE";
	"gangmarker4" setMarkerSize [200,200];
	_markerText = createMarker ["gangmarkertext4", _Pos];
	"gangmarkertext4" setMarkerColor "ColorBlack";
	"gangmarkertext4" setMarkerText format["%1 controls this area",(group player) getVariable "gang_name"];
	"gangmarkertext4" setMarkerType "mil_warning";
	};
};
} else {
		//if (_group isequalto grpNull) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};

		if ((_hideout getVariable ["inCapture",false])) exitWith {hint localize "STR_GNOTF_onePersonAtATime";};
		if (!isNull _group) then {
			_gangName = _group getVariable ["gang_name",""];
			_action = [
				format[localize "STR_GNOTF_AlreadyControlledcop",_gangName],
				localize "STR_GNOTF_CurrentCapture",
				localize "STR_Global_Yes",
				localize "STR_Global_No"
			] call BIS_fnc_guiMessage;

			_cpRate = 0.0045;
		} else {
			_cpRate = 0.0075;
		};

		if (!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
		life_action_inUse = true;

		//Setup the progress bar
		disableSerialization;
		_title = localize "STR_GNOTF_Capturing";
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["%2 (1%1)...","%",_title];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;

		for "_i" from 0 to 1 step 0 do {
			if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			uiSleep 0.26;
			if (isNull _ui) then {
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNamespace getVariable "life_progress";
				_progressBar = _ui displayCtrl 38201;
				_titleText = _ui displayCtrl 38202;
			};
			_cP = _cP + _cpRate;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			_hideout setVariable ["inCapture",true,true];
			if (_cP >= 1 || !alive player) exitWith {_hideout setVariable ["inCapture",false,true];};
			if (life_istazed) exitWith {_hideout setVariable ["inCapture",false,true];}; //Tazed
			if (life_isknocked) exitWith {_hideout setVariable ["inCapture",false,true];}; //Knocked
			if (life_interrupted) exitWith {_hideout setVariable ["inCapture",false,true];};
		};

		//Kill the UI display and check for various states
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
		if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
		if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
		life_action_inUse = false;

		titleText[localize "STR_GNOTF_Captured","PLAIN"];
		//_this setFlagTexture "\A3\Data_F\Flags\flag_fd_blue_CO.paa";
		[[0,1],"STR_GNOTF_CaptureSuccessCop",true,[name player,"The Altis Police"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		_hideout setVariable ["inCapture",false,true];
		_hideout setVariable ["gangOwner",grpNull,true];
		_Pos = position _hideout;

		player say3D "rage";

		switch (_value) do {
			case "gang_1": {
			deleteMarker "gangmarker1";
			deleteMarker "gangmarkertext1";
			 _marker = createMarker ["gangmarker1", _Pos];
			"gangmarker1" setMarkerColor "ColorBlue";
			"gangmarker1" setMarkerType "Empty";
			"gangmarker1" setMarkerShape "ELLIPSE";
			"gangmarker1" setMarkerSize [200,200];
			_markerText = createMarker ["gangmarkertext1", _Pos];
			"gangmarkertext1" setMarkerColor "ColorBlack";
			"gangmarkertext1" setMarkerText format["The Altis Police controls this area"];
			"gangmarkertext1" setMarkerType "mil_warning";
			};
			case "gang_2": {
			deleteMarker "gangmarker2";
			deleteMarker "gangmarkertext2";
			 _marker = createMarker ["gangmarker2", _Pos];
			"gangmarker2" setMarkerColor "ColorBlue";
			"gangmarker2" setMarkerType "Empty";
			"gangmarker2" setMarkerShape "ELLIPSE";
			"gangmarker2" setMarkerSize [200,200];
			_markerText = createMarker ["gangmarkertext2", _Pos];
			"gangmarkertext2" setMarkerColor "ColorBlack";
			"gangmarkertext2" setMarkerText format["The Altis Police controls this area"];
			"gangmarkertext2" setMarkerType "mil_warning";
			};
			case "gang_3": {
			deleteMarker "gangmarker3";
			deleteMarker "gangmarkertext3";
			_marker = createMarker ["gangmarker3", _Pos];
			"gangmarker3" setMarkerColor "ColorBlue";
			"gangmarker3" setMarkerType "Empty";
			"gangmarker3" setMarkerShape "ELLIPSE";
			"gangmarker3" setMarkerSize [200,200];
			_markerText = createMarker ["gangmarkertext3", _Pos];
			"gangmarkertext3" setMarkerColor "ColorBlack";
			"gangmarkertext3" setMarkerText format["The Altis Police controls this area"];
			"gangmarkertext3" setMarkerType "mil_warning";
			};
			case "gang_4": {
			deleteMarker "gangmarker4";
			deleteMarker "gangmarkertext4";
			_marker = createMarker ["gangmarker4", _Pos];
			"gangmarker4" setMarkerColor "ColorBlue";
			"gangmarker4" setMarkerType "Empty";
			"gangmarker4" setMarkerShape "ELLIPSE";
			"gangmarker4" setMarkerSize [200,200];
			_markerText = createMarker ["gangmarkertext4", _Pos];
			"gangmarkertext4" setMarkerColor "ColorBlack";
			"gangmarkertext4" setMarkerText format["The Altis Police controls this area"];
			"gangmarkertext4" setMarkerType "mil_warning";
			};
		};
};
