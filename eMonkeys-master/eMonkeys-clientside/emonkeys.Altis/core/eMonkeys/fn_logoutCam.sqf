/*
	File: fn_logoutCam.sqf
	Author: Christian "Cifon" Runggas & Niklas "Rappelkiste" Quenter

	Description:
	Mission End Camera effect.
*/
private ["_a", "_camera", "_pos", "_farbeffect", "_camTime","_Titel"];

_Titel = "Bis zum nächsten Mal";
_camTime = 5;

_farbeffect = [] spawn {
	_a = ppEffectCreate ["dynamicBlur", 3501];
	_a ppEffectEnable true;
	_a ppEffectAdjust [0.6];
	_a ppEffectCommit 5;
	waitUntil {ppEffectCommitted _a};
};

disableUserInput true;
showCinemaBorder true;
camUseNVG false;

_pos = position player;
_camera = "camera" camCreate [(_pos select 0), (_pos select 1),(_pos select 2)+ 2.3];
_camera cameraEffect ["External","back"];
_camera camSetFOV 4.000;

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-50,300];
_camera camCommit _camTime;
_Text = format ["<t font='PuristaMedium' size='1.1' color='#81c800' align='center'>%1<br /></t>", _Titel];
[
		_Text,
		[0.29375 * safezoneW + safezoneX, 0.4125 * safezoneW],
		[0.456 * safezoneH + safezoneY, 0.11 * safezoneH],	
		2
] spawn BIS_fnc_dynamicText;

waitUntil {camCommitted _camera};
disableUserInput false;
["EMonkeysEnd",true,0,false,false] call BIS_fnc_endMission;