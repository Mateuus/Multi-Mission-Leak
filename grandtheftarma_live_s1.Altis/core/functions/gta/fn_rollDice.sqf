/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_chance", "_dice" ];
_chance = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_dice = random 100;

( _dice < _chance )
