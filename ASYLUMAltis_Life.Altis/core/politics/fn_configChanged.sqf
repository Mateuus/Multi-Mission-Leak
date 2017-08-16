/*
	File: fn_configChanged.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Event fired when server configuration is changed.
*/

{
	if ((_x select 0) in ["cannabis","marijuana","marijuanam"]) then { life_illegal_items set [_forEachIndex, -1]; };
} forEach life_illegal_items;
life_illegal_items = life_illegal_items - [-1];

if (!(life_configuration select 2)) then
{
	"weed_1" setMarkerColorLocal "ColorRed";
	"Weed_p_2" setMarkerAlphaLocal 0;
	life_illegal_items pushBack ["cannabis",100];
	life_illegal_items pushBack ["marijuana",200];
	life_illegal_items pushBack ["marijuanam",200];
}
else
{
	"weed_1" setMarkerColorLocal "ColorGreen";
	"Weed_p_2" setMarkerAlphaLocal 1;
};