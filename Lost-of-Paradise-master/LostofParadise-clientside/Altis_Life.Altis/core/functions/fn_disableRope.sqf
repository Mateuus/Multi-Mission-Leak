/*
	fn_disableRope.sqf
	
	Author: Oktas /// lostofparadise.de 
	
	Beschreibung:
	Keine Spawnbugs mehr.
*/
_hubis = ["B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F","C_Heli_Light_01_civil_F","B_Heli_Light_01_F"];	

if (!isMultiplayer) exitWith {};
systemChat "Sling Load disabled...";

while {true} do
{

	waitUntil
	{
		sleep 1; 
		typeOf (vehicle player) in _hubis
	};
		(vehicle player) enableRopeAttach false;
  
};

