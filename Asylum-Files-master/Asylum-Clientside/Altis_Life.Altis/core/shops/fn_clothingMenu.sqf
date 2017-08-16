/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter"];
createDialog "Life_Clothing";
disableSerialization;

_unit = cursorTarget;
if (isNull _unit) then { _unit = _this select 0; };

if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if ((player distance _unit) > 7) exitWith { hint "You are too far away." };
if(lineIntersects[eyePos player, aimPos _unit,player,_unit]) exitWith {hint "It would be hard to buy things through the wall, don't you think?"};
//Cop / Civ Pre Check
if((_this select 3) in ["bruce","dive","reb","kart"] && playerSide != civilian && !(life_coprole in ["all","detective"])) exitWith {hint "You need to be a civilian to use this store!"; closeDialog 0;};
if((_this select 3) == "reb" && !license_civ_rebel) exitWith {hint "You don't have rebel training yet!"; closeDialog 0;};
if((_this select 3) in ["cop","copdive"] && playerSide != west) exitWith {hint "You need to be a cop to use this store!"; closeDialog 0;};
if((_this select 3) == "kart" && !(104 in life_talents)) exitWith{hint "You're simply not talented enough to wear these epic clothes."; closeDialog 0;};
life_clothing_store = _this select 3;

//License Check?
_var = [life_clothing_store,0] call life_fnc_licenseType;
if(_var select 0 != "") then
{
	if(!(missionNamespace getVariable (_var select 0))) exitWith {hint format["You need a %1 to buy from this shop!",[_var select 0] call life_fnc_varToStr]; closeDialog 0;};
};

// Trace camera to make sure it doesn't go through walls
life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
_camDistance = 4;
while {_camDistance > 1} do
{
	if (!lineIntersects [ATLToASL (player modelToWorld [1,_camDistance,2]), ATLToASL (player modelToWorld [0,0,1]), player]) exitWith {};
	_camDistance = _camDistance - 0.5;
};
life_shop_cam camSetPos (player modelToWorld [1,_camDistance,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
_filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_faceStore = false;
if (_this select 3 != "faces") then
{
	_filter lbAdd "Clothing";
	_filter lbAdd "Hats";
	_filter lbAdd "Glasses";
	_filter lbAdd "Vests";
	_filter lbAdd "Backpacks";
}
else
{
	_filter lbAdd "Faces";
	_faceStore = true;
};
_filter lbSetCurSel 0;

life_oldFace = face player;
life_oldClothes = uniform player;
life_olduniformItems = call {
	_items = []; 
	{if(!(_x in magazines player)) then {_items pushBack _x}} forEach uniformItems player;
	_items;
};
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = call {
	_items = []; 
	{if(!(_x in magazines player)) then {_items pushBack _x}} forEach vestItems player;
	_items;
};
life_oldBackpackItems = call {
	_items = []; 
	{if(!(_x in magazines player)) then {_items pushBack _x}} forEach backpackItems player;
	_items;
};
life_oldGlasses = goggles player;
life_oldHat = headgear player;
life_oldTexture = player getVariable "customTexture";
life_oldMags = magazinesAmmo player;

waitUntil {isNull (findDisplay 3100)};
life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if(isNil "life_clothesPurchased") exitWith
{
	life_clothing_purchase = [-1,-1,-1,-1,-1];
	if (_faceStore) exitWith { player setFace life_oldFace };
	if (life_oldClothes != "") then {player forceAddUniform life_oldClothes;} else {removeUniform player};
	if (life_oldHat != "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
	if (life_oldGlasses != "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
	if (isNil "life_oldTexture") then { player setVariable ["customTexture", nil, true]; }
	else { player setVariable ["customTexture", life_oldTexture, true]; };
	if (backpack player != "") then
	{
		if (life_oldBackpack == "") then
		{
			removeBackpack player;
		}
			else
		{
			removeBackpack player;
			player addBackpack life_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count life_oldBackpackItems > 0) then
			{
				{
					[_x,true,true] call life_fnc_handleItem;
				} foreach life_oldBackpackItems;
			};
		};
	};
	
	if(count life_oldUniformItems > 0) then
	{
		{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldUniformItems;
	};
	
	if(vest player != "") then
	{
		if(life_oldVest == "") then
		{
			removeVest player;
		}
			else
		{
			player addVest life_oldVest;
			if(count life_oldVestItems > 0) then
			{
				{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldVestItems;
			};
		};
	};
	if(count life_oldMags > 0) then {{player addMagazine _x} forEach life_oldMags};
	[] call life_fnc_equipGear;
};
life_clothesPurchased = nil;

//Check face.
if(_faceStore && (life_clothing_purchase select 0) == -1) then
{
	if(life_oldFace != face player) then {player setFace life_oldFace;};
};
if (!_faceStore) then
{
	//Check uniform purchase.
	if((life_clothing_purchase select 0) == -1) then
	{
		if(life_oldClothes != uniform player) then {player forceAddUniform life_oldClothes; };
	};
	//Check hat
	if((life_clothing_purchase select 1) == -1) then
	{
		if(life_oldHat != headgear player) then {if(life_oldHat == "") then {removeHeadGear player;} else {player addHeadGear life_oldHat;};};
	};
	//Check glasses
	if((life_clothing_purchase select 2) == -1) then
	{
		if(life_oldGlasses != goggles player) then
		{
			if(life_oldGlasses == "") then 
			{
				removeGoggles player;
			}
				else
			{
				player addGoggles life_oldGlasses;
			};
		};
	};
	//Check Vest
	if((life_clothing_purchase select 3) == -1) then
	{
		if(life_oldVest != vest player) then
		{
			if(life_oldVest == "") then {removeVest player;} else
			{
				player addVest life_oldVest;
				{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldVestItems;
			};
		};
	};

	//Check Backpack
	if((life_clothing_purchase select 4) == -1) then
	{
		if(life_oldBackpack != backpack player) then
		{
			if(life_oldBackpack == "") then {removeBackpack player;} else
			{
				removeBackpack player;
				player addBackpack life_oldBackpack;
				{[_x,true,true] call life_fnc_handleItem;} foreach life_oldBackpackItems;
			};
		};
	};
	[] call life_fnc_equipGear;
};
life_clothing_purchase = [-1,-1,-1,-1,-1];