/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item","_blocked"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Du musst zuerst einen Gegenstand auswählen!";};

_blocked = ((player getVariable ["gagged",false]) OR (player getVariable ["restrained",false]) OR (player getVariable ["restrainedciv",false]));

_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item in ["water","coffee","redgull"]):
	{
		[_item] call EMonkeys_fnc_eatDrink;
	};	
	
	case (_item == "obstsalat"):
	{
		if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
		{
			EMonkeys_thi164 = 100;
			EMonkeys_hu164 = 100;
			player setFatigue 0;
			[] spawn
			{
				eM_redgull_effect = time;
				titleText["Ich fühle mich energiegeladen.","PLAIN"];
				player enableFatigue false;
				waitUntil {((!alive player) || (player getVariable["onkill",FALSE])) OR ((time - eM_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	// Changes by Mario
	case ((_item isEqualTo "cocainep" )  || (_item isEqualTo "flush" )):
	{
		if(_blocked) exitWith {};
		if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
		{
			[] spawn EMonkeys_fnc_cocaineUse;
		};
	};
	
	case (_item == "blastingcharge"): 
	{
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn EMonkeys_fnc_blastingCharge;
		if (typeof cursorTarget in ["CargoNet_01_box_F"] && player distance cursorTarget < 3.5) then
		{
		[cursorTarget] spawn EMonkeys_fnc_blastingChargekiste;
		};
	};
	
	
	case (_item == "joints"):
	{
		if(_blocked) exitWith {};
		if(EMonkeys_drugged_weed == 1) then {
			hint "Du rauchst doch schon einen Joint!";
		} else {
			if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
			{
				[] spawn EMonkeys_fnc_weedUse;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(_blocked) exitWith {};
		if(!isNull eM_spikestrip) exitWith {hint "Du hast bereits ein Nagelband ausgelegt."};
		if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
		{
			[] spawn EMonkeys_fnc_spikeStrip;
		};
	};
	case (_item == "mauer"):
	{
		if(_blocked) exitWith {};
		if(!((["adac"] call EMonkeys_fnc_permLevel) > 1 || playerSide in [west,independent])) exitWith {hint "Du bist nicht erfahren genug dafür. "};
		if(!isNull EMonkeys_mauer) exitWith {hint "Du stellst schon eine Mauer!"};
		if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
		{
			[] spawn EMonkeys_fnc_mauer;
		};
	};
	
	case (_item == "kegel"):
	{
		if(_blocked) exitWith {};
		if(!((["adac"] call EMonkeys_fnc_permLevel) > 1 || playerSide in [west,independent])) exitWith {hint "Du bist nicht erfahren genug dafür. "};
		if(!isNull EMonkeys_kegel) exitWith {hint "Du stellst schon ein Kegel!"};
		if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
		{
			[] spawn EMonkeys_fnc_kegel;
		};
	};
	
	case (_item in ["fuelcan_super","fuelcan_superplus","fuelcan_diesel","fuelcan_biodiesel","fuelcan_kerosin"]):
	{
		if(vehicle player != player) exitWith {hint "Du kannst kein Fahrzeug betanken, während du dich darin befindest!"};
		[_item] spawn EMonkeys_fnc_fuelCanFull;
	};

	
	case (_item == "lockpick"):
	{
		if(_blocked) exitWith {};
		[] spawn EMonkeys_fnc_lockpick;
	};
	
	case (_item in ["apple","pear","banana","cherry","lemon","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call EMonkeys_fnc_eatFood;
	};
	
	case "fishing":
	{
		[] spawn fnc_fishing;
	};
	
	case (_item == "pickaxe"):
	{
		hint "Bitte benutze die Windowstaste!";
	};
	
	case (_item == "pumpe"):
	{
		hint "Bitte benutze die Windowstaste!";
	};
	
	case (_item == "battery"):
	{
		if(([false,_item,1] call EMonkeys_fnc_handleInv)) then
		{
			EMonkeys_bat164 = 100;
			hint "Dein Handy ist nun wieder voll aufgeladen!";
		};
	};
	
	case (_item in ["furniture_01", "furniture_02", "furniture_03", "furniture_04", "furniture_05"]):
	{
		[_item] spawn EMonkeys_fnc_houseUseFurniture;
	};
	
	case (_item == "defusekit"): 
	{
		[cursorTarget] spawn EMonkeys_fnc_defuseKit;
	};
	
	case (_item =="bottledwhiskey"):
	{
		if(_blocked) exitWith {};
		if(playerSide in [west,independent]) exitWith {hint "Kein Alkohol im Dienst";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint "Du hast schon etwas Alkohol getrunken";};
		[_item] call EMonkeys_fnc_eatDrink;
	};
	
	case (_item =="bottledshine"):
	{	
		if(_blocked) exitWith {};
		if(playerSide in [west,independent]) exitWith {hint "Kein Alkohol im Dienst";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint "Du hast schon etwas Alkohol getrunken";};
		[_item] call EMonkeys_fnc_eatDrink;
	};
	
	case (_item =="bottledbeer"):
	{
		if(_blocked) exitWith {};
		if(playerSide in [west,independent]) exitWith {hint "Kein Alkohol im Dienst";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint "Du hast schon etwas Alkohol getrunken";};
		[_item] call EMonkeys_fnc_eatDrink;
	};
	
	case (_item == "gpstracker"):   
	{ 
		closeDialog 0;
		createDialog "EMonkeys_gpsTrackerDialog";
	};
	case (_item == "gpsscanner"):   
	{        
		[cursorTarget] spawn EMonkeys_fnc_gpsScannerOpen; 
	};
	default
	{
		hint "Dieses Item ist nicht nutzbar";
	};
};
	
[] call EMonkeys_fnc_p_updateMenu;
[] call EMonkeys_fnc_hudUpdate;