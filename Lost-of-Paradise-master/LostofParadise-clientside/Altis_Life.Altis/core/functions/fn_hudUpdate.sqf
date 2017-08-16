private["_ui","_healthbar","_foodbar","_waterbar","_food","_water","_health"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_foodbar = _ui displayCtrl 23501;
_water = _ui displayCtrl 23510;
_waterbar = _ui displayCtrl 23511;
_health = _ui displayCtrl 23515;
_healthbar = _ui displayCtrl 23516;
/*Update food*/
_food ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.087];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
_foodbar progressSetPosition (life_hunger / 100);
/*Update Water*/
_water ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.132];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
_waterbar progressSetPosition (life_thirst / 100);
/*Update Health*/
_health ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.177];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;_healthbar progressSetPosition (-(damage player - 1));