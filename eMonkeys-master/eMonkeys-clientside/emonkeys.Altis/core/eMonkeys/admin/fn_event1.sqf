/*
	Author: Christian "Cifon" Runggas
*/
private ["_mode","_action"];
_mode = _this select 0;

closeDialog 0;

switch (_mode) do
{	
	case 0:
	{	
		_action = 
		[
			"Möchtest du Fast on Altis ausführen?",
			"Sicherheitsabfrage",
			"Ja",
			"Nein"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			[2,"EMonkeys_fnc_admin",true,false] call EMonkeys_fnc_MP;
		};
	};
	case 1:
	{	
		_action = 
		[
			"Möchtest du die Craftingmission ausführen?",
			"Sicherheitsabfrage",
			"Ja",
			"Nein"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			[[position player],"Emonkeys_fnc_generateAirdrop",HC_player,false] spawn EMonkeys_fnc_MP;
		};
	};
	case 2:
	{
		_action = 
		[
			"Möchtest du das Erdbeben ausführen?",
			"Sicherheitsabfrage",
			"Ja",
			"Nein"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			[3,"EMonkeys_fnc_admin",true,false] call EMonkeys_fnc_MP;
		};
	};
	case 3:
	{
		_action = 
		[
			"Möchtest du das Erdbeben ausführen?",
			"Sicherheitsabfrage",
			"Ja",
			"Nein"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			[[],"EMonkeys_fnc_restart",true,false] call EMonkeys_fnc_MP;
		};
	};
};