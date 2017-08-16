/*
	File: fn_gather.sqf
	Auth&&: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality f&& gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_extra"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","diamond_1","lead_1","iron_1","salt_1","sand_1","oil_2","rock_1","muell_1","ausgrabung_1","meth_1","silber_1","zigaretten_1","wein_1","sprengstoff_1","zigarren_1","lsd_1","gold_1","baumwolle_1","baumwolle_1_1","kohle_1"];
_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
if (player getVariable ["restrained", true]) exitWith {};
if (animationState player == "AmovPercMstpSnonWnonDnon_Ease" || animationState player == "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"|| animationState player == "AovrPercMstpSnonWnonDf" ||  player getVariable["surrender",FALSE]) exitWith {}; 
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 75) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};
//level
_extra = 0;
_iextra = 0;
if(life_erfahrung >=2000) then {_extra = 1;};
if(life_erfahrung >=6375) then {_extra = 2;};
if(life_erfahrung >=625) then {_iextra = 1;};
if(life_erfahrung >=2400) then {_iextra = 3;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3 + _extra;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3 + _extra;};
	case (_zone in ["wein_1"]): {_gather = "weinu"; _val = 3 + _extra;};
	case (_zone in ["baumwolle_1","baumwolle_1_1"]): {_gather = "baumwolle"; _val = 3 + _extra;};
	case (_zone in ["muell_1"]): {_gather =""; []call life_fnc_gathermuell;};
	
	//illegales auf Levelsystem
	case (_zone in ["sprengstoff_1"]): {_gather = "sprengstoffu"; _val = 3 + _iextra;};
	case (_zone in ["lsd_1"]): { _gather = "lsdu"; _val = 3 + _iextra;};
	case (_zone in ["zigaretten_1"]): { _gather = "zigarettenu"; _val = 3 + _iextra;};
	case (_zone in ["meth_1"]):{ _gather = "methu"; _val = 3 + _iextra;};
	case (_zone in ["weed_1"]):{ _gather = "cannabis"; _val = 3 + _iextra;};
	case (_zone in ["heroin_1"]):{ _gather = "heroinu"; _val = 3 + _iextra;};
	case (_zone in ["cocaine_1"]):{ _gather = "cocaine"; _val = 3 + _iextra;};
	
	//Windowstaste abbauen. Bed. Schaufel
	case (_zone in ["ausgrabung_1"]): 
	{
		if(life_inv_schaufel > 0 OR life_inv_bauschaufel > 0 ) then
		{ 
		_gather =""; []call life_fnc_gatherausgrabung;
		} 
			else 
			{
			_gather ="";
			hint "Du benötigst eine Schaufel um hier nach Schätzen zu graben.";
			};
	};
	//Glas / Sand
	case (_zone in ["sand_1"]): 
	{
			if(life_inv_bauschaufel > 0) then { _gather = "sand"; _val = 6 + _extra;};
			if(life_inv_schaufel > 0) then { _gather = "sand"; _val = 3 + _extra;};
			if(life_inv_schaufel < 1 && life_inv_bauschaufel < 1) then {hint "Du benötigst eine Schaufel um hier zu buddeln.";};

	};
	
	// Windowstaste abbauen. Bed. Pickaxe
	case (_zone in ["diamond_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "diamond"; _val = 6 + _extra;};
			if(life_inv_pickaxe > 0) then { _gather = "diamond"; _val = 3 + _extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um Diamanten abbauen zu können";};
	};
	//kupfer
	case (_zone in ["lead_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "copperore"; _val = 6 +_extra;};
			if(life_inv_pickaxe > 0) then { _gather = "copperore"; _val = 3 +_extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};
	//silber
	case (_zone in ["silber_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "silberu"; _val = 6 +_extra;};
			if(life_inv_pickaxe > 0) then { _gather = "silberu"; _val = 3 +_extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
			
	};
	//gold
	case (_zone in ["gold_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "goldu"; _val = 6 +_extra;};
			if(life_inv_pickaxe > 0) then { _gather = "goldu"; _val = 3 +_extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};
	//eisen
	case (_zone in ["iron_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "ironore"; _val = 6 +_extra;};
			if(life_inv_pickaxe > 0) then { _gather = "ironore"; _val = 3 +_extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};
	//salz
	case (_zone in ["salt_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "salt"; _val = 6 + _extra;};
			if(life_inv_pickaxe > 0) then { _gather = "salt"; _val = 3 + _extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};

	//öl
	case (_zone in ["oil_2"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "oilu"; _val = 6 + _extra;};
			if(life_inv_pickaxe > 0) then { _gather = "oilu"; _val = 3 + _extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};
	//stein
	case (_zone in ["rock_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "rock"; _val = 6 + _extra;};
			if(life_inv_pickaxe > 0) then { _gather = "rock"; _val = 3 + _extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};
	case (_zone in ["kohle_1"]): 
	{
			if(life_inv_presslufthammer > 0) then { _gather = "kohle"; _val = 6 + _extra;};
			if(life_inv_pickaxe > 0) then { _gather = "kohle"; _val = 3 + _extra;};
			if(life_inv_pickaxe < 1 && life_inv_presslufthammer < 1) then {hint "Du benötigst eine Spitzhacke um hier abbauen zu können";};
	};
	default {""};
};

//gather check??
if(vehicle player != player) exitWith {};
if (_gather == "") exitWith{};
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	//level
	if(life_erfahrung<=2400) then {life_erfahrung = life_erfahrung +1;
	systemChat "+1 EXP";};
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
[] call life_fnc_hudUpdate;
