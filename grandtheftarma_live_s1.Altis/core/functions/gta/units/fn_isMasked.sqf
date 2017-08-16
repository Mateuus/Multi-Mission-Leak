/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith { false };

//--- Condition
( goggles _unit in ( GTA_masks select 0 )
||
{ headgear _unit in ( GTA_masks select 1 ) }
||
{ uniform _unit in ( GTA_masks select 2 ) } )
