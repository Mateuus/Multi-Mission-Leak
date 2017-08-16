/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Fulls the array and sets up variables for player licenses
*/

private ["_items","_ItemArray"];
//Array of all items
DS_licenseArray = ["DSL_car","DSL_truck","DSL_air","DSL_boat","DSL_weapons","DSL_weaponsAdv","DSL_rebel","DSL_rebelAdv","DSL_rebelVeh","DSL_oil","DSL_diamond","DSL_copper","DSL_rock","DSL_salt","DSL_iron","DSL_sand","DSL_weed","DSL_heroin","DSL_cocaine","DSL_haxor","DSL_wood","DSL_security"];
//Sets all licenses to false by default
{
	missionNamespace setVariable[_x,false];
}forEach DS_licenseArray;















