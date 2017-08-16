/*
	EVENT HANDLER FOR MAP
*/

if(player getVariable ["restrained",false]) exitWith {};

switch (playerSide) do
{
	case west:
	{
		[] spawn life_fnc_jephastubr;
	};
	/*
	case civilian :
	{
		[] spawn life_fnc_gangMarkers;
	};
	*/
	case independent:
	{
		//systemChat "Medic Map Open";
		[] spawn life_fnc_chutetrasa;
	};
};
