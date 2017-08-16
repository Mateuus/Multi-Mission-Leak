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
			case "cair2": {_var = "license_civ_air2"}; //Pilot/air license cost
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "swat": {_var = "license_cop_swat"}; //Swat License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			case "adf" : {_var = "license_cop_adf"}; // A.D.F
			case "mrsf_cop" : {_var = "license_cop_mrsf"}; // A.D.F
			case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "meth": {_var = "license_civ_meth"}; //meth neu
			case "sense":{_var = "license_civ_sense"};
			case "silber": {_var = "license_civ_silber"}; 
			case "zigaretten": {_var = "license_civ_zigaretten"}; 
			case "wein": {_var = "license_civ_wein"}; 
			case "sprengstoff": {_var = "license_civ_sprengstoff"}; 
			case "zigarren": {_var = "license_civ_zigarren"}; 
			case "lsd": {_var = "license_civ_lsd"}; 
			case "gang": {_var = "license_civ_gang"}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "bm": {_var = "license_civ_bm"};//schwarzmarkt
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "cement": {_var = "license_civ_cement"};
			case "arch": {_var = "license_civ_arch"}; //Archäologenschein
			case "mair": {_var = "license_med_air"};
			case "home": {_var = "license_civ_home"};
			case "gold": {_var = "license_civ_gold"};
			case "sschmuck": {_var = "license_civ_sschmuck"};
			case "gschmuck": {_var = "license_civ_gschmuck"};
			case "dutyfree": {_var = "license_civ_dutyfree"};
			case "luftfracht": {_var = "license_civ_luftfracht"};
			case "fracht": {_var = "license_civ_fracht"};
			case "aufenthalt": {_var = "license_civ_aufenthalt"};
			case "arbeitsgenehmigung": {_var = "license_civ_arbeitsgenehmigung"};
			case "muell": {_var = "license_civ_muell"};
			case "whinc": {_var = "license_civ_whinc"};
			case "zafir": {_var = "license_civ_zafir"};
			case "marten": {_var = "license_civ_marten"};
			case "lynx": {_var = "license_civ_lynx"};
			case "lrr": {_var = "license_civ_lrr"};	
			case "spar17": {_var = "license_civ_spar17"};
			case "akm": {_var = "license_civ_akm"};			//Wh Inc
			case "ak12": {_var = "license_civ_ak12"};
			case "plastik": {_var = "license_civ_plastik"};
			case "stahl": {_var = "license_civ_stahl"};
			case "lotto": {_var = "license_civ_lotto"};	   //lotto
			case "mrsf": {_var = "license_civ_mrsf"};			//mrsf
			case "pizza": {_var = "license_civ_pizza"};
			case "cc": {_var = "license_civ_cc"};
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
			case "license_civ_air2": {_var = "pilot2"}; //Pilot/air license cost
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_swat": {_var = "swat"}; //Swat License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_cop_adf" : {_var = "adf"}; // A.D.F
			case "license_cop_mrsf" : {_var = "mrsf_cop"}; // A.D.F
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "license_civ_meth": {_var = "meth"}; //meth neu
			case "license_civ_sense": {_var = "sense"};
			case "license_civ_silber": {_var = "silber"}; 
			case "license_civ_zigaretten": {_var = "zigaretten"}; 
			case "license_civ_wein": {_var = "wein"}; 
			case "license_civ_sprengstoff": {_var = "sprengstoff"}; 
			case "license_civ_zigarren": {_var = "zigarren"}; 
			case "license_civ_lsd": {_var = "lsd"}; 
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_bm": {_var = "bm"};
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_cement": {_var = "cement"};
			case "license_civ_arch": {_var = "arch"}; //Archäologenschein
			case "license_med_air": {_var = "mair"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_gold": {_var = "gold"};
			case "license_civ_sschmuck": {_var = "sschmuck"};
			case "license_civ_gschmuck": {_var = "gschmuck"};
			case "license_civ_dutyfree": {_var = "dutyfree"};
			case "license_civ_luftfracht": {_var = "luftfracht"};
			case "license_civ_fracht": {_var = "fracht"};
			case "license_civ_aufenthalt": {_var = "aufenthalt"};
			case "license_civ_arbeitsgenehmigung": {_var = "arbeitsgenehmigung"};
			case "license_civ_muell" :{_var = "muell"};
			case "license_civ_whinc" :{_var = "whinc"}; //Wh Inc
			case "license_civ_zafir" :{_var = "zafir"}; 
			case "license_civ_marten" :{_var = "marten"}; 
			case "license_civ_lynx" :{_var = "lynx"}; 
			case "license_civ_lrr" :{_var = "lrr"}; 
			case "license_civ_ak12" :{_var = "ak12"}; 
			case "license_civ_akm" :{_var = "akm"}; 
			case "license_civ_spar17" :{_var = "spar17"}; 
			case "license_civ_plastik": {_var = "plastik"};
			case "license_civ_stahl": {_var ="stahl"};
			case "license_civ_lotto": {_var ="lotto"};
			case "license_civ_mrsf": {_var ="mrsf"};
			case "license_civ_pizza": {_var ="pizza"};
			case "license_civ_cc": {_var ="cc"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;