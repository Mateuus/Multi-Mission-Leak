/*
	File: fn_spawningCam.sqf
	Author: Blackd0g
	Description:
	adds camera effect and a intro text to player and zoom to it.
*/

// [] spawn lhm_fnc_spawningCam;

private [ "_camera", "_welcomeMessage", "_camDistance" ];
spawningCam = false;
[] call lhm_fnc_huddelete;
[] spawn {
	waitUntil {preloadCamera getPos (vehicle player)};
	titleCut ["", "BLACK IN", 5];
	waitUntil {sleep random 2};
_input = format[" '''Loewenherz''' - Dein neues Leben - '''%1 RPG Mod''' * * *",toUpper worldName];
////////////////////////////////////////////////////////////////////////////////////////////
 _inputLocalized = [];
 x_inputLocalized = _inputLocalized;
 x_input = _input;
 _inputArrayUnicode = toarray _input;
 _inputArrayUnicode = _inputArrayUnicode - [42];
 _inputString = "";
 _inputArrayDebug = [];
 _deleteSpaces = false;  _deleteRows = false;
 _isBold = false;  _isTitle = false;
 _countTotal = count _inputArrayUnicode - 1;

 for "_i" from 0 to _countTotal do {
	 _current = _inputArrayUnicode select _i;
	 _previous = if (_i > 0) then {_inputArrayUnicode select (_i-1)} else {-1};
	 _next = if (_i < (count _inputArrayUnicode - 1)) then {
	 _inputArrayUnicode select (_i+1) } else {-1};

	 _output = tostring [_current];

	 if (_current == 32 && (_previous == 10 || _next == 10)) then {_output = "";};
	 if (_current == 10) then {_output = "<br />"};
	 if (_current == 39 && _previous == 39 && _next != 39) then {_output = "";};
	 if (_current == 39 && _previous != 39 && _next == 39) then {_output = "";};
	 if (_current == 39 && _previous == 39 && _next == 39) then { _output = if (_isBold) then {_isBold = false;  "</t>";} else {_isBold = true;  "<t color ='#FF0000'size='2.0'>";};  };
	 if (_current == 61 && _previous == 61 && _next != 61) then {_output = "";};
	 if (_current == 61 && _previous != 61 && _next == 61) then {_output = "";};
	 if (_current == 61 && _previous == 61 && _next == 61) then { _output = if (_isTitle) then {_isTitle = false;  "</t>";} else {_isTitle = true;  "<t color ='#FF0000'size='2.0'>";};  };

	 _inputString = _inputString + _output;  _inputArrayDebug = _inputArrayDebug + [[_current,_output]];

 };

creditsText = _inputString;  _layer = 1 * random 72;
sqf = [creditsText,[safezoneX,safezoneW * 1.0],safezoneH - 0.9 * safezoneH,1000,-10,-120,_layer] spawn bis_fnc_dynamicText;
};

playsound "introsong";
_camDistance = 40;
waitUntil {alive player};

showCinemaBorder true;
camUseNVG false;
_camera = "camera" camCreate [(position player select 0)-2, position player select 1,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 8;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
spawningCam = true;

[] call lhm_fnc_hudSetup;
[] spawn {
	waitUntil {spawningCam};
	spawningCam = false;

	if(isNull hud_lhmHealth || isNull  hud_lhmWeight || isNull hud_lhmStamina || IsNull hud_lhmRun || isNull hud_lhmAlcohol  || isNull hud_lhmBuffs) then {
		diag_log "::lhm Client:: reinitializing Survival Functions...";
		[] execVM "core\init_survival.sqf";
	};

	sleep 1;
	//[Name player,"Login complete",format["ID: %1",getPlayerUID player]] spawn BIS_fnc_infoText;
};