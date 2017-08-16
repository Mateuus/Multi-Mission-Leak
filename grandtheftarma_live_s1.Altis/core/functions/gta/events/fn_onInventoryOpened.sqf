/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (count _this == 1) exitWith {false};

params ["_unit", "_container"];
private _handled = false;

{
  switch true do {
    //--- Backpack
    case (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "isBackpack") == 1 && playerSide != west): {
      hintC localize "STR_MISC_Backpack";
      _handled = true;
    };

    //--- House container
    case (typeOf _x in ["Box_IND_Grenades_F", "B_supplyCrate_F"]): {
      private "_house";
      _house = _x getVariable ["house", objNull];

      if (isNull _house) exitWith {
        hint "An issue has occured. Please report this to a member of staff as soon as possible.";
      };

      if (!(_house in life_vehicles) && {_house getVariable ["locked", false]}) then {
        hintC localize "STR_House_ContainerDeny";
        _handled = true;
      };
    };

    //--- Vehicles
    case ([_x, ["Car", "Air", "Ship", "Tank", "Slingload_01_Base_F"]] call GTA_fnc_isKindOf): {
      if (!(_x in life_vehicles)) then {
        hintC localize "STR_MISC_VehInventory";
        _handled = true;
      };
    };

    //--- Bodies
    case (_x isKindOf "Man" && (!alive _x || {_x getVariable ["incapacitated", false]})): {
      hintC "You are not allowed to loot bodies.";
      _handled = true;
    };
  };

  if (_handled) exitWith {};
} forEach [_container] + (player nearSupplies 6);

if (!_handled) then {
  [] spawn {
    //--- Custom inventory controls
    disableSerialization;
    waitUntil {!isNull findDisplay 602};
    private _display = findDisplay 602;

    //--- Repack button
    private _btnRepack = _display ctrlCreate ["RscActivePictureKeepAspect", 6999];
    _btnRepack ctrlSetPosition [
      36.8 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2),
      1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2),
      1 * (((safezoneW / safezoneH) min 1.2) / 40),
      1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)
    ];
    _btnRepack ctrlCommit 0;
    _btnRepack ctrlSetTextColor [1, 1, 1, 0.7];
    _btnRepack ctrlSetText "\A3\ui_f\data\igui\cfg\actions\reammo_ca.paa";
    _btnRepack ctrlSetTooltip "Repack Magazines";
    _btnRepack ctrlAddEventHandler ["ButtonClick", {
      _this spawn {
        disableSerialization;
        params ["_control"];
        //--- Close the inventory GUI
        ctrlParent _control closeDisplay 1;
        if ([20, "Repacking Magazines", nil, {alive player}] call GTA_fnc_action) then {
          [player] call GTA_fnc_repackMagazines;
        };
      };
    }];

    //--- Magic fix
    private _btnMagic = _display ctrlCreate ["RscActivePictureKeepAspect", 7000];
    _btnMagic ctrlSetPosition [
      35.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2),
      1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2),
      1 * (((safezoneW / safezoneH) min 1.2) / 40),
      1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)
    ];
    _btnMagic ctrlCommit 0;
    _btnMagic ctrlSetTextColor [1, 1, 1, 0.7];
    _btnMagic ctrlSetText "textures\icons\wand.paa";
    _btnMagic ctrlSetTooltip "Magic Fix (Fixes the naked bug)";
    _btnMagic ctrlAddEventHandler ["ButtonClick", {
      _this spawn {
        disableSerialization;
        params ["_control"];

        if (["Fix the naked bug?", nil, "Yes", "No"] call BIS_fnc_guiMessage) then {
          //--- Close the inventory GUI
          ctrlParent _control closeDisplay 1;

          //--- Re-equip the player
          player setUnitLoadout getUnitLoadout player;
          [[player, uniform player, uniformContainer player], "GTA_fnc_setUnitTextures"] call GTA_fnc_remoteExec;
          hint "Abracadabra!";
        };
      };
    }];
  };
};

_handled
