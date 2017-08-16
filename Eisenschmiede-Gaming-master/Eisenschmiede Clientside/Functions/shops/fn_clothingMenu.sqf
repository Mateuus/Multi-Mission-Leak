#include "..\script_macros.hpp"
/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter","_pos","_oldPos","_oldDir","_oldBev","_flag","_shopTitle","_license","_shopSide","_exit","_testLogic","_nearVeh","_ut1","_ut2","_ut3","_ut4","_ut5","_light"];
if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
_exit = false;

/* License check & config validation */
if(!isClass(missionConfigFile >> "Clothing" >> (SEL(_this,3)))) exitWith {}; //Bad config entry.
_shopTitle = M_CONFIG(getText,"Clothing",(SEL(_this,3)),"title");
_shopSide = M_CONFIG(getText,"Clothing",(SEL(_this,3)),"side");
_license = M_CONFIG(getText,"Clothing",(SEL(_this,3)),"license");

if(!(EQUAL(_shopSide,""))) then {
	_flag = switch(playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
	if(!(EQUAL(_flag,_shopSide))) then {_exit = true;};
};
if(_exit) exitWith {};

if(!(EQUAL(_license,""))) then {
	_flag = M_CONFIG(getText,"Licenses",_license,"side");
	if(!(LICENSE_VALUE(_license,_flag))) exitWith {hint localize "STR_Shop_Veh_NoLicense"; _exit = true;};
};
if(_exit) exitWith {};

ctrlSetText [3103,localize _shopTitle];
/* Open up the menu */
createDialog "ES_Clothing";
disableSerialization;

BinImShop = true;

(findDisplay 3100) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

sliderSetRange [3107, 0, 360];

//Cop / Civ Pre Check
if((SEL(_this,3) in ["bruce","dive","reb","kart"] && playerSide != civilian)) exitWith {hint localize "STR_Shop_NotaCiv"; closeDialog 0;};
if((SEL(_this,3) == "reb" && !license_civ_rebel)) exitWith {hint localize "STR_Shop_NotaReb"; closeDialog 0;};
if((SEL(_this,3) in ["cop"] && playerSide != west)) exitWith {hint localize "STR_Shop_NotaCop"; closeDialog 0;};
if((SEL(_this,3) in ["dive"] && !license_civ_dive)) exitWith { hint localize "STR_Shop_NotaDive"; closeDialog 0;};

if(clothing_noTP) then {
	_pos = getPosATL player;
} else {
	if(clothing_box) then {
		_pos = [1000,1000,10000];
	} else {
		if (CurrentMode == "Altis") then {
			switch(SEL(_this,3)) do {
				case "reb": {_pos = [13590,12214.6,0.00141621];};
				case "cop": {_pos = [12817.5,16722.9,0.00151062];};
				case "kart": {_pos = [14120.5,16440.3,0.00139236];};
				default {_pos = [17088.2,11313.6,0.00136757];};
			};
		}else{
			switch(SEL(_this,3)) do {
				case "reb": {_pos = [12398.45,14188.08,0];};
				case "cop": {_pos = [12507.748,14239.805,0];};
				case "kart": {_pos = [7594.868,14973.385,0];};
				default {_pos = [12487.831,14214.625,0];};
			};
		};
	};

	_oldDir = getDir player;
    _oldPos = visiblePositionASL player;
    _oldBev = behaviour player;

    _testLogic = "Logic" createVehicleLocal _pos;
    _testLogic setPosATL _pos;

    _nearVeh = _testLogic nearEntities ["AllVehicles", 20];

	if(clothing_box) then {
		_ut1 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,5,10]);
		_ut1 attachTo [_testLogic,[0,5,5]];
		_ut1 setDir 0;
		_ut2 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [5,0,10]);
		_ut2 attachTo [_testLogic,[5,0,5]];
		_ut2 setDir (getDir _testLogic) + 90;
		_ut3 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [-5,0,10]);
		_ut3 attachTo [_testLogic,[-5,0,5]];
		_ut3 setDir (getDir _testLogic) - 90;
		_ut4 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,-5,10]);
		_ut4 attachTo [_testLogic,[0,-5,5]];
		_ut4 setDir 180;
		_ut5 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,0,10]);
		_ut5 attachTo [_testLogic,[0,0,0]];
		_ut5 setObjectTexture [0,"a3\map_data\gdt_concrete_co.paa"];
		detach _ut5;
		_ut5 setVectorDirAndUp [[0,0,-.33],[0,.33,0]];
	};

	_light = "#lightpoint" createVehicleLocal _pos;
	_light setlightbrightness 0.5;
	_light setlightcolor [1,1,1];
	_light setlightambient [1,1,1];
	_light lightAttachObject [_testLogic, [0,0,0]];

	{if(_x != player) then {_x hideObject true;};} foreach playableUnits;
	if(!clothing_box) then {
		{if(_x != player && _x != _light) then {_x hideObject true;};} foreach _nearVeh;
	};
	player allowDamage false;

	if(clothing_box) then {
		{_x setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,1)"];} foreach [_ut1,_ut2,_ut3,_ut4];
	};

	player setBehaviour "SAFE";
	player attachTo [_testLogic,[0,0,0]];
	player switchMove "";
	player setDir 360;
};

ES_clothing_store = SEL(_this,3);

/* Store license check */
if(isClass(missionConfigFile >> "Licenses" >> ES_clothing_store)) then {
	_flag = M_CONFIG(getText,"Licenses",ES_clothing_store,"side");
	_displayName = M_CONFIG(getText,"Licenses",ES_clothing_store,"displayName");
	if(!(LICENSE_VALUE(ES_clothing_store,_flag))) exitWith {
		hint format[localize "STR_Shop_YouNeed",localize _displayName];
		closeDialog 0;
	};
};

//initialize camera view
ES_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
ES_shop_cam cameraEffect ["Internal", "Back"];
ES_shop_cam camSetTarget (player modelToWorld [0,0,1]);
ES_shop_cam camSetPos (player modelToWorld [1,4,2]);
ES_shop_cam camSetFOV .33;
ES_shop_cam camSetFocus [50, 0];
ES_shop_cam camCommit 0;
ES_cMenu_lock = false;

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
_filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

ES_oldClothes = uniform player;
ES_olduniformItems = uniformItems player;
ES_oldBackpack = backpack player;
ES_oldVest = vest player;
ES_oldVestItems = vestItems player;
ES_oldBackpackItems = backpackItems player;
ES_oldGlasses = goggles player;
ES_oldHat = headgear player;

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };


waitUntil {isNull (findDisplay 3100)};
if(!clothing_noTP) then {
	{if(_x != player) then {_x hideObject false;};} foreach playableUnits;
	if(!clothing_box) then {
		{if(_x != player && _x != _light) then {_x hideObject false;};} foreach _nearVeh;
	};
	player allowDamage true;
	detach player;
	player setBehaviour _oldBev;
	player setPosASL _oldPos;
	player setDir _oldDir;
	if(clothing_box) then {
		{deleteVehicle _x;} foreach [_testLogic,_ut1,_ut2,_ut3,_ut4,_ut5,_light];
	} else {
		{deleteVehicle _x;} foreach [_testLogic,_light];
	};
};
ES_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy ES_shop_cam;
ES_clothing_filter = 0;
if(isNil "ES_clothesPurchased") exitWith {
	ES_clothing_purchase = [-1,-1,-1,-1,-1];
	if(ES_oldClothes != "") then {player addUniform ES_oldClothes;} else {removeUniform player};
	if(ES_oldHat != "") then {player addHeadgear ES_oldHat} else {removeHeadgear player;};
	if(ES_oldGlasses != "") then {player addGoggles ES_oldGlasses;} else {removeGoggles player};
	if(backpack player != "") then {
		if(ES_oldBackpack == "") then {
			removeBackpack player;
		} else {
			removeBackpack player;
			player addBackpack ES_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count ES_oldBackpackItems > 0) then {
				{
					[_x,true,true] call ES_fnc_handleItem;
				} foreach ES_oldBackpackItems;
			};
		};
	};

	if(count ES_oldUniformItems > 0) then {
		{[_x,true,false,false,true] call ES_fnc_handleItem;} foreach ES_oldUniformItems;
	};

	if(vest player != "") then {
		if(ES_oldVest == "") then {
			removeVest player;
		} else {
			player addVest ES_oldVest;
			if(count ES_oldVestItems > 0) then {
				{[_x,true,false,false,true] call ES_fnc_handleItem;} foreach ES_oldVestItems;
			};
		};
	};
	if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };
};
ES_clothesPurchased = nil;

//Check uniform purchase.
if((ES_clothing_purchase select 0) == -1) then {
	if(ES_oldClothes != uniform player) then {player addUniform ES_oldClothes;};
};
//Check hat
if((ES_clothing_purchase select 1) == -1) then {
	if(ES_oldHat != headgear player) then {if(ES_oldHat == "") then {removeHeadGear player;} else {player addHeadGear ES_oldHat;};};
};
//Check glasses
if((ES_clothing_purchase select 2) == -1) then {
	if(ES_oldGlasses != goggles player) then {
		if(ES_oldGlasses == "") then  {
			removeGoggles player;
		} else {
			player addGoggles ES_oldGlasses;
		};
	};
};
//Check Vest
if((ES_clothing_purchase select 3) == -1) then {
	if(ES_oldVest != vest player) then {
		if(ES_oldVest == "") then {removeVest player;} else {
			player addVest ES_oldVest;
			{[_x,true,false,false,true] call ES_fnc_handleItem;} foreach ES_oldVestItems;
		};
	};
};

//Check Backpack
if((ES_clothing_purchase select 4) == -1) then {
	if(ES_oldBackpack != backpack player) then {
		if(ES_oldBackpack == "") then {removeBackpack player;} else {
			removeBackpack player;
			player addBackpack ES_oldBackpack;
			{[_x,true,true] call ES_fnc_handleItem;} foreach ES_oldBackpackItems;
		};
	};
};

ES_clothing_purchase = [-1,-1,-1,-1,-1];
[] call ES_fnc_saveGear;
if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };

BinImShop = false;