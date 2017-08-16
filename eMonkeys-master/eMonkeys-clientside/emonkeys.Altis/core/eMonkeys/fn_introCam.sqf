/*
	File: fn_introCam.sqf
	Author: Niklas "Rappelkiste" Quenter
	
	Description:
	Camera effect after Player spawn.
*/
private ["_a", "_camera", "_pos", "_camDistance", "_farbeffect", "_effect", "_camTime1", "_camTime2", "_camTime3", "_camTime4", "_camTime5", "_Titel"];

_pos = position player;

if (EMonkeys_firstSpawn) then {
	
	EMonkeys_firstSpawn = false;
	_camDistance = 1000;
	_camTime1 = 3;
	_camTime2 = 5;
	_camTime3 = 0.8;
	_camTime4 = 0.6;
	_camTime5 = 0.1;
	_Titel = "Willkommen bei Electronic Monkeys";
	
	//Farbe Effect
	_farbeffect = 
	{
		_a = ppEffectCreate ["colorCorrections", 3501];
		_a ppEffectEnable true;
		_a ppEffectAdjust [1, 1, -0.1, [0.0, 0.6, 0.0, 0.7],[1, 1, 1, 1], [0,9, 0, 1]];
		_a ppEffectCommit 0;
		uiSleep 5;
		_a ppEffectEnable true;
		_a ppEffectAdjust [1, 1,  -0.01, [0, 0, 0, 0], [1, 1, 1, 1],[0, 0, 0, 1]];
		_a ppEffectCommit 7;
		waitUntil {ppEffectCommitted _a};
		ppEffectDestroy _a;
	};

	//Intro
	showCinemaBorder true;

	EMonkeys_IntroCam camSetPos [(_pos select 0) + 5, (_pos select 1),(_pos select 2)+_camDistance];
	EMonkeys_IntroCam cameraEffect ["internal","back"];
	EMonkeys_IntroCam camSetTarget vehicle player;
	EMonkeys_IntroCam camCommit 0;

	cutText ["","BLACK IN",2];
	1000 cutText ["","BLACK IN",2];
	_effect = [] spawn _farbeffect;
	
	EMonkeys_IntroCam camSetFOV 1.000;
	EMonkeys_IntroCam camCommit _camTime1;

	//Text
	_Text = format ["<t font='PuristaMedium' size='1.1' color='#000000' align='center'>%1<br /></t>", _Titel];
	[
		_Text,
		[0.29375 * safezoneW + safezoneX, 0.4125 * safezoneW],
		[0.456 * safezoneH + safezoneY, 0.11 * safezoneH],
		4   
	] spawn BIS_fnc_dynamicText;

	waitUntil {camCommitted EMonkeys_IntroCam};
	EMonkeys_IntroCam camSetTarget vehicle player;
	EMonkeys_IntroCam camSetRelPos [0,-50,30];
	EMonkeys_IntroCam camCommit _camTime2;
	waitUntil {camCommitted EMonkeys_IntroCam};
	EMonkeys_IntroCam camSetFOV 2.000;
	EMonkeys_IntroCam camSetTarget vehicle player;
	EMonkeys_IntroCam camSetRelPos [0,-2,3];
	EMonkeys_IntroCam camCommit _camTime3;
	waitUntil {camCommitted EMonkeys_IntroCam};
	EMonkeys_IntroCam camSetTarget vehicle player;
	EMonkeys_IntroCam camSetRelPos [0,-1,2.5];
	EMonkeys_IntroCam camCommit _camTime4;
	waitUntil {camCommitted EMonkeys_IntroCam};
	EMonkeys_IntroCam camSetTarget vehicle player;
	EMonkeys_IntroCam camSetRelPos [0,-0.05,2];
	EMonkeys_IntroCam camCommit _camTime5;
	waitUntil {camCommitted EMonkeys_IntroCam};
	EMonkeys_IntroCam cameraEffect ["terminate","back"];
	camDestroy EMonkeys_IntroCam;
	waitUntil {scriptDone _effect};
	[] execVM "core\emonkeys\welcome.sqf";
}else{
	_camDistance = 100;
	_camTime1 = 4;
	_camTime2 = 2;
	_camTime3 = 1;
	_Titel = "Du wurdest in letzter Sekunde gerettet";
	
	//Farbe Effect
	_farbeffect = [] spawn {
		_a = ppEffectCreate ["dynamicBlur", 3501];
		_a ppEffectEnable true;
		_a ppEffectAdjust [0.5];
		_a ppEffectCommit 0;
		uisleep 4;
		_a ppEffectEnable true;
		_a ppEffectAdjust [0];
		_a ppEffectCommit 4;
		waitUntil {ppEffectCommitted _a};
		ppEffectDestroy _a;
	};

	//Intro
	showCinemaBorder true;
	camUseNVG false;

	_camera = "camera" camCreate [(_pos select 0) - 0, (_pos select 1),(_pos select 2)+_camDistance];
	_camera cameraEffect ["internal","back"];
	1000 cutText ["","BLACK IN",2];
	cutText ["","BLACK IN",2];
	
	_camera camSetFOV 1.000;
	_camera camSetTarget vehicle player;
	_camera camSetRelPos [0,50,25];
	_camera camCommit _camTime1;

	//Text
	_Text = format ["<t font='PuristaMedium' size='1' color='#81c800' align='center'>%1<br /></t>", _Titel];
	[
		_Text,
		[0.29375 * safezoneW + safezoneX, 0.4125 * safezoneW],
		[0.456 * safezoneH + safezoneY, 0.11 * safezoneH],
		4
	] spawn BIS_fnc_dynamicText;

	waitUntil {camCommitted _camera};
	_camera camSetFOV 2.000;
	_camera camSetRelPos [0,20,10];
	_camera camCommit _camTime2;

	waitUntil {camCommitted _camera};
	_camera camSetTarget vehicle player;
	_camera camSetRelPos [0,0.05,2];
	_camera camCommit _camTime3;
	waitUntil {camCommitted _camera};
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	waitUntil {scriptDone _farbeffect};
};