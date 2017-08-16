/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver"}; //Drivers License cost
			case "boat": {_var = "license_civ_boat"}; //Boating license cost
			case "pilot": {_var = "license_civ_air"}; //Pilot/air license cost
			case "fly": {_var = "license_civ_fly"}; //Pilot/air license cost
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			case "lotse": {_var = "license_civ_lotse"};
			case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "license_civ_gang"}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "hack": {_var = "license_civ_hack"}; //Rebel License
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "cement": {_var = "license_civ_cement"};
			case "mair": {_var = "license_med_air"};
			case "mboat": {_var = "license_med_boat"};
			case "aair": {_var = "license_adac_air"};
			case "home": {_var = "license_civ_home"};
			case "gruppe": {_var = "license_civ_gruppe"};
			case "presse": {_var = "license_civ_presse"};
			case "altisair": {_var = "license_civ_altisair"};
			case "esc": {_var = "license_civ_esc"};
			case "ims": {_var = "license_civ_ims"};
			case "lud": {_var = "license_civ_lud"};
			case "pm": {_var = "license_civ_pm"};	
			case "imf": {_var = "license_civ_imf"};
			case "slg": {_var = "license_civ_slg"};
			case "liquor": {_var = "license_civ_liquor"};
			case "beer": {_var = "license_civ_liquor"};
			case "stiller": {_var = "license_civ_stiller"};
			case "whiskey": {_var = "license_civ_stiller"};
			case "moonshine": {_var = "license_civ_stiller"};
			case "mash": {_var = "license_civ_stiller"};
			case "bottledshine": {_var = "license_civ_bottler"};
			case "bottledbeer": {_var = "license_civ_bottler"};
			case "bottledwhiskey": {_var = "license_civ_bottler"};
			case "kakao": {_var = "license_civ_bottler"};
			case "bottler": {_var = "license_civ_bottler"};
			case "hunter": {_var = "license_civ_hunter"};
			case "plutonium": {_var = "license_civ_plutonium"};
			case "holz": {_var = "license_civ_holz"};
			case "holz2": {_var = "license_civ_holz"};
			case "holz3": {_var = "license_civ_holz"};
			case "plastik": {_var = "license_civ_oil"};
			case "president": {_var = "license_civ_president"};
			case "ausweis": {_var = "license_civ_ausweis"};
			case "radio": {_var = "license_civ_radio"};
			case "archo": {_var = "license_civ_archo"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver"}; //Drivers License cost
			case "license_civ_boat": {_var = "boat"}; //Boating license cost
			case "license_civ_air": {_var = "pilot"}; //Pilot/air license cost
			case "license_civ_fly": {_var = "fly"}; //Pilot/air license cost
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_civ_lotse": {_var = "lotse"};
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_cement": {_var = "cement"};
			case "license_med_air": {_var = "mair"};
			case "license_med_boat": {_var = "mboat"};
			case "license_adac_air": {_var = "aair"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_gruppe": {_var = "gruppe"};
			case "license_civ_presse": {_var = "presse"};
			case "license_civ_altisair": {_var = "altisair"};
			case "license_civ_esc": {_var = "esc"};
			case "license_civ_ims": {_var = "ims"};
			case "license_civ_lud": {_var = "lud"};
			case "license_civ_pm": {_var = "pm"};
			case "license_civ_imf": {_var = "imf"};
			case "license_civ_slg": {_var = "slg"};
			case "license_civ_liquor": {_var = "liquor"};
			case "license_civ_liquor": {_var = "beer"};
			case "license_civ_stiller": {_var = "stiller"};
			case "license_civ_stiller": {_var = "whiskey"};
			case "license_civ_stiller": {_var = "moonshine"};
			case "license_civ_stiller": {_var = "mash"};
			case "license_civ_bottler": {_var = "bottledshine"};
			case "license_civ_bottler": {_var = "bottledbeer"};
			case "license_civ_bottler": {_var = "bottledwhiskey"};
			case "license_civ_bottler": {_var = "bottler"};
			case "license_civ_bottler": {_var = "glassbottle"};
			case "license_civ_hunter": {_var = "hunter"};
			case "license_civ_plutonium": {_var = "plutonium"};
			case "license_civ_holz": {_var = "holz"};
			case "license_civ_holz": {_var = "holz2"};
			case "license_civ_holz": {_var = "holz3"};
			case "license_civ_oil": {_var = "plastik"};
			case "license_civ_president": {_var = "president"};
			case "license_civ_ausweis": {_var = "ausweis"};
			case "license_civ_radio": {_var = "radio"};
			case "license_civ_archo": {_var = "archo"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;