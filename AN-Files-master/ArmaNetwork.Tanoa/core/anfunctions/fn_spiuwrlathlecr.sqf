/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_requirement","_classNameOne"];
disableSerialization;
_display = findDisplay 42125;
_control = _this select 0;
_index = _this select 1;
_className = _control lbData _index;
_wIndex = _control lbValue _index;
_basePrice = getNumber(missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
_weaponInfo = [_className] call life_fnc_thagawrepru;
_weaponInfoTwo = [_className] call life_fnc_stecranuyer;
_desc = [(_weaponInfoTwo select 2), ">"] call BIS_fnc_splitString;
_type = (_desc select 0);
_caliber = "";
_misc = "";
_weaponSpAmmoList = (_display displayCtrl 1502);
_weaponSpMuzzleList = (_display displayCtrl 1503);
_weaponSpAccList = (_display displayCtrl 1504);
_weaponSpSightList = (_display displayCtrl 1505);
lbClear _weaponSpAmmoList;
lbClear _weaponSpMuzzleList;
lbClear _weaponSpAccList;
lbClear _weaponSpSightList;

if (count _desc > 1) then {
    _len = count (toArray _type) - 1;
    _type = [_type, 0, _len-4] call BIS_fnc_trimString;
    _len = count (toArray _type) - 1;
    if (([_type, _len] call BIS_fnc_trimString) == "<") then {
        _type = [_type, 0, _len - 1] call BIS_fnc_trimString;
    };
    if ("Launcher" in ([_type, " "] call BIS_fnc_splitString)) then {
        _caliber = [(_desc select 1), 6] call BIS_fnc_trimString;
    }else {
        _caliber = [(_desc select 1), 9] call BIS_fnc_trimString;
    };
    _len = count (toArray _caliber) - 1;
    if (([_caliber, _len] call BIS_fnc_trimString) isEqualTo "/") then {
        _caliber = [_caliber, 0, _len - 5] call BIS_fnc_trimString;
    };
    _caliber = format["<br/>Caliber: <t color='#ffae2b'>%1</t>", _caliber];
    if (count _desc == 4) then {
        _misc = [(_desc select 2), 0, count (toArray (_desc select 2)) - 6] call BIS_fnc_trimString;
        if (_misc isEqualTo "Grenade Launcher") then {
            _misc = format[" <t color='#ffae2b' size='0.70'>(%1 %2)</t>", [(_desc select 3), 9] call BIS_fnc_trimString, _misc];
            _caliber = format["%1%2", _caliber, _misc];
        };
    };
};

_type = format["<br/>Type: <t color='#ffae2b'>%1</t>", _type];
(_display displayCtrl 1101) ctrlSetStructuredText parseText format[
"Name: <t color='#ffae2b'>%1</t><br/>Price: <t color='#27e640'>$%2</t>%3%4",
(_weaponInfoTwo select 1),
[_basePrice] call life_fnc_rupadudejat,
_type,
_caliber
];

_weaponSpAmmoArray = getArray (missionConfigFile >> "CfgShop" >> _className >> "magazines");
_weaponSpMuzzleArray = getArray (missionConfigFile >> "CfgShop" >> _className >> "silencer");
_weaponSpSightArray = getArray (missionConfigFile >> "CfgShop" >> _className >> "sights");
_weaponSpAccArray = getArray (missionConfigFile >> "CfgShop" >> _className >> "items");

if(count _weaponSpAmmoArray isEqualTo 0) then {
  _weaponSpAmmoList lbAdd "No Magazines Found";
  _weaponSpAmmoList lbSetCurSel -1;
  _weaponSpAmmoList ctrlEnable false;
} else {
  _weaponSpAmmoList ctrlEnable true;
  {
    _classNameOne = _x;
		_requirement = getText(missionConfigFile >> "CfgShop" >> _classNameOne >> "requirement" >> str (playerSide));
		if(_requirement isEqualTo "") then {
			_requirement = compile "true";
		} else {
			_requirement = compile _requirement;
		};
		if(call _requirement) then {
      _ammoInfo = [_classNameOne] call life_fnc_thagawrepru;
      _weaponSpAmmoList lbAdd (_ammoInfo select 1);
      _weaponSpAmmoList lbSetPicture [(lbSize _weaponSpAmmoList)-1,(_ammoInfo select 2)];
      _weaponSpAmmoList lbSetData [(lbSize _weaponSpAmmoList)-1,_x];
      _weaponSpAmmoList lbSetValue [(lbSize _weaponSpAmmoList)-1,_ForEachIndex];
      _weaponSpAmmoList lbSetCurSel -1;
    };
  } forEach (_weaponSpAmmoArray);
};

if(count _weaponSpMuzzleArray isEqualTo 0) then {
  _weaponSpMuzzleList lbAdd "No Muzzles Found";
  _weaponSpMuzzleList lbSetCurSel -1;
  _weaponSpMuzzleList ctrlEnable false;
} else {
  _weaponSpMuzzleList ctrlEnable true;
  {
    _classNameOne = _x;
		_requirement = getText(missionConfigFile >> "CfgShop" >> _classNameOne >> "requirement" >> str (playerSide));
		if(_requirement isEqualTo "") then {
			_requirement = compile "true";
		} else {
			_requirement = compile _requirement;
		};
		if(call _requirement) then {
      _muzzleInfo = [_classNameOne] call life_fnc_thagawrepru;
      _weaponSpMuzzleList lbAdd (_muzzleInfo select 1);
      _weaponSpMuzzleList lbSetPicture [(lbSize _weaponSpMuzzleList)-1,(_muzzleInfo select 2)];
      _weaponSpMuzzleList lbSetData [(lbSize _weaponSpMuzzleList)-1,_x];
      _weaponSpMuzzleList lbSetValue [(lbSize _weaponSpMuzzleList)-1,_ForEachIndex];
      _weaponSpMuzzleList lbSetCurSel -1;
    };
  } forEach (_weaponSpMuzzleArray);
};

if(count _weaponSpSightArray isEqualTo 0) then {
  _weaponSpSightList lbAdd "No Sights Found";
  _weaponSpSightList lbSetCurSel -1;
  _weaponSpSightList ctrlEnable false;
} else {
  _weaponSpSightList ctrlEnable true;
  {
    _classNameOne = _x;
		_requirement = getText(missionConfigFile >> "CfgShop" >> _classNameOne >> "requirement" >> str (playerSide));
		if(_requirement isEqualTo "") then {
			_requirement = compile "true";
		} else {
			_requirement = compile _requirement;
		};
		if(call _requirement) then {
      _sightInfo = [_classNameOne] call life_fnc_thagawrepru;
      _weaponSpSightList lbAdd (_sightInfo select 1);
      _weaponSpSightList lbSetPicture [(lbSize _weaponSpSightList)-1,(_sightInfo select 2)];
      _weaponSpSightList lbSetData [(lbSize _weaponSpSightList)-1,_x];
      _weaponSpSightList lbSetValue [(lbSize _weaponSpSightList)-1,_ForEachIndex];
      _weaponSpSightList lbSetCurSel -1;
    };
  } forEach (_weaponSpSightArray);
};

if(count _weaponSpAccArray isEqualTo 0) then {
  _weaponSpAccList lbAdd "No Accessories Found";
  _weaponSpAccList lbSetCurSel -1;
  _weaponSpAccList ctrlEnable false;
} else {
  _weaponSpAccList ctrlEnable true;
  {
    _classNameOne = _x;
		_requirement = getText(missionConfigFile >> "CfgShop" >> _classNameOne >> "requirement" >> str (playerSide));
		if(_requirement isEqualTo "") then {
			_requirement = compile "true";
		} else {
			_requirement = compile _requirement;
		};
		if(call _requirement) then {
      _accInfo = [_classNameOne] call life_fnc_thagawrepru;
      _weaponSpAccList lbAdd (_accInfo select 1);
      _weaponSpAccList lbSetPicture [(lbSize _weaponSpAccList)-1,(_accInfo select 2)];
      _weaponSpAccList lbSetData [(lbSize _weaponSpAccList)-1,_x];
      _weaponSpAccList lbSetValue [(lbSize _weaponSpAccList)-1,_ForEachIndex];
      _weaponSpAccList lbSetCurSel -1;
    };
  } forEach (_weaponSpAccArray);
};
