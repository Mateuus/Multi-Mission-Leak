[] call XY_fnc_stripDownPlayer;

player addUniform "U_C_Poor_1";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[] call XY_fnc_saveGear;