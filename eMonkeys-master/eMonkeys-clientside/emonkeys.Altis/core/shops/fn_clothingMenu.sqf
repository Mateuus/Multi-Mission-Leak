/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter"];
createDialog "EMonkeys_Clothing";
disableSerialization;

//Cop / Civ Pre Check
if((_this select 3) in ["bruce","dive","reb","kart","VIP"] && !(side player in [east,civilian])) exitWith {["Händler Information",["Du kannst hier nichts kaufen"],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
if((_this select 3) == "reb" && !license_civ_rebel) exitWith {["Händler Information",["Du kannst hier nichts kaufen.","Du benötigst die richtige Lizenz"],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
if((_this select 3) in ["cop"] && playerSide != west) exitWith {["Händler Information",["Du kannst hier nichts kaufen.","Du bist nicht bei der Polizei"],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
if((_this select 3) in ["feuerwehr"] && playerSide != independent) exitWith {["Händler Information",["Du kannst hier nichts kaufen.","Du bist nicht bei der Feuerwehr"],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
if((_this select 3) == "ap" && (["AP"] call EMonkeys_fnc_permLevel) < 1) exitWith {["Händler Information",["Du kannst hier nichts kaufen.","Du bist kein Mitglied der Altis Press"],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
if((_this select 3) == "gruppe" && !(side player in [east,civilian])) exitWith {["Händler Information",["Du kannst hier nichts kaufen"],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
EMonkeys_clothing_store = _this select 3;

//License Check?
_var = [EMonkeys_clothing_store,0] call EMonkeys_fnc_licenseType;
if(_var select 0 != "") then
{
	if(!(missionNamespace getVariable (_var select 0))) exitWith {["Händler Information",["Du kannst hier nichts kaufen",format["Du brauchst %1 um den Shop zu benutzen!",[_var select 0] call EMonkeys_fnc_varToStr]],"#0090ff"] call EMonkeys_fnc_specialText; closeDialog 0;};
};

//initialize camera view
EMonkeys_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
EMonkeys_shop_cam cameraEffect ["Internal", "Back"];
EMonkeys_shop_cam camSetTarget (player modelToWorld [0,0,1]);
EMonkeys_shop_cam camSetPos (player modelToWorld [1,4,2]);
EMonkeys_shop_cam camSetFOV .33;
EMonkeys_shop_cam camSetFocus [50, 0];
EMonkeys_shop_cam camCommit 0;
EMonkeys_cMenu_lock = false;

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
_filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd "Kleidung";
_filter lbAdd "Kopfbedeckung";
_filter lbAdd "Brillen";
_filter lbAdd "Westen";
_filter lbAdd "Rucksäcke";

_filter lbSetCurSel 0;

EMonkeys_oldClothes = uniform player;
EMonkeys_olduniformItems = uniformItems player;
EMonkeys_oldBackpack = backpack player;
EMonkeys_oldVest = vest player;
EMonkeys_oldVestItems = vestItems player;
EMonkeys_oldBackpackItems = backpackItems player;
EMonkeys_oldGlasses = goggles player;
EMonkeys_oldHat = headgear player;

waitUntil {isNull (findDisplay 3100)};
EMonkeys_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy EMonkeys_shop_cam;
EMonkeys_clothing_filter = 0;
if(isNil "EMonkeys_clothesPurchased") exitWith
{
	EMonkeys_clothing_purchase = [-1,-1,-1,-1,-1];
	if(EMonkeys_oldClothes != "") then {player forceAddUniform EMonkeys_oldClothes;} else {removeUniform player};
	if(EMonkeys_oldHat != "") then {player addHeadgear EMonkeys_oldHat} else {removeHeadgear player;};
	if(EMonkeys_oldGlasses != "") then {player addGoggles EMonkeys_oldGlasses;} else {removeGoggles player};
	if(backpack player != "") then
	{
		if(EMonkeys_oldBackpack == "") then
		{
			removeBackpack player;
		}
			else
		{
			removeBackpack player;
			player addBackpack EMonkeys_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count EMonkeys_oldBackpackItems > 0) then
			{
				{
					[_x,true,true] call EMonkeys_fnc_handleItem;
				} foreach EMonkeys_oldBackpackItems;
			};
		};
	};
	
	if(count EMonkeys_oldUniformItems > 0) then
	{
		{[_x,true,false,false,true] call EMonkeys_fnc_handleItem;} foreach EMonkeys_oldUniformItems;
	};
	
	if(vest player != "") then
	{
		if(EMonkeys_oldVest == "") then
		{
			removeVest player;
		}
			else
		{
			player addVest EMonkeys_oldVest;
			if(count EMonkeys_oldVestItems > 0) then
			{
				{[_x,true,false,false,true] call EMonkeys_fnc_handleItem;} foreach EMonkeys_oldVestItems;
			};
		};
	};
};
EMonkeys_clothesPurchased = nil;

//Check uniform purchase.
if((EMonkeys_clothing_purchase select 0) == -1) then
{
	if(EMonkeys_oldClothes != uniform player) then {player addUniform EMonkeys_oldClothes;};
};
//Check hat
if((EMonkeys_clothing_purchase select 1) == -1) then
{
	if(EMonkeys_oldHat != headgear player) then {if(EMonkeys_oldHat == "") then {removeHeadGear player;} else {player addHeadGear EMonkeys_oldHat;};};
};
//Check glasses
if((EMonkeys_clothing_purchase select 2) == -1) then
{
	if(EMonkeys_oldGlasses != goggles player) then
	{
		if(EMonkeys_oldGlasses == "") then 
		{
			removeGoggles player;
		}
			else
		{
			player addGoggles EMonkeys_oldGlasses;
		};
	};
};
//Check Vest
if((EMonkeys_clothing_purchase select 3) == -1) then
{
	if(EMonkeys_oldVest != vest player) then
	{
		if(EMonkeys_oldVest == "") then {removeVest player;} else
		{
			player addVest EMonkeys_oldVest;
			{[_x,true,false,false,true] call EMonkeys_fnc_handleItem;} foreach EMonkeys_oldVestItems;
		};
	};
};

//Check Backpack
if((EMonkeys_clothing_purchase select 4) == -1) then
{
	if(EMonkeys_oldBackpack != backpack player) then
	{
		if(EMonkeys_oldBackpack == "") then {removeBackpack player;} else
		{
			removeBackpack player;
			player addBackpack EMonkeys_oldBackpack;
			{[_x,true,true] call EMonkeys_fnc_handleItem;} foreach EMonkeys_oldBackpackItems;
		};
	};
};
 
EMonkeys_clothing_purchase = [-1,-1,-1,-1,-1];