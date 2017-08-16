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
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones","_methZones","_frogZones","_muschelZones","_pilsZones","_goldZones","_uranZones","_schrottZones","_maisZones","_zuckerZones","_atomZones"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4"];
_peachZones = ["peaches_1","peaches_2","peaches_3","peaches_4"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];
_methZones = ["meth_1"];
_frogZones = ["frog_1"];
_goldZones = ["gold_1"];
_muschelZones = ["muschel_1"];
_uranZones = ["atomarea_1"];
_pilsZones = ["pils_1"];
_schrottZones = ["schrott_area"];
_maisZones = ["mais_area"];
_zuckerZones = ["zucker_area"];
_atomZones = ["atom_area"];

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction['Äpfel Sammeln',life_fnc_gatherApples,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction['Pfirsiche Sammeln',life_fnc_gatherPeaches,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create gold zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_gold = player addAction['Golderz Sammeln',life_fnc_gathergold,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_gold;"];
} foreach _goldZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction['Heroin Sammeln',life_fnc_gatherHeroin,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction['Cannabis Sammeln',life_fnc_gatherCannabis,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create meth zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Meth = player addAction['Methzutaten stehlen',life_fnc_gatherMeth,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Meth;"];
} foreach _methZones;

//Create frog zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_frog = player addAction['Frösche Sammeln',life_fnc_gatherfrog,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_frog;"];
} foreach _frogZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction['Kokain Sammeln',life_fnc_gatherCocaine,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;

//Create muschel zones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_muschel = player addAction['Sammle Muscheln',life_fnc_gathermuschel,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_muschel;"];
} foreach _muschelZones;

//Create uran zones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_brennstab = player addAction['Klaue Brennstäbe',life_fnc_gatherUran,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_brennstab;"];
} foreach _uranZones;

//Create pils zones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_pils = player addAction['Sammle Hopfen',life_fnc_gatherpils,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_pils;"];
} foreach _pilsZones;

//Create schrott zones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_schrott = player addAction['Sammle Baumaterialien',life_fnc_gatherschrott,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_schrott;"];
} foreach _schrottZones;

//Create mais zones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_mais = player addAction['Sammle Mais',life_fnc_gathermais,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_mais;"];
} foreach _maisZones;

//Create zucker zones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_zucker = player addAction['Sammle Zucker',life_fnc_gatherzucker,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_zucker;"];
} foreach _zuckerZones;

//Create atomzones
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[50,50,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
_zone setTriggerStatements["player in thislist","LIFE_Action_atom = player addAction['Sammle Radioaktive Elemente',life_fnc_gatheratom,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_atom;"];
} foreach _atomZones;