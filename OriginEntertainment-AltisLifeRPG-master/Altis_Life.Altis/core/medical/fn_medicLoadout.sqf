/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_C_Scientist";
player addBackpack "B_Carryall_cbr";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "Medikit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem	"Chemlight_green";
player addItem	"Chemlight_red";
player addItem	"Chemlight_red";
player addItem	"Chemlight_red";
player addItem	"Chemlight_yellow";
player addItem	"Chemlight_blue";

[[player,0,"textures\medic_uniform.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

[] call life_fnc_saveGear;
[] call life_fnc_Uniformscolor;