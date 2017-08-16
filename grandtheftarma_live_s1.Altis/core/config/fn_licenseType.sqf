/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call GTA_fnc_param;
_mode = [_this,1,-1,[0]] call GTA_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver"};
			case "boat": {_var = "license_civ_boat"};
			case "pilot": {_var = "license_civ_air"};
			case "gun": {_var = "license_civ_gun"};
			case "dive": {_var = "license_civ_dive"};
			case "oil": {_var = "license_civ_oil"};
			case "heroin": {_var = "license_civ_heroin"};
			case "marijuana": {_var = "license_civ_marijuana"};
			case "rebel": {_var = "license_civ_rebel"};
			case "truck":{_var = "license_civ_truck"};
			case "diamond": {_var = "license_civ_diamond"};
			case "wood": {_var = "license_civ_wood"};
      case "gas": {_var = "license_civ_gas"};
			case "salt": {_var = "license_civ_salt"};
			case "sugar": {_var = "license_civ_sugar"};
			case "cmeth": {_var = "license_civ_cmeth"};
			case "rice": {_var = "license_civ_rice"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "silver": {_var = "license_civ_silver"};
			case "cement": {_var = "license_civ_cement"};
			case "home": {_var = "license_civ_home"};

			case "beer": {_var = "license_civ_beer"};
			case "whiskey": {_var = "license_civ_whiskey"};
			case "bootleg": {_var = "license_civ_bootleg"};

			case "advrebel": {_var = "license_civ_advrebel"};
			case "jet": {_var = "license_civ_jet"};
			case "bomb": {_var = "license_civ_bomb"};
			case "event": {_var = "license_civ_event"};
			case "press": {_var = "license_civ_press"};
			case "taxi": {_var = "license_civ_taxi"};

      case "sru": {_var = "license_cop_sru"};
      case "npas": {_var = "license_cop_npas"};
      case "dmt": {_var = "license_cop_dmt"};
      case "mpu": {_var = "license_cop_mpu"};

      case "kav": {_var = "license_cop_kav"};
      case "pyr": {_var = "license_cop_pyr"};
      case "ath": {_var = "license_cop_ath"};
      case "rpu": {_var = "license_cop_rpu"};

			default {_var = ""};
		};
	};

	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver"};
			case "license_civ_boat": {_var = "boat"};
			case "license_civ_air": {_var = "pilot"};
			case "license_civ_gun": {_var = "gun"};
			case "license_civ_dive": {_var = "dive"};
			case "license_civ_oil": {_var = "oil"};
			case "license_civ_heroin": {_var = "heroin"};
			case "license_civ_marijuana": {_var = "marijuana"};
			case "license_civ_rebel": {_var = "rebel"};
			case "license_civ_truck":{_var = "truck"};
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_wood": {_var = "wood"};
      case "license_civ_gas": {_var = "gas"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_sugar": {_var = "sugar"};
			case "license_civ_cmeth": {_var = "cmeth"};
			case "license_civ_rice": {_var = "rice"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_silver": {_var = "silver"};
			case "license_civ_cement": {_var = "cement"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_advrebel": {_var = "advrebel"};
			case "license_civ_jet": {_var = "jet"};
			case "license_civ_bomb": {_var = "bomb"};
			case "license_civ_event": {_var = "event"};
			case "license_civ_press": {_var = "press"};
			case "license_civ_taxi": {_var = "taxi"};

			case "license_civ_beer": {_var = "whiskey"};
			case "license_civ_whiskey": {_var = "whiskey"};
			case "license_civ_bootleg": {_var = "bootleg"};

      case "license_cop_sru": {_var = "sru"};
      case "license_cop_npas": {_var = "npas"};
      case "license_cop_dmt": {_var = "dmt"};
      case "license_cop_mpu": {_var = "mpu"};

      case "license_cop_kav": {_var = "kav"};
      case "license_cop_pyr": {_var = "pyr"};
      case "license_cop_ath": {_var = "ath"};
      case "license_cop_rpu": {_var = "rpu"};

			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;
