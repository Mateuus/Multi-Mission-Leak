if (isNil "life_clothesPurchased") exitWith {
    life_clothing_purchase = [-1,-1,-1,-1,-1];
    if !(life_oldClothes isEqualTo "") then {player addUniform life_oldClothes;} else {removeUniform player};
    if !(life_oldHat isEqualTo "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
    if !(life_oldGlasses isEqualTo "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (life_oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            clearAllItemsFromBackpack player;
            if (count life_oldBackpackItems > 0) then {
                {
                    [_x,true,true] call life_fnc_handleItem;
                    true
                } count life_oldBackpackItems;
            };
        };
    };

    if (count life_oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call life_fnc_handleItem;
            true
        } count life_oldUniformItems;
    };

    if (vest player != "") then {
        if (life_oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest life_oldVest;
            if (count life_oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call life_fnc_handleItem;
                    true
                } count life_oldVestItems;
            };
        };
    };
    [] call life_fnc_playerSkins;
};
life_clothesPurchased = nil;

//Check uniform purchase.
if ((life_clothing_purchase select 0) isEqualTo -1) then {
    if (life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if ((life_clothing_purchase select 1) isEqualTo -1) then {
    if (life_oldHat != headgear player) then {
        if (life_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear life_oldHat;
        };
    };
};
//Check glasses
if ((life_clothing_purchase select 2) isEqualTo -1) then {
    if (life_oldGlasses != goggles player) then {
        if (life_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles life_oldGlasses;
        };
    };
};
//Check Vest
if ((life_clothing_purchase select 3) isEqualTo -1) then {
    if (life_oldVest != vest player) then {
        if (life_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest life_oldVest;
            {
                [_x,true,false,false,true] call life_fnc_handleItem;
                true
            } count life_oldVestItems;
        };
    };
};

//Check Backpack
if ((life_clothing_purchase select 4) isEqualTo -1) then {
    if (life_oldBackpack != backpack player) then {
        if (life_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            {
                [_x,true,true] call life_fnc_handleItem;
                true
            } count life_oldBackpackItems;
        };
    };
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
[] call life_fnc_saveGear;