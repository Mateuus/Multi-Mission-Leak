/*
	File: fn_factory.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Opens the factory UI and populates recipes
*/

private ["_factory","_display","_recipes","_recipeList","_name","_pic","_point","_show","_armsDealer"];

_factory = _this select 3;
if (!isNull (findDisplay 1800)) exitWith {}; //Already at the menu, block for abuse?

createDialog "life_factory_menu";
disableSerialization;
waitUntil {!isNull (findDisplay 1800)};
_display = findDisplay 1800;
_recipeList = _display displayCtrl 1850;
_recipes = _factory call life_fnc_recipes;

ctrlEnable [1830, false];
ctrlEnable [1832, false];
ctrlShow [1084, false];
lbClear _recipeList;
_point = life_capture_list select 0;
_armsDealer = ((_point select 1) != "0" && (_point select 1) == life_gang && (_point select 2) == 1);

{
	_show = true;
	if (_x in ["B_G_Offroad_01_armed_F","O_MRAP_02_F","LMG_Mk200_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_F"]) then { _show = _armsDealer; };
	//if (_x in ["I_Heli_Transport_02_F"] && life_donator < 4) then { _show = false; };
	if (_show) then
	{
		if (isClass (configFile >> "CfgMagazines" >> _x)) then {_name = getText(configFile >> "CfgMagazines" >> _x >> "displayName")} else {
			if (isClass (configFile >> "CfgVehicles" >> _x)) then { _name = getText(configFile >> "CfgVehicles" >> _x >> "displayName"); }
			else { _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName"); };
		};
		_recipeList lbAdd _name;
		_recipeList lbSetdata [(lbSize _recipeList)-1, _x];
		if (isClass (configFile >> "CfgMagazines" >> _x)) then { _pic = getText(configFile >> "CfgMagazines" >> _x >> "picture"); } else {
			if (isClass (configFile >> "CfgVehicles" >> _x)) then { _pic = getText(configFile >> "CfgVehicles" >> _x >> "picture"); }
			else { _pic = getText(configFile >> "CfgWeapons" >> _x >> "picture"); };
		};
		_recipeList lbSetPicture [(lbSize _recipeList)-1, _pic];
	};
} foreach _recipes;

_name = switch (_factory) do
{
	case "weapons": {"Firearm Production Factory"};
	case "vehicles": {"Vehicle Production Factory"};
	case "blackmarket": {"Black Market Production"};
	default { "Factory Production" };
};
(_display displayCtrl 1835) ctrlSetText _name;

lbSetCurSel [1850, 0];