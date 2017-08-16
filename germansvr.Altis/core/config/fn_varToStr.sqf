/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Prof Block
case "Oil_Prof": {(localize "STR_Prof_Oil")};
case "Iron_Prof": {(localize "STR_Prof_Iron")};
case "Copper_Prof": {(localize "STR_Prof_Copper")};
case "Rock_Prof": {(localize "STR_Prof_Rock")};
case "Fruit_Prof": {(localize "STR_Prof_Fruit")};
case "Salt_Prof": {(localize "STR_Prof_Salt")};
case "Sand_Prof": {(localize "STR_Prof_Sand")};
case "Diamond_Prof": {(localize "STR_Prof_Diamond")};
case "Cocain_Prof": {(localize "STR_Prof_Cocain")};
case "Canabis_Prof": {(localize "STR_Prof_Canabis")};
case "Heroin_Prof": {(localize "STR_Prof_Heroin")};
};
