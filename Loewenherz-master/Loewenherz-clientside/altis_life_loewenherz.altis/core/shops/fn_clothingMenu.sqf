/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter"];
createDialog "lhm_Clothing";
disableSerialization;

//Cop / Civ Pre Check
if((_this select 3) in ["bruce","dive","reb","kart"] && playerSide != civilian) exitWith {hint localize "STR_Shop_NotaCiv"; closeDialog 0;};
if((_this select 3) == "reb" && !license_civ_rebel) exitWith {hint localize "STR_Shop_NotaReb"; closeDialog 0;};
if((_this select 3) in ["cop"] && playerSide != west) exitWith {hint localize "STR_Shop_NotaCop"; closeDialog 0;};
if((_this select 3) in ["dive"] && !license_civ_dive) exitWith { hint localize "STR_Shop_NotaDive"; closeDialog 0;};
if((_this select 3) in ["med"] && playerSide != independent) exitWith {hint "Du bist kein Medic"; closeDialog 0;}; // LHM
if((_this select 3) in ["sec"] && playerSide != east) exitWith {hint "Du bist kein Security Agent"; closeDialog 0;}; // LHM
lhm_clothing_store = _this select 3;

//License Check?
_var = [lhm_clothing_store,0] call lhm_fnc_licenseType;
if(_var select 0 != "") then
{
	if(!(missionNamespace getVariable (_var select 0))) exitWith {hint format[localize "STR_Shop_YouNeed",[_var select 0] call lhm_fnc_varToStr]; closeDialog 0;};
};

//initialize camera view
lhm_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
lhm_shop_cam cameraEffect ["Internal", "Back"];
lhm_shop_cam camSetTarget (player modelToWorld [0,0,1]);
lhm_shop_cam camSetPos (player modelToWorld [1,4,2]);
lhm_shop_cam camSetFOV .33;
lhm_shop_cam camSetFocus [50, 0];
lhm_shop_cam camCommit 0;
lhm_cMenu_lock = false;

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

lhm_oldClothes = uniform player;
lhm_olduniformItems = uniformItems player;
lhm_oldBackpack = backpack player;
lhm_oldVest = vest player;
lhm_oldVestItems = vestItems player;
lhm_oldBackpackItems = backpackItems player;
lhm_oldGlasses = goggles player;
lhm_oldHat = headgear player;

waitUntil {isNull (findDisplay 3100)};
lhm_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy lhm_shop_cam;
lhm_clothing_filter = 0;
if(isNil "lhm_clothesPurchased") exitWith
{
	lhm_clothing_purchase = [-1,-1,-1,-1,-1];
	if(lhm_oldClothes != "") then {player forceaddUniform lhm_oldClothes;} else {removeUniform player};
	if(lhm_oldHat != "") then {player addHeadgear lhm_oldHat} else {removeHeadgear player;};
	if(lhm_oldGlasses != "") then {player addGoggles lhm_oldGlasses;} else {removeGoggles player};
	if(backpack player != "") then {
		if(lhm_oldBackpack isEqualTo "") then
		{
			removeBackpack player;
		}
			else
		{
			removeBackpack player;
			player addBackpack lhm_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count lhm_oldBackpackItems > 0) then
			{
				{
					[_x,true,true] call lhm_fnc_handleItem;
				} foreach lhm_oldBackpackItems;
			};
		};
	};

	if(count lhm_oldUniformItems > 0) then
	{
		{[_x,true,false,false,true] call lhm_fnc_handleItem;} foreach lhm_oldUniformItems;
	};

	if(vest player != "") then
	{
		if(lhm_oldVest isEqualTo "") then
		{
			removeVest player;
		}
			else
		{
			player addVest lhm_oldVest;
			if(count lhm_oldVestItems > 0) then
			{
				{[_x,true,false,false,true] call lhm_fnc_handleItem;} foreach lhm_oldVestItems;
			};
		};
	};
};
lhm_clothesPurchased = nil;

//Check uniform purchase.
if((lhm_clothing_purchase select 0) isEqualTo -1) then
{
	if(lhm_oldClothes != uniform player) then {player forceaddUniform lhm_oldClothes;};
};
//Check hat
if((lhm_clothing_purchase select 1) isEqualTo -1) then
{
	if(lhm_oldHat != headgear player) then {if(lhm_oldHat isEqualTo "") then {removeHeadGear player;} else {player addHeadGear lhm_oldHat;};};
};
//Check glasses
if((lhm_clothing_purchase select 2) isEqualTo -1) then
{
	if(lhm_oldGlasses != goggles player) then
	{
		if(lhm_oldGlasses isEqualTo "") then
		{
			removeGoggles player;
		}
			else
		{
			player addGoggles lhm_oldGlasses;
		};
	};
};
//Check Vest
if((lhm_clothing_purchase select 3) isEqualTo -1) then
{
	if(lhm_oldVest != vest player) then
	{
		if(lhm_oldVest isEqualTo "") then {removeVest player;} else
		{
			player addVest lhm_oldVest;
			{[_x,true,false,false,true] call lhm_fnc_handleItem;} foreach lhm_oldVestItems;
		};
	};
};

//Check Backpack
if((lhm_clothing_purchase select 4) isEqualTo -1) then
{
	if(lhm_oldBackpack != backpack player) then
	{
		if(lhm_oldBackpack isEqualTo "") then {removeBackpack player;} else
		{
			removeBackpack player;
			player addBackpack lhm_oldBackpack;
			{[_x,true,true] call lhm_fnc_handleItem;} foreach lhm_oldBackpackItems;
		};
	};
};

lhm_clothing_purchase = [-1,-1,-1,-1,-1];
[] call lhm_fnc_saveGear;