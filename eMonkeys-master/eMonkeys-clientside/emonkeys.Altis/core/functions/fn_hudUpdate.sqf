/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_battery","_mail"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call EMonkeys_fnc_hudSetup;};




_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_battery = _ui displayCtrl 23520;   

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.548];
_food ctrlSetText format["%1", EMonkeys_hu164];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.502];
_water ctrlSetText format["%1", EMonkeys_thi164];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.456];
_health ctrlSetText format["%1", round((1 - (eM_damage_null)) * 100)];
_health ctrlCommit 0;
//Update battery
_battery ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.410];
_battery ctrlSetText format["%1", EMonkeys_bat164];                      
_battery ctrlCommit 0; 

if(EMonkeys_HC2_isActive) then
{
_mail = _ui displayCtrl 23521; 
_mailp = _ui displayCtrl 23522; 
ctrlShow[23521,true];
ctrlShow[23522,true];
_mail ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.364];
_mail ctrlSetText format["%1", count EMonkeys_packetlistp];                      
_mail ctrlCommit 0; 
}else{
ctrlShow[23521,false];

ctrlShow[23522,false];

};
