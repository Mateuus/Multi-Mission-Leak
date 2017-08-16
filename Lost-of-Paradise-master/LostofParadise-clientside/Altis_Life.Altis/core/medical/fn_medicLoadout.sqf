/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_C_WorkerCoveralls";
player addHeadgear "H_Cap_red";
player addBackpack "B_Carryall_cbr";
player addItem "Medikit";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";

if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
[[player,0,"textures\medic_uniform.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP;

[] call life_fnc_saveGear;