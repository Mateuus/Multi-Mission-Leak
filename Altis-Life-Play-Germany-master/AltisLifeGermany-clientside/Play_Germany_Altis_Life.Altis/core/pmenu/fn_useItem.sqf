#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterbottle","coffee","redgull"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {sleep 3; !alive player OR ((time - life_redgull_effect) > (3 * 60))};
					player enableFatigue true;
				};
			};
		};
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (EQUAL(_item,"marijuana")): {
		[]spawn life_fnc_useMarihuana;
		closeDialog 0;
	};

	case (EQUAL(_item,"cocaine_processed")): {
		[]spawn life_fnc_useKokain2;
		closeDialog 0;
	};

	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"houseIDS")): {
		[cursorTarget] spawn life_fnc_secureHouse;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (EQUAL(_item,"fuel_full")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};

	case (EQUAL(_item,"handcuffkey")): {
		[] spawn life_fnc_handcuffkey;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donut","tbacon","peach","rabbit_grilled"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	case (EQUAL(_item,"pickaxe")): {
		[] spawn life_fnc_usePickAxe;
	};

    case (EQUAL(_item,"ptools")): {
        [] spawn life_fnc_useProspectiveTools;
    };

    case (EQUAL(_item,"shovel")): {
        [] spawn life_fnc_useShovel;
    };

	case (EQUAL(_item,"tracker")): {
        [] spawn life_fnc_tracker;
    };

	case (EQUAL(_item,"vehicleInsurance")): {
        [] spawn PG_fnc_useVehicleInsurance;
    };

	case (EQUAL(_item,"uwsl")): {
		private["_shipObj"];
		_shipObj = (nearestObjects[player, ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"], 30]) select 0;
		if (!isNull _shipObj) then
	    {
	        if (_shipObj getVariable["opened", false]) then
	        {
	            hint "Das Schiff wurde bereits geöffnet!";
	        }
	        else
	        {
                if(([false,_item,1] call life_fnc_handleInv)) then
                {
		            hint "Die Unterwasserbombe wurde platziert. Du solltest etwas Abstand halten!";
		            playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _shipObj];
		            
		            [_shipObj] spawn {
			            sleep 6;
			            //"M_NLAW_AT_F" createVehicle [(getPos (_this select 0) select 0), (getPos (_this select 0) select 1), 0];
						playSound3D ["A3\Sounds_F\sfx\explosion1.wss", _shipObj];
			            schiffwoffen = true;
			            publicVariableServer "schiffwoffen";
		            };
                };
	        };
	    };
    };

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
