/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4"];
_peachZones = ["peaches_1","peaches_2","peaches_3"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","lhm_Action_Apples = player addAction[(localize ""STR_Gather_Apples""),lhm_fnc_gather,'',0,false,false,'','!lhm_action_inUse'];","player removeAction lhm_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","lhm_Action_Peaches = player addAction[(localize ""STR_Gather_Peaches""),lhm_fnc_gather,'',0,false,false,'','!lhm_action_inUse'];","player removeAction lhm_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","lhm_Action_heroin = player addAction[(localize ""STR_Gather_Heroin""),lhm_fnc_gather,'',0,false,false,'','!lhm_action_inUse'];","player removeAction lhm_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","lhm_Action_Cannabis = player addAction[(localize ""STR_Gather_Cannabis""),lhm_fnc_gather,'',0,false,false,'','!lhm_action_inUse'];","player removeAction lhm_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","lhm_Action_Coke = player addAction[(localize ""STR_Gather_Cocaine""),lhm_fnc_gather,'',0,false,false,'','!lhm_action_inUse'];","player removeAction lhm_Action_Coke;"];
} foreach _cocaineZones;
