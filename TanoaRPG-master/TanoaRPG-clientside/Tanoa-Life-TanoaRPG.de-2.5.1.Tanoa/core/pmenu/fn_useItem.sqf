/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "You need to select an item first!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): {
		systemChat "Boltcutter-Debug 1";
		if (!isNull cursorTarget) then 
		{
			systemChat "Boltcutter-Debug 2";
			[cursorTarget] spawn tanoarpg_fnc_boltcutter;
		}
		else
		{
			systemChat "Boltcutter-Debug 3";
			if ((player distance dome) <= 5) then 
			{
				systemChat "Boltcutter-Debug 4";
				[dome] spawn tanoarpg_fnc_boltcutter;
			};
			if ((player distance rsb) <= 5) then 
			{
				systemChat "Boltcutter-Debug 5";
				[rsb] spawn tanoarpg_fnc_boltcutter;
			};
		};
		systemChat "Boltcutter-Debug 6";
		closeDialog 0;
	};
	
	case (_item == "einsatzschild"): {
		if(playerSide != west) exitWith {hint "Du bist kein Polizist, zum Benutzen brauchst du eine Spezialausrüstung und eine Sonderausbildung !!"};
		if(life_Einsatzschild) exitWith {hint "Du kannst keine zwei Einsatzschilder gleichzeitig benutzen !!"};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_einsatzschild;
		};
	};
	
	case (_item == "defibrilator"): {
		_Target = cursorTarget;
		if((isNull _Target) || !(_Target isKindOf "Man") || (alive _Target) || ((player distance _Target) > 2)) then
		{
			_Target = ObjNull;
			for [{_i=2},{_i<=10},{_i=_i+2}] do
			{
				_nearDead = [];
				_nears = (player nearObjects ["Man", _i]);
				{
					if((_x != player) && (!alive _x)) then
					{
						_nearDead pushBack _x;
					};
				} forEach _nears;
				
				_nearestDead = ObjNull;
				if((count _nearDead) > 0) then
				{
					{
						if(isNull _nearestDead) then
						{
							_nearestDead = _x;
						} else {
							if((player distance _x) < (player distance _nearestDead)) then
							{
								_nearestDead = _x;
							};
						};
					} forEach _nearDead;
				};
				if(!isNull _nearestDead) exitWith { _Target = _nearestDead };
			};
		};
		
		if(!isNull _Target) then
		{
			[_Target, player] spawn tanoarpg_fnc_useDefibrilator;
		} else {
			hint "Kein Toter in 10 Meter Reichweite";
		};
		closeDialog 0;
	};
	
	case (_item == "painkillers"):
	{
		if(vehicle player != player) exitWith {hint "Du kannst dich nicht in einem Fahrzeug heilen..."};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			player setDamage 0;
			player setFatigue 0;
			player allowDamage true;
			player enableSimulation true;
			closeDialog 0;
			hint "Die Schmerzmittel haben gewirkt! Du hast nun wieder volles Leben."
		};
	};
	
	case (_item == "morphium"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Du bist im Dienst !"};
		if(vehicle player != player) exitWith {hint "Du kannst dich nicht in einem Fahrzeug heilen..."};
		if(([false,_item,1]call tanoarpg_fnc_handleInv)) then
		{
			player setFatigue 1;
			player setDamage 0;
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.1;
			life_thirst = life_thirst - 65;
			life_hunger = life_hunger - 75;
			if (life_drink < 0.08) exitWith {};
			[] spawn tanoarpg_fnc_drinkwhiskey;
			closeDialog 0;
		};
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn tanoarpg_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn tanoarpg_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call tanoarpg_fnc_storageBox;
	};
	
	case (_item == "battery"):
	{
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			life_battery = 100;
			hint "Deine Battery ist nun auf 100%.";
		};
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			life_thirst = 100;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Deine Durchblutung nimmt zu und du schießt für 4 Minuten genauer.","PLAIN"];
				player setUnitRecoilCoefficient 0.8;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (4 * 60))};
				player setUnitRecoilCoefficient 1;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband in der Hand."};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_spikeStrip;
		};
	};
	
	case (_item == "mauer"):
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst schon eine Strassensperre auf!"};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_mauer;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Du befindest Dich in einem Fahrzeug"};
		[] spawn tanoarpg_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn tanoarpg_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call tanoarpg_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn tanoarpg_fnc_pickAxeUse;
	};
	
	case (_item =="bottledwhiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn tanoarpg_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn tanoarpg_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="hmillegal"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Illegaler Alkohol kann im Dienst nicht getrunken werden.";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.09;
			if (life_drink < 0.09) exitWith {};
			[] spawn tanoarpg_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="hmbottled"):
	{
		//if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.09) exitWith {};
			[] spawn tanoarpg_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn tanoarpg_fnc_drinkbeer;
		};
	};
	
	case (_item == "methp"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_useMeth;
			[] spawn tanoarpg_fnc_drugsSmoke;
		};
	};
	
	case (_item == "heroinp"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_useHeroin;
		};
	};
	
	case (_item == "cocainep"):
	{
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_useKokain;
		};
	};
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_useMarihuana;
			[] spawn tanoarpg_fnc_drugsSmoke;
		};
	};
	
	case (_item == "uwsl"):
	{
		_OBJ = nearestObject [player, "Land_Wreck_Traw_F"];
		
		if (_OBJ==objNull) then
		{
			_OBJ = nearestObject [player, "Land_Wreck_Traw2_F"];
		};

		if (("Land_Wreck_Traw_F" == typeOf _OBJ) OR ("Land_Wreck_Traw2_F" == typeOf _OBJ) && (player distance _OBJ < 30)) then
		{
			if (!([false,_item,1] call life_fnc_handleInv)) exitWith { hint "Error: Object not found"; };
			_ship = _OBJ getVariable ["opened", false];
			_ship_obj = _OBJ;
			if (_ship) then { hint "Das Schiff wurde bereits geoeffnet!" };
			if (!_ship) then {
				hint "The charge has been planted! Get away from the shipwreck!";
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _ship_obj];
				sleep 10;
				"M_NLAW_AT_F" createVehicle [getPos _ship_obj select 0, getPos _ship_obj select 1, 0];
				schiffwoffen = true;
				publicVariableServer "schiffwoffen";
			};
		};
	};
	
	default
	{
		hint "Du kannst diesen Gegenstand nicht benutzen.";
	};
};
	
[] call tanoarpg_fnc_p_updateMenu;
[] call tanoarpg_fnc_hudUpdate;