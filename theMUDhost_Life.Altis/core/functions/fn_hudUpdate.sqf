/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_healthbar","_foodbar","_waterbar","_food","_water","_health"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_health = _ui displayCtrl 5100;
_healthbar = _ui displayCtrl 5101;
_food = _ui displayCtrl 5102;
_foodbar = _ui displayCtrl 5103;
_water = _ui displayCtrl 5104;
_waterbar = _ui displayCtrl 5105;



/*Update Water*/
_water ctrlCommit 0;
_waterbar progressSetPosition (life_thirst / 100);
/*Update food*/
_food ctrlCommit 0;
_foodbar progressSetPosition (life_hunger / 100);
/*Update Health*/
_health ctrlCommit 0;
_healthbar progressSetPosition (-(damage player - 1));