/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the players Hud and updates their damage meter 
*/
private["_display","_alpha","_version","_p","_pg"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;
2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
//uiNameSpace setVariable ["playerHUD",_display];
[] call DS_fnc_updateHud;
[] spawn
{
	private["_health"];
	while {true} do
	{
		_health = (damage player);
		waitUntil {(damage player) != _health};
		[] call DS_fnc_updateHud;
	};
};