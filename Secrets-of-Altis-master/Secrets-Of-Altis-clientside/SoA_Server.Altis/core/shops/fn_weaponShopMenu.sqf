/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_shop")) exitwith {};

_config = [_this select 3] call life_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38406);
_items = ((finddisplay 38400) displayCtrl 38403);
lbClear _filters;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";
_filters lbSetCurSel 0;
_items lbSetCurSel 0;

//Initialize Camera
hudactive = false;
2 cutFadeOut 1;

_pos = [7107.52,16552,2];

_veh_shop_logic = "Logic" createVehicleLocal [0,0,0];
_veh_shop_logic setpos _pos;
  
_radius = 1.5; 
_winkel = 310;
_hoehe = 2; 
_speed = 0.10;
_poscam = [_veh_shop_logic, _radius, _winkel] call BIS_fnc_relPos; 
_poscam set [2, _hoehe];

_life_vehshop_cam = "camera" camCreate _poscam; 
_life_vehshop_cam cameraEffect ["INTERNAL","BACK"]; 
_life_vehshop_cam camPrepareFOV 0.550; 
_life_vehshop_cam camPrepareTarget _veh_shop_logic; 
_life_vehshop_cam camCommitPrepared 0; 
showCinemaBorder false; 
titleCut ["", "BLACK IN",1]; 

while {!isnull(findDisplay 38400) && alive player} do { 
	_poscam = [_veh_shop_logic, _radius, _winkel] call BIS_fnc_relPos; 
	_poscam set [2, _hoehe]; 
	_life_vehshop_cam camPreparePos _poscam; 
	_life_vehshop_cam camCommitPrepared _speed; 
	waitUntil {camCommitted _life_vehshop_cam OR isnull(findDisplay 38400) OR !alive player}; 
	_life_vehshop_cam camPreparePos _poscam;
	_life_vehshop_cam camCommitPrepared 0;
	_winkel = _winkel + 1;
};

deletevehicle _veh_shop_logic;
deletevehicle weapon_shop_vehicle;
_life_vehshop_cam cameraEffect ["terminate","back"]; 
camDestroy _life_vehshop_cam;
hudactive = true;
[] call life_fnc_hudSetup;