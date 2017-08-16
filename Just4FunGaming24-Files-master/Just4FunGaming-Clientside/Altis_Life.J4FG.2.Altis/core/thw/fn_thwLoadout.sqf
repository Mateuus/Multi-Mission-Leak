// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

[] call XY_fnc_stripDownPlayer;

player forceAddUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";

player addBackpack "B_TacticalPack_rgr";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[] call XY_fnc_saveGear;