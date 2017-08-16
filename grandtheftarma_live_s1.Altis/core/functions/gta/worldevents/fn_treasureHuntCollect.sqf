/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_santa", objNull, [objNull]]
];

//--- Action
if ([7 + random 7, "Collecting Reward", nil, {!isNull _this && {player distance _this < 4} && {isNull (_this getVariable ["winner", objNull])}}, _santa] call GTA_fnc_action) then {
  //--- Set winner
  _santa setVariable ["winner", player, true];

  //--- Weighted rewards
  private _message = "";
  private _weight = random 1;
  switch true do {
    //--- Kajman (0.01%)
    case (_weight >= 0.9999): {
      [getPlayerUID player, civilian, "O_Heli_Attack_02_black_F", 0] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Kajman (Black) has been added to your civilian air garage.";
    };

    //--- GM6 Lynx (0.1%)
    case (_weight >= 0.999): {
      //--- Claim weapon action
      player addAction ["<t color='#ff8800'>Claim GM6 Lynx</t>", {
        if (["Claiming this weapon will replace your current primary weapon and backpack.<br /><br />Are you sure you wish to continue?", "Warning", "Yes", "No"] call BIS_fnc_guiMessage) then {
          player addWeapon "srifle_GM6_F";
          player addPrimaryWeaponItem "optic_lrps";
          removeBackpack player;
          player addBackpack "B_Carryall_cbr";
          for "_i" from 1 to 5 do {player addItemToBackpack "5Rnd_127x108_Mag"};
          for "_i" from 1 to 5 do {player addItemToBackpack "5Rnd_127x108_APDS_Mag"};
          player removeAction (_this select 2);
        };
      }];

      _message = "You have won a GM6 Lynx. Please use the scroll menu to claim it.";
    };

    //--- Huron + Huron Cargo Container (0.2%)
    case (_weight >= 0.998): {
      [getPlayerUID player, civilian, "B_Heli_Transport_03_unarmed_F", 0] remoteExec ["GTA_fnc_insertVehicle", 2];
      [getPlayerUID player, civilian, "B_Slingload_01_Cargo_F", 0] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Huron + Huron Cargo Cotainer has been added to your civilian air garage.";
    };

    //--- Zafir (0.3%)
    case (_weight >= 0.997): {
      //--- Claim weapon action
      player addAction ["<t color='#ff8800'>Claim Zafir</t>", {
        if (["Claiming this weapon will replace your current primary weapon and backpack.<br /><br />Are you sure you wish to continue?", "Warning", "Yes", "No"] call BIS_fnc_guiMessage) then {
          player addWeapon "LMG_Zafir_F";
          player addPrimaryWeaponItem "150Rnd_762x54_Box";
          removeBackpack player;
          player addBackpack "B_Carryall_cbr";
          for "_i" from 1 to 4 do {player addItemToBackpack "150Rnd_762x54_Box"};
          player removeAction (_this select 2);
        };
      }];

      _message = "You have won a Zafir. Please use the scroll menu to claim it.";
    };

    //--- Strider (0.4%)
    case (_weight >= 0.996): {
      [getPlayerUID player, civilian, "I_MRAP_03_F", 0] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Strider has been added to your civilian garage.";
    };

    //--- TWS Scope (0.5%)
    case (_weight >= 0.995): {
      //--- Claim weapon item action
      player addAction ["<t color='#ff8800'>Claim TWS Scope</t>", {
        if (player canAdd "optic_tws") then {
          player addItem "optic_tws";
          player removeAction (_this select 2);
        } else {
          ["You do not have enough space in your inventory to claim this item.", "Warning", nil, nil] call BIS_fnc_guiMessage
        };
      }];

      _message = "You have won a TWS Scope. Please use the scroll menu to claim it.";
    };

    //--- M320 LRR (0.6%)
    case (_weight >= 0.994): {
      //--- Claim weapon action
      player addAction ["<t color='#ff8800'>Claim M320 LRR</t>", {
        if (["Claiming this weapon will replace your current primary weapon and backpack.<br /><br />Are you sure you wish to continue?", "Warning", "Yes", "No"] call BIS_fnc_guiMessage) then {
          player addWeapon "srifle_LRR_F";
          player addPrimaryWeaponItem "optic_lrps";
          removeBackpack player;
          player addBackpack "B_Carryall_cbr";
          for "_i" from 1 to 10 do {player addItemToBackpack "7Rnd_408_Mag"};
          player removeAction (_this select 2);
        };
      }];

      _message = "You have won a M320 LRR. Please use the scroll menu to claim it.";
    };

    //--- VR Suit (1.0%)
    case (_weight >= 0.99): {
      //--- Claim uniform action
      player addAction ["<t color='#ff8800'>Claim Red VR Suit</t>", {
        if (["Claiming this VR Suit will replace your current uniform.<br /><br />Are you sure you wish to continue?", "Warning", "Yes", "No"] call BIS_fnc_guiMessage) then {
          player forceAddUniform "U_O_Protagonist_VR";
          player removeAction (_this select 2);
        };
      }];

      _message = "You have won a Red VR Suit. Please use the scroll menu to claim it.";
    };

    //--- Jet (1.5%)
    case (_weight >= 0.985): {
      [getPlayerUID player, civilian, "O_Plane_CAS_02_F", 0] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A To-199 Neophron has been added to your civilian air garage.";
    };

    //--- Taru (Cargo) (2.0%)
    case (_weight >= 0.98): {
      [getPlayerUID player, civilian, "O_Heli_Transport_04_box_F", 0] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Taru (Cargo) has been added to your civilian air garage.";
    };

    //--- £4m (2.5%)
    case (_weight >= 0.975): {
      GTA_money_bank = GTA_money_bank + 4000000;
      [1] call GTA_fnc_updatePlayerPartial;
      _message = "£4,000,000 has been added to your bank account.";
    };

    //--- £2m (3.0%)
    case (_weight >= 0.97): {
      GTA_money_bank = GTA_money_bank + 2000000;
      [1] call GTA_fnc_updatePlayerPartial;
      _message = "£2,000,000 has been added to your bank account.";
    };

    //--- Sport Hatchback (Skin) (3.5%)
    case (_weight >= 0.965): {
      [getPlayerUID player, civilian, "C_Hatchback_01_sport_F", [8, 9, 10, 11, 12] call BIS_fnc_selectRandom] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Rare Themed Hatchback (Sport) has been added to your civilian garage.";
    };

    //--- HEMTT box (4.0%)
    case (_weight >= 0.96): {
      [getPlayerUID player, civilian, "B_Truck_01_box_F", 2] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A HEMTT Box has been added to your civilian garage.";
    };

    //--- £1.5m (5.0%)
    case (_weight >= 0.95): {
      GTA_money_bank = GTA_money_bank + 1500000;
      [1] call GTA_fnc_updatePlayerPartial;
      _message = "£1,500,000 has been added to your bank account.";
    };

    //--- £750k (6.0%)
    case (_weight >= 0.94): {
      GTA_money_bank = GTA_money_bank + 750000;
      [1] call GTA_fnc_updatePlayerPartial;
      _message = "£750,000 has been added to your bank account.";
    };

    //--- Redbull Zamack (7.0%)
    case (_weight >= 0.93): {
      [getPlayerUID player, civilian, "I_Truck_02_covered_F", 2] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Redbull Zamack has been added to your civilian garage.";
    };

    //--- Jurassic Park SUV (10.0%)
    case (_weight >= 0.90): {
      [getPlayerUID player, civilian, "C_SUV_01_F", 12] remoteExec ["GTA_fnc_insertVehicle", 2];
      _message = "A Jurassic Park SUV has been added to your civilian garage.";
    };

    //--- £500k (15.0%)
    case (_weight >= 0.85): {
      GTA_money_bank = GTA_money_bank + 500000;
      [1] call GTA_fnc_updatePlayerPartial;
      _message = "£500,000 has been added to your bank account.";
    };

    //--- £250k (20.0%)
    case (_weight >= 0.80): {
      GTA_money_bank = GTA_money_bank + 250000;
      [1] call GTA_fnc_updatePlayerPartial;
      _message = "£250,000 has been added to your bank account.";
    };

    //--- XP rewards
    default {
      private _count = 10 + (round random 10);
      [true, "present", _count] call life_fnc_handleInv;
      _message = format ["You have received %1 XP rewards, open your inventory to use them.", _count];
    };
  };

  //--- Message
  titleText [_message, "PLAIN"];

  //--- Log
  [[format ["[Treasure Hunt Reward] UID: %1 | CHANCE: %2%3", getPlayerUID player, (1 - _weight) * 100, "%"]], "GTA_fnc_log", false] call GTA_fnc_remoteExec;
};
