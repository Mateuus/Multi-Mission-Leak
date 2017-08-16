removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_O_Protagonist_VR";
for "_i" from 1 to 5 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 29 do {player addItemToUniform "6Rnd_45ACP_Cylinder";};
player addVest "V_TacVest_blk";
player addBackpack "B_Parachute";
player addHeadgear "H_HelmetSpecO_blk";
player addGoggles "G_Goggles_VR";

player addWeapon "hgun_Pistol_heavy_02_F";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles_OPFOR";

life_carryWeight = 0;
[true,"redgull",3] call life_fnc_handleInv; 
life_carryWeight = 0;
[true,"kfc_wings",3] call life_fnc_handleInv; 
life_carryWeight = 0;