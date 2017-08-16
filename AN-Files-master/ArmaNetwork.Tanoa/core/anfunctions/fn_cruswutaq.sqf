/*
	ArmA.Network
	Rathbone
	Init of Main HUD
*/
disableSerialization;
switch (_this select 0) do 
{
	case 0: 
	{
		life_showingHUD = true;
		("playerHUDLayer" call BIS_fnc_rscLayer) cutRsc ["playerHUD", "PLAIN", 1, false];
	};
	case 1: 
	{
		if(!life_showingHUD) exitWith {};
		life_showingHUD = false;
		("playerHUDLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	};
};
