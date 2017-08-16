_weapon = currentWeapon player;
_mags = getArray(configfile >> 'cfgWeapons' >> _weapon >> 'magazines');
_mag = _mags select 0;
player addMagazine _mag;
player addMagazine _mag;
player addMagazine _mag; 