disableSerialization;
if (lbCurSel 2005 == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst"};
private _item = lbData [2005, lbCurSel 2005];
private _target = [] call GTA_fnc_cursorTarget;

switch true do {
  case (_item in ["roadcone", "roadcone_l", "bargate", "safetybarrier", "plasticbarrier_l", "plasticbarrier_m", "cargohouse_g", "cargohouse_b", "cargopost_g", "cargopost_b", "cargohq_g", "cargohq_b", "cargotower_g", "cargotower_b", "portablelight_s", "portablelight_d", "roadsign", "streetlamp", "concretebarrier_s", "concretebarrier_l", "tapebarrier", "target1", "target1_pop", "target2", "target2_pop", "target3", "target3_pop", "target4", "target4_pop", "shoot_house_stand", "shoot_house_crouch", "shoot_house_prone"]): {
    if ([] call GTA_fnc_isMilitary || {[] call GTA_fnc_isHATO} || {[] call GTA_fnc_isCop}) then {
      if ([false, _item, 1] call life_fnc_handleInv) then {
        [_item] call GTA_fnc_buildGuide;
        closeDialog 1;
      };
    } else {
      hint "You are not allowed to construct objects.";
    };
  };

  case (_item in ["water", "coffee", "kfc_pepsi"]): {
    if ([false, _item, 1] call life_fnc_handleInv) then {
      GTA_thirst = 100;
      life_drink = 0;
    };
  };

  case (_item == "boltcutter"): {
    [_target] spawn GTA_fnc_itemBoltcutter;
    closeDialog 0;
  };

  case (_item == "drill"): {
    [_target] spawn GTA_fnc_itemDrill;
    closeDialog 0;
  };

  case (_item == "defusekit"): {
    [_target] spawn life_fnc_defuseKit;
  };

  case (_item in ["storagesmall", "storagebig"]): {
    [_item] call life_fnc_storageBox;
  };

  case (_item == "underwatercharge"): {
    group player reveal gold_safe;
    [_target] spawn life_fnc_underwaterCharge;
  };


  case (_item == "redgull"): {
    hint "Redbull no longer gives you wings. RIP.";
  };

  case (_item == "spikeStrip"): {
    if (!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
    [] spawn life_fnc_spikeStrip;
    closeDialog 1;
  };

  case (_item == "fuelF"): {
    if (vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
    [] spawn life_fnc_jerryRefuel;
    closeDialog 1;
  };

  case (_item == "snapgun");
  case (_item == "lockpick"): {
    [_target] spawn GTA_fnc_itemLockpick;
    closeDialog 1;
  };

  case (_item in ["apple", "rabbit", "salema", "ornate", "mackerel", "tuna", "mullet", "catshark", "donuts", "tbacon", "peach", "watermelon", "salad", "tobacco", "bubblegum", "kitkat", "ration_small", "ration_big", "kfc_popcorn", "kfc_wings", "kfc_bucket", "greggs_sausageroll", "greggs_pasty", "greggs_steakbake", "greggs_sausagebean", "greggs_cheesebacon"]): {
    [_item] call life_fnc_eatFood;
  };

  case (_item == "present"): {
    [500, "XP Reward"] call GTA_fnc_addExp;
    [false, _item, 1] call life_fnc_handleInv;
  };

  case (_item == "cream"): {
    [10, "Mhmm it's so creamy!"] call GTA_fnc_addExp;
    [false, _item, 1] call life_fnc_handleInv;
  };

  case (_item == "marijuana"): {
    if ([false, _item, 1] call life_fnc_handleInv) then {
      [] spawn life_fnc_weed;
      [10, "420 blaze me in jail m9"] call GTA_fnc_addExp;
    };
  };

  case (_item == "team_red"): {
    if ([false, _item, 1] call life_fnc_handleInv) then {
      [] spawn life_fnc_team_red;
      [10, "Welcome on the Red Team"] call GTA_fnc_addExp;
    };
  };

  case (_item == "team_blue"): {
    if ([false, _item, 1] call life_fnc_handleInv) then {
      [] spawn life_fnc_team_blue;
      [10, "Welcome on the Blue Team"] call GTA_fnc_addExp;
    };
  };

  case (_item == "kebab"): {
    if ([false, _item, 1] call life_fnc_handleInv) then {
      [] spawn {
        hint "Mhm so fat and greasy!";
        sleep 5;
        hint "Wait, is that a tail!?";
        GTA_hunger = 100;
        sleep 5;
        hint "Mhm, nothing like drinking fat kebab grease.";
        GTA_thirst = 100;
        sleep 5;
        hint "DAYUM THAT WAS GOOD! NOW, WHERE'S THE NEAREST TOILET!?";
        player setFatigue (getFatigue player + 0.5);
      };
    };
  };

  default {
    hint localize "STR_ISTR_NotUsable";
  };
};

[] call life_fnc_p_updateMenu;
