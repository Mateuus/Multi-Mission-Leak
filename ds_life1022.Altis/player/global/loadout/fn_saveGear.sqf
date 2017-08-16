private ["_return","_uniformItems","_uniformMags","_vestItems","_vestMags","_backpackItems","_backpackMags","_primaryItems","_handgunItems","_secondaryItems","_yInventoryItems","_canAddToUniform","_canAddToVest","_canAddToBackpack","_primaryMag","_handgunMag","_secondaryMag"];

_return = [];

if(playerSide isEqualTo west)then {
    if(DS_sharpShooter isEqualTo 0)then {
        _return pushBack (uniform player);
    } else {
        _return pushBack DS_sharpShooterUniform;
    };
} else {
    _return pushBack (uniform player);
};

//_return pushBack (uniform player);
_return pushBack (vest player);
_return pushBack (backpack player);
_return pushBack (goggles player);
_return pushBack (headgear player);
_return pushBack (assignedItems player);
_return pushBack (primaryWeapon player);
_return pushBack (handgunWeapon player);
_return pushBack (secondaryWeapon player);

_uniformItems = [];
_uniformMags  = [];
_vestItems = [];
_vestMags  = [];
_backpackItems = [];
_backpackMags  = [];
_primaryItems = [];
_handgunItems = [];
_secondaryItems = [];
_yInventoryItems = [];

//Save the player's uniform items & mags
if(!((uniform player) isEqualTo ""))then {
    {
        if(_x in (magazines player))then {
            _uniformMags pushBack _x;
        } else {
            _uniformItems pushBack _x;
        };
    } forEach (uniformItems player);
};

//Save the player's vest items & mags
if(!((vest player) isEqualTo ""))then {
    {
        if(_x in (magazines player))then {
            _vestMags pushBack _x;
        } else {
            _vestItems pushBack _x;
        };
    } forEach (vestItems player);
};

//Save the player's backpack items & mags
if(!((backpack player) isEqualTo ""))then {
    {
        if(_x in (magazines player))then {
            _backpackMags pushBack _x;
        } else {
            _backpackItems pushBack _x;
        };
    } forEach (backpackItems player);
};

//Save the player's loaded primary weapon magazine
if((count (primaryWeaponMagazine player) > 0)&&(alive player))then {
    _primaryMag = ((primaryWeaponMagazine player) select 0);

    if(!(_primaryMag isEqualTo ""))then {
        _canAddToUniform = player canAddItemToUniform _primaryMag;
        _canAddToVest = player canAddItemToVest _primaryMag;
        _canAddToBackpack = player canAddItemToBackpack _primaryMag;
        _handled = false;

        if(_canAddToVest)then {
            _vestMags pushBack _primaryMag;
            _handled = true;
        };

        if((_canAddToUniform)&&(!(_handled)))then {
            _uniformMags pushBack _primaryMag;
            _handled = true;
        };

        if((_canAddToBackpack)&&(!(_handled)))then {
            _backpackMags pushBack _primaryMag;
            _handled = true;
        };
    };
};

//Save the player's loaded handgun magazine
if((count (handgunMagazine player) > 0)&&(alive player))then {
    _handgunMag = ((handgunMagazine player) select 0);

    if (!(_handgunMag isEqualTo "")) then {
        _canAddToUniform = player canAddItemToUniform _handgunMag;
        _canAddToVest = player canAddItemToVest _handgunMag;
        _canAddToBackpack = player canAddItemToBackpack _handgunMag;
        _handled = false;

        if(_canAddToVest)then {
            _vestMags pushBack _handgunMag;
            _handled = true;
        };

        if((_canAddToUniform)&&(!(_handled)))then {
            _uniformMags pushBack _handgunMag;
            _handled = true;
        };

        if((_canAddToBackpack)&&(!(_handled)))then {
            _backpackMags pushBack _handgunMag;
            _handled = true;
        };
    };
};

//Save the player's loaded secondary weapon magazine
if((count (secondaryWeaponMagazine player) > 0)&&(alive player))then {
    _secondaryMag = ((secondaryWeaponMagazine player) select 0);

    if (!(_secondaryMag isEqualTo "")) then {
        _canAddToUniform = player canAddItemToUniform _secondaryMag;
        _canAddToVest = player canAddItemToVest _secondaryMag;
        _canAddToBackpack = player canAddItemToBackpack _secondaryMag;
        _handled = false;

        if(_canAddToVest)then {
            _vestMags pushBack _secondaryMag;
            _handled = true;
        };

        if((_canAddToUniform)&&(!(_handled)))then {
            _uniformMags pushBack _secondaryMag;
            _handled = true;
        };

        if((_canAddToBackpack)&&(!(_handled)))then {
            _backpackMags pushBack _secondaryMag;
            _handled = true;
        };
    };
};

//Save the player's primary weapon attachments
if(count (primaryWeaponItems player) > 0)then {
    {
        _primaryItems pushBack _x;
    } forEach (primaryWeaponItems player);
};

//Save the player's handgun attachments
if(count (handgunItems player) > 0)then {
    {
        _handgunItems pushBack _x;
    } forEach (handgunItems player);
};

//Save the player's secondary weapon attachments
if(count (secondaryWeaponItems player) > 0)then {
    {
        _secondaryItems pushBack _x;
    } forEach (secondaryWeaponItems player);
};

//Save the player's Y inventory items
if(playerSide isEqualTo civilian)then {
    {
    	_amount = missionNamespace getVariable [format ["DS_item_%1",_x],0];

    	if(_amount > 0)then {
            _yInventoryItems pushBack [_x,_amount];
    	};
    } forEach DS_itemArraySavable;
};

_return pushBack _uniformItems;
_return pushBack _uniformMags;
_return pushBack _vestItems;
_return pushBack _vestMags;
_return pushBack _backpackItems;
_return pushBack _backpackMags;
_return pushBack _primaryItems;
_return pushBack _handgunItems;
_return pushBack _secondaryItems;
_return pushBack _yInventoryItems;

DS_gear = _return;