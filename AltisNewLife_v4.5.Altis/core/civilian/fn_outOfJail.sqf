private["_releaseMarker"];
_releaseMarker = getMarkerPos "jail_release";
if(player distance (_releaseMarker) < 5) then
{
	player addUniform life_pandaPrison_uniform;
	player addBackpack life_pandaPrison_backpack;
	player addHeadgear life_pandaPrison_headgear;
	player addVest life_pandaPrison_vest;
	hint "Vous avez ete libere de prison. Passez une bonne journee"
};