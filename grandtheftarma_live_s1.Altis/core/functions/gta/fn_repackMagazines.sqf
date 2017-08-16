/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_unit", player, [objNull]]
];

private _repacked = [];

//--- Loop through all magazines
{
  private _magazine = _x;

  if !(_magazine in _repacked) then {
    private _magazineSize = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
    private _ammoCount = 0;

    if (_magazineSize > 1) then {
      //--- Collect the number of rounds
      {
        if (_x select 0 == _magazine) then {
          _ammoCount = _ammoCount + (_x select 1);
        };
      } forEach magazinesAmmo _unit;

      //--- Remove all existing magazines
      _unit removeMagazines _magazine;

      //--- Repack
      while {_ammoCount > 0} do {
        private _magazineAmmo = _ammoCount min _magazineSize;
        _unit addMagazine [_magazine, _magazineAmmo];
        _ammoCount = _ammoCount - _magazineAmmo;
      };
    };

    //--- Add to repacked magazines
    _repacked pushBack _x;
  };
} forEach magazines _unit;
