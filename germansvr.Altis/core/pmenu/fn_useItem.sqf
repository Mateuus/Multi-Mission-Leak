#include "..\..\script_macros.hpp"
/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if ((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
    case (_item in ["waterBottle","coffee","redgull"]): {
        if ([false,_item,1] call life_fnc_handleInv) then {
            life_thirst = 100;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
            if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 0;};
            if (_item isEqualTo "redgull" && {LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1}) then {
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
    };

    case (_item isEqualTo "boltcutter"): {
        [cursorObject] spawn life_fnc_boltcutter;
        closeDialog 0;
    };

    case (_item isEqualTo "blastingcharge"): {
        player reveal fed_bank;
        (group player) reveal fed_bank;
        [cursorObject] spawn life_fnc_blastingCharge;
        closeDialog 0;
    };

    case (_item isEqualTo "defusekit"): {
        [cursorObject] spawn life_fnc_defuseKit;
        closeDialog 0;
    };

    case (_item isEqualTo "storagesmall"): {
        [false] call life_fnc_storageBox;
    };

    case (_item isEqualTo "storagebig"): {
        [true] call life_fnc_storageBox;
    };

    case (_item isEqualTo "spikeStrip"): {
        if (!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"; closeDialog 0};
        if ([false,_item,1] call life_fnc_handleInv) then {
            [] spawn life_fnc_spikeStrip;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "fuelFull"): {
        if (vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
        [] spawn life_fnc_jerryRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
        [] spawn life_fnc_jerryCanRefuel;
        closeDialog 0;
    };

	case (_item isEqualTo "schmerzmittel"): {
		if ([false,_item,1] call life_fnc_handleInv) then {
		player setDamage 0;
		[player,"schmerzmittel"] remoteExec ["life_fnc_say3D",RANY];
		};
	};

	case (_item isEqualTo "pflaster"): {
		if ([false,_item,1] call life_fnc_handleInv) then {
		player setDamage 0;
		};
	};
		
	case (_item isEqualTo "bruchschiene"): {
		if ([false,_item,1] call life_fnc_handleInv) then {
		player setDamage 0;
		};
		
	};
	
	case (_item isEqualTo "mullbinde"): {
		if ([false,_item,1] call life_fnc_handleInv) then {
		player setDamage 0;
		};
	};	
	case (_item isEqualTo "morphium"): {
		if ([false,_item,1] call life_fnc_handleInv) then {
		player setDamage 0;
		};
	};	
	
    case (_item isEqualTo "lockpick"): {
        [] spawn life_fnc_lockpick;
        closeDialog 0;
    };

    case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
				[player,"eat"] remoteExec ["life_fnc_say3D",RANY];
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
	case (_item isEqualTo "bier"): { 
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";}; 
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then { 
			if(isNil "life_drink") then {
				life_drink = 0;
			}; 
			//Wenn ihr das Bier trinkt, dann habe ihr also 0.15 Promille
			life_drink = life_drink + 0.15; 
			if (life_drink < 0.2) exitWith {}; 
			[] spawn life_fnc_drinkbeer; 
		}; 
	};
	case (_item isEqualTo "evidencebag"): {
		if ([false,_item,1] call life_fnc_handleInv) then {
			[] spawn life_fnc_evidenceBag;
		};
	};
	
	/* Schablone Blaupause
	case (_item isEqualTo ""): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_type,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
		}; 
	};
	*/
	//Blaupausen
	case (_item isEqualTo "bp_mxc"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mx"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mxm"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mk14"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mk18"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mk1"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mar10"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mk200mg"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_mk200mg"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_lynx"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_sln9mm"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_sln556"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_sln65"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_sln762"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_sniperoptic"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};
	case (_item isEqualTo "bp_bipod"): {
		if(playerSide in [west,independent]) exitWith {hint "Du musst ein Zivilist sein um das zu lernen."};
		if (LICENSE_VALUE(_item,"civ")) then { 
			hint "Du hast diese Blaupause schon gelesen.";
		} else {
			_varName = M_CONFIG(getText,"Licenses",_item,"variable");
			_varName = LICENSE_VARNAME(_varName,"civ");
			SVAR_MNS [_varName,true];
			[false,_item,1]call life_fnc_handleInv;
		}; 
	};

    default {
        hint localize "STR_ISTR_NotUsable";
    };
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;