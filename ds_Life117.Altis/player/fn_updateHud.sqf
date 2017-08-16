private["_ui","_food","_water","_health","_armour","_temp"];
disableSerialization;
_temp = 0;
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call DS_fnc_setupHud;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_armour = _ui displayCtrl 23535;
//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.548];
_food ctrlSetText format["%1 %2", DS_hunger,"%"];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.502];
_water ctrlSetText format["%1 %2", DS_thirst,"%"];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.456];
_health ctrlSetText format["%1 %2", round((1 - (damage player)) * 100),"%"];
_health ctrlCommit 0;
//Update Armour
_armour ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.410];
if((playerside == west)||(player getVariable ["security",false]))then
	{
	_armour ctrlSetText format["%1 %2",(DS_armour*10),"%"];
	}
	else
	{
	if(DS_armour == 15)then
		{
		_temp = 100;
		}
		else
		{
		_temp = (DS_armour*5)
		};
	_armour ctrlSetText format["%1 %2",_temp,"%"];
	};
_armour ctrlCommit 0;
