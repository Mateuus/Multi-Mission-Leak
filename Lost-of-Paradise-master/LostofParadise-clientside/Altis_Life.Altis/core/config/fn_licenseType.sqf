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
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "swat": {_var = "license_cop_swat"}; //Swat License cost
			case "admin2": {_var = "license_cop_admin2"}; //Swat License cost
			case "zoll": {_var = "license_cop_zoll"}; //Swat License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "license_civ_gang"}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "schmuck": {_var = "license_civ_schmuck"};
			case "badcocaine": {_var = "license_civ_badcocaine"};
			case "krokodile": {_var = "license_civ_krokodile"};
			case "meth": {_var = "license_civ_meth"};
			case "gold": {_var = "license_civ_gold"};
			case "frog": {_var = "license_civ_frog"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "muschel": {_var = "license_civ_muschel"};
			case "pils": {_var = "license_civ_pils"};
			case "copper": {_var = "license_civ_copper"};
			case "silber": {_var = "license_civ_silber"};
			case "radioaktiv": {_var = "license_civ_radioaktiv"};
			case "legierung": {_var = "license_civ_legierung"};
			case "bleiglas": {_var = "license_civ_bleiglas"};
			case "bhc": {_var = "license_civ_bhc"};
			case "admin1": {_var = "license_civ_admin1"};
			case "uran": {_var = "license_civ_uran"};
			case "atomwaffe": {_var = "license_civ_atomwaffe"};
			case "donator1": {_var = "license_civ_donator1"};
			case "dm": {_var = "license_civ_dm"};
			case "ar": {_var = "license_civ_leer"};
			case "ssg": {_var = "license_civ_ssg"};
			case "x": {_var = "license_civ_x"};
			case "kartell": {_var = "license_civ_kartell"};
			case "presse": {_var = "license_civ_presse"};
			case "kerosin": {_var = "license_civ_kerosin"};
			case "cement": {_var = "license_civ_cement"};
			case "mair": {_var = "license_med_air"};
			case "home": {_var = "license_civ_home"};
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
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_swat": {_var = "swat"}; //Swat License cost
			case "license_cop_admin2": {_var = "admin2"}; //Swat License cost
			case "license_cop_zoll": {_var = "zoll"}; //Swat License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_schmuck": {_var = "schmuck"};
			case "license_civ_badcocaine": {_var = "badcocaine"};
			case "license_civ_krokodile": {_var = "krokodile"};
			case "license_civ_meth": {_var = "meth"};
			case "license_civ_muschel": {_var = "muschel"};
			case "license_civ_pils": {_var = "pils"};
			case "license_civ_gold": {_var = "gold"};
			case "license_civ_frog": {_var = "frog"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_radioaktiv": {_var = "radioaktiv"};
			case "license_civ_silber": {_var = "silber"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_donator1": {_var = "donator1"};
			case "license_civ_bhc": {_var = "bhc"};
			case "license_civ_bleiglas": {_var = "bleiglas"};
			case "license_civ_legierung": {_var = "legierung"};
			case "license_civ_ssg": {_var = "ssg"};
			case "license_civ_x": {_var = "x"};
			case "license_civ_kartell": {_var = "kartell"};
			case "license_civ_admin1": {_var = "admin1"};
			case "license_civ_dm": {_var = "dm"};
			case "license_civ_leer": {_var = "ar"};
			case "license_civ_kerosin": {_var = "kerosin"};
			case "license_civ_uran": {_var = "uran"};
			case "license_civ_atomwaffe": {_var = "atomwaffe"};
			case "license_civ_cement": {_var = "cement"};
			case "license_med_air": {_var = "mair"};
			case "license_civ_home": {_var = "home"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;