/*
	File: fn_alcoholRecipes.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays information on making alcohol!
*/

if (worldName != "Tanoa") then
{
	"Alcohol Distillery Recipes" hintC [
		parseText "<t color='#FF0000'>Moonshine</t> - Water, yeast and corn - Can be sold or consumed immediately.",
		parseText "<t color='#FF0000'>Corn Whiskey</t> - Water, yeast, barley and corn - Ages in house barrel faster than scotch.",
		parseText "<t color='#FF0000'>Rye Whiskey</t> - Water, yeast, barley and rye - Ages in house barrel faster than scotch.",
		parseText "<t color='#FF0000'>Scotch</t> - Water, yeast and barley - Aging in house barrel is essential."
	];
}
else
{
	"Alcohol Distillery Recipes" hintC [
		parseText "<t color='#FF0000'>Ginger Beer</t> - Water, yeast and ginger - Can be sold or consumed immediately.",
		parseText "<t color='#FF0000'>Rum</t> - Water, yeast and sugar - Aging in house barrel is essential."
	];
};