/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_bank", "_create", "_zone", "_zoneSize", "_marker" ];
_bank = [ _this, 0, "", [""] ] call GTA_fnc_param;
_create = [ _this, 1, true, [true] ] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgBanks" >> _bank;

//--- Error checks
if ( _bank == "" ) exitWith {};

//--- Zone config
_zone = getNumber ( _cfg >> "zone" );
_zoneSize = getArray ( _cfg >> "zoneSize" );

//--- Exit if zone is disabled
if ( _zone <= 0 ) exitWith {};

//--- Marker name
_marker = format [ "bank_%1_zone", _bank ];

//--- Delete marker
deleteMarker _marker;

if ( _create ) then {
  //--- Create marker
  _marker = createMarker [ _marker, position _building ];
  _marker setMarkerShape "ELLIPSE";
  _marker setMarkerBrush "FDiagonal";
  _marker setMarkerColor "ColorBlue";
  _marker setMarkerSize _zoneSize;
};
