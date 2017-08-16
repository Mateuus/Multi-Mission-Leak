/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Dresses a civilian with his saved gear
*/
private ["_uniforms","_faulDart","_pistol","_clothes","_dataArray","_vest","_backpack","_glasses","_hat","_items","_primary","_primaryItems","_handgunItems","_uniformItems","_vestItems","_vestMags","_backpackMags","_backpackItems"];
waitUntil {!(isNull (findDisplay 46))};
_dataArray = civ_gear;
//No data? Cool, just remove their hate and glasses and make them default

if(count _dataArray == 0) exitWith
{
    if(headGear player != "") then {removeHeadgear player;};
    if(goggles player != "") then {removeGoggles player;};
	_uniforms =
	[
	"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_IG_Guerilla2_2","U_IG_Guerilla3_1","U_IG_Guerilla2_3"
	];
	_newmarker = (floor(random(count _uniforms)));
	_markerlocation = (_uniforms select _newmarker);
	player addUniform _markerlocation;
};
//Lets get nakkie
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
    player unassignItem _x;
    player removeItem _x;
} foreach (assignedItems player);

_clothes = [_dataArray,0,"",[""]] call BIS_fnc_param;
_vest = [_dataArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_dataArray,2,"",[""]] call BIS_fnc_param;
_glasses = [_dataArray,3,"",[""]] call BIS_fnc_param;
_hat = [_dataArray,4,"",[""]] call BIS_fnc_param;
_items = [_dataArray,5,[],[[]]] call BIS_fnc_param;
_primary = [_dataArray,6,"",[""]] call BIS_fnc_param;
_secondary = [_dataArray,7,"",[""]] call BIS_fnc_param;
_uniformItems = [_dataArray,8,[],[[]]] call BIS_fnc_param;
_uniformMags = [_dataArray,9,[],[[]]] call BIS_fnc_param;
_backpackItems = [_dataArray,10,[],[[]]] call BIS_fnc_param;
_backpackMags = [_dataArray,11,[],[[]]] call BIS_fnc_param;
_vestItems = [_dataArray,12,[],[[]]] call BIS_fnc_param;
_vestMags = [_dataArray,13,[],[[]]] call BIS_fnc_param;
_primaryItems = [_dataArray,14,[],[[]]] call BIS_fnc_param;
_handgunItems = [_dataArray,15,[],[[]]] call BIS_fnc_param;
_yItems = [_dataArray,16,[],[[]]] call BIS_fnc_param;
_pistol = [_dataArray,17,"",[""]] call BIS_fnc_param;
_faulDart = [_dataArray,18,"",[""]] call BIS_fnc_param;
if(!(_faulDart isEqualTo "")) then {_handle = [_faulDart] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};}; 
if(!(_primary isEqualTo "")) then {_handle = [_primary] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_pistol isEqualTo "")) then {_handle = [_pistol] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_secondary isEqualTo "")) then {_handle = [_secondary] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_glasses isEqualTo "")) then {_handle = [_glasses] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_hat isEqualTo "")) then {_handle = [_hat] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_clothes isEqualTo "")) then {_handle = [_clothes] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_vest isEqualTo "")) then {_handle = [_vest] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_backpack isEqualTo "")) then {_handle = [_backpack] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
{_handle = [_x] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};} foreach _items;
{
    if (!(_x isEqualTo "")) then 
		{
        player addPrimaryWeaponItem _x;
		};
} foreach (_primaryItems);
{
    if (!(_x isEqualTo "")) then 
		{
        player addHandgunItem _x;
		};
} foreach (_handgunItems);
{player addItemToUniform _x;} foreach (_uniformItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} foreach (_uniformMags);
{player addItemToVest _x;} foreach (_vestItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} foreach (_vestMags);
{player addItemToBackpack _x;} foreach (_backpackItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} foreach (_backpackMags);

_bp = backpack player;
if(_bp != "")then
	{
	_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
	_load = round(_cfg / 8);
	DS_maxWeight = (24 + _load);
	if(playerSide != civilian) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};

{
    [_x,true,1] call DS_fnc_handleInventory;
} foreach (_yItems);

[] spawn DS_fnc_copuniform;