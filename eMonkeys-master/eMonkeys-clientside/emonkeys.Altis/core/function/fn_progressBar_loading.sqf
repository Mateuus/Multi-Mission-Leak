/*
	File: fn_progressBar_loading.sqf
	Author: Niklas "Rappelkiste" Quenter
	
	Description:
	Initializes the progress bar befor the Spawnmenu.
*/

camUseNVG false;
showCinemaBorder false;
1 fadeSound 0.3;

EMonkeys_IntroCam = "camera" camCreate [3685.7734, 13110.084, 11];
EMonkeys_IntroCam cameraEffect ["Internal","back"];
EMonkeys_IntroCam camSetTarget [3649.2131, 13110.814, 0];
EMonkeys_IntroCam camCommit 0;

0 cutText ["","BLACK IN"];
0 cutFadeOut 1;
closeDialog 0;

createDialog "EMonkeys_progress_loading";
(findDisplay 38210) displaySetEventHandler ["keyDown","_this call EMonkeys_fnc_displayHandler"];
disableSerialization;

WaitUntil {(!isNil "EMonkeys_objspawn")};
WaitUntil {EMonkeys_objspawn};

EMonkeys_loadingD_ready = false;
_mapready1 = false;
_mapready2 = false;
_mapready3 = false;
_mapready4 = false;

_ui = uiNameSpace getVariable "EMonkeys_progress_loading";
_progress = _ui displayCtrl 3201;
_progress progressSetPosition 0.01;
_cP = 0.01;

playSound "start";

while{true} do 
{
	uisleep 0.25;
	_cP = _cP + 0.01;
	if ((_cP >= 0.2) && EMonkeys_loadmap1) then {WaitUntil {EMonkeys_loadmap2}; _mapready1 = true;};
	if ((_cP >= 0.4) && EMonkeys_loadmap2 && _mapready1) then {WaitUntil {EMonkeys_loadmap3}; _mapready2 = true;};
	if ((_cP >= 0.6) && EMonkeys_loadmap3 && _mapready2) then {WaitUntil {EMonkeys_loadmap4}; _mapready3 = true;};
	if ((_cP >= 0.8) && EMonkeys_loadmap4 && _mapready3) then {WaitUntil {EMonkeys_loadmap5}; _mapready4 = true;};
	if ((_cP >= 1.0) && EMonkeys_loadmap5 && _mapready4) exitWith {};
	_progress progressSetPosition _cP;
};

EMonkeys_loadingD_ready = true;