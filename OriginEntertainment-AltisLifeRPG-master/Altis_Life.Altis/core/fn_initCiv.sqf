/*
        File: fn_initCiv.sqf
        Author: Bryan "Tonic" Boardwine
       
        Description:
        Initializes the civilian.
*/
private["_spawnPos"];
 
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
 
waitUntil {!(isNull (findDisplay 46))};
 
if (!life_is_alive) then 
{
	[] spawn life_fnc_INFO;
	waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
	waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

        [] call life_fnc_spawnMenu;
        waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
        waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
        life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
} else {
        if(life_is_arrested) then
        {
				[] spawn life_fnc_INFO;
				waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
				waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.
                life_is_arrested = false;
                [player,true] spawn life_fnc_jail;
        } else {
				[] spawn life_fnc_INFO;
				waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
				waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.
                player setPos civ_position;
                hint format["Your character is still alive. You have been placed at your last saved position."];
        };     
        life_is_alive = true;
};
player addRating 9999999;

[] spawn
{
    while {true} do
    {
        waitUntil {backpack player == "B_HuntingBackpack"};
        (unitbackpack player) setObjectTextureGlobal [0, "textures\murica_bag.jpg"]; 
        waitUntil {backpack player != "B_HuntingBackpack"}; 
    };
};

[] call life_fnc_Uniformscolor;