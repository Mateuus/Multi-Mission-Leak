/*
    File: fn_medicLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceaddUniform "U_I_CombatUniform";
player addHeadgear "H_MilCap_blue";
player addBackpack "B_Bergen_blk";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["ToolKit",1];
mybackpack addItemCargoGlobal ["Medikit",1];
mybackpack addItemCargoGlobal ["NVGoggles",1];


//[[player,0,"Texturen\Kleidung\medic\medic_uniform.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;




[] call life_fnc_saveGear;