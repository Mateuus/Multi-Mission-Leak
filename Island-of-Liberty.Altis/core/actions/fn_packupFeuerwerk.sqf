private["_feuerwerk"];
_feuerwerk = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_feuerwerk") exitWith {};

if(([true,"feuerwerk",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_feuerwerk","PLAIN"];
	player removeAction life_action_feuerwerkDeploy;
	life_action_feuerwerkDeploy = nil;
	deleteVehicle _feuerwerk;
};