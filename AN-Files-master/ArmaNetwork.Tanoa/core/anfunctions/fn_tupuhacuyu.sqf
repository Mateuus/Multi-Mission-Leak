#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if((lbCurSel 1501) isEqualTo -1) exitWith {hintSilent "You didn't select an item you wanted to give.";};
_item = CONTROL_DATA(1501);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if([_item,1] call life_fnc_virtualItemRemove) then {
			closeDialog 0;
			life_thirst = 5000;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if((_item isEqualTo "redgull") && {(getNumber (missionConfigFile >> "Life_Settings" >> "enable_fatigue")) isEqualTo 1}) then {
				if(life_redgull_effect isEqualTo 0) then {
					[] spawn {
						life_redgull_effect = time;
						titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
						player enableFatigue false;
						//player setCustomAimCoef 0;
						[player,"drink",30] remoteExecCall ["life_fnc_quvucamaph",-2];
						waitUntil {!alive player OR ((time - life_redgull_effect) > (15 * 60))};
						player enableFatigue true;
						life_redgull_effect = 0;
					};
				};
				life_redgull_effect = time;
			};
		};
	};

	case (_item in ["beer","vodka","whiskey"]): {
		if(([_item,1] call life_fnc_virtualItemRemove)) then {
			closeDialog 0;
			life_thirst = 5000;
			[_item] call life_fnc_vaswucehag;
		};
	};
	case (EQUAL(_item,"boltcutter")): {
		closeDialog 0;
		[cursorObject] spawn life_fnc_boltcutter;
	};

	case (EQUAL(_item,"blastingcharge")): {
		if(vehicle player != player) exitWith {hintSilent "In a vehicle?";};
		closeDialog 0;
		[cursorObject] call life_fnc_tanedraswuwam;
	};

	case(EQUAL(_item,"empcharge")): {
		if(vehicle player != player) exitWith {hintSilent "In a vehicle?";};
		closeDialog 0;
		["EMPPROGRESS"] remoteExecCall ["life_fnc_drath",west];
		[cursorObject] call life_fnc_drajukegecast;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_objectPlacing) exitWith {hintSilent localize "STR_ISTR_SpikesDeployment"};
		if!(playerside isEqualTo west) exitWith {hintSilent "You don't have the spikestrip deploy kit"};
		if(([_item,1] call life_fnc_virtualItemRemove)) then {
			[] call life_fnc_drubrafrep;
			closeDialog 0;
		};
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hintSilent localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
		closeDialog 0;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
		closeDialog 0;

	};

	case (_item in ["apple","rabbit_grilled","donut","tbacon","peach","mre"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([_item,1] call life_fnc_virtualItemRemove) then {
				closeDialog 0;
				_val = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 5000): {life_hunger = 5000;};
					[player,"eat",45] remoteExecCall ["life_fnc_quvucamaph",-2];
					default {life_hunger = _sum;};
				};
			};
		};
	};

	case (EQUAL(_item,"marijuana")): {
		if([_item,1] call life_fnc_virtualItemRemove) then {
			closeDialog 0;
			call life_fnc_puwrebrecr;
		};
	};

	case (EQUAL(_item,"heroinp")): {
		if([false,_item,1] call life_fnc_virtualItemRemove) then	{
			closeDialog 0;
			call life_fnc_sucatuswuw;
		};
	};

	case (EQUAL(_item,"cocainep")): {
		if([_item,1] call life_fnc_virtualItemRemove) then	{
			closeDialog 0;
			call life_fnc_theyespeve;
		};
	};

	case (EQUAL(_item,"methp")): {
		if ([false,_item,1] call life_fnc_virtualItemRemove) then	{
			closeDialog 0;
			call life_fnc_drusweyadus;
		};
	};

	case (EQUAL(_item,"magicmushrooms")): {
		if ([false,_item,1] call life_fnc_virtualItemRemove) then	{
			closeDialog 0;
			call life_fnc_wakespacred;
		};
	};
	default {
		hintSilent localize "STR_ISTR_NotUsable";
	};
};
