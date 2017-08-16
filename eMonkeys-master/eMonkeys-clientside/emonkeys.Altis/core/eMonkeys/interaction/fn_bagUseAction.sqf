/*
	Author: DerOnkel
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	
*/
_mode = _this select 0;

switch (_mode) do
{
	case 0:
	{
		if(!(player getVariable "gagged")) exitWith {};
		
		removeGoggles player;
		player addGoggles EMonkeys_gagged_oldglass;
		player setVariable ["gagged",false,true];
		cutText ["","BLACK IN",3];
		["<t color='#ff0000' size = '.8' align='center'>Dir wurde der Jutesack vom Kopf genommen!</t>",[0.29375 * safezoneW + safezoneX, 0.4125 * safezoneW],[0.456 * safezoneH + safezoneY, 0.11 * safezoneH],4,1,0,789] spawn BIS_fnc_dynamicText;
	};
	case 1:
	{
		if(player getVariable "gagged") exitWith {};
		
		EMonkeys_gagged_oldglass = goggles player;
		removeGoggles player;
		player addGoggles "G_Balaclava_combat";
		player setVariable ["gagged",true,true];
		cutText ["","BLACK OUT",4];
		["<t color='#ff0000' size = '.8' align='center'>Dir wurde ein Jutesack über den Kopf gezogen!</t>",[0.29375 * safezoneW + safezoneX, 0.4125 * safezoneW],[0.456 * safezoneH + safezoneY, 0.11 * safezoneH],4,1,0,789] spawn BIS_fnc_dynamicText;
	};
	case 2:
	{
		if(!(player getVariable "gagged")) exitWith {};
		
		removeGoggles player;
		player addGoggles EMonkeys_gagged_oldglass;
		
		player setVariable ["gagged",false,true];
		cutText ["","BLACK IN",3];
	};
	case 3:
	{
		[false,"jutesack",1] call emonkeys_fnc_handleInv;
		[[1],"EMonkeys_fnc_bagUseAction",cursorTarget,FALSE] spawn EMonkeys_fnc_MP;
	};
};