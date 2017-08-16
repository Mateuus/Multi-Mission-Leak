/*
	File: fn_painballSelectSide.sqf
	Author: MarkusSR1984
	
	Description:
	Setzt die Seite des Spielers
*/


_pballSide = param [0,"blau",[""]];
_payment = param [1,false,[false]];


if (_payment) then 
{
	if (dwf_cash < 5000) exitWith {hint "Du hast nicht genug Geld dabei!";};
	
	dwf_cash = dwf_cash - 5000;
	[0] call SOCK_fnc_updatePartial;
	
};


player setVariable["pballSide",_pballSide];



switch (_pballSide) do
{
    case "blau": 
		{ 
			hint "Du bist nun in Team Blau";
			player forceAddUniform "U_B_Protagonist_VR";
			pIayer addvest "V_BandollierB_blk";
			pIayer addHeadGear "H_HelmetB_light_black";
			pIayer addGoggles "G_Balaclava_combat";
			player linkItem "NVGoggles_OPFOR";
		};
    case "rot": 
		{ 
			hint "Du bist nun in Team Rot";
			player forceAddUniform "U_O_Protagonist_VR";
			pIayer addvest "V_BandollierB_blk";
			pIayer addHeadGear "H_HelmetB_light_black";
			pIayer addGoggles "G_Balaclava_combat";
			player linkItem "NVGoggles_OPFOR";
		};
};


