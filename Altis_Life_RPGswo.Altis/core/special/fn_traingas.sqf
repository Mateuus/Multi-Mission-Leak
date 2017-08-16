/*
	File: traingas.sqf
	Autor: MarkusSR1984
	
	Description: Ja Tränengas eben
	
*/
private["_Smoke"];
_Smoke = nearestObject [getpos player, "SmokeShell"];

while {true} do 
{
	_Smoke = nearestObject [getpos player, "SmokeShell"];
	if ((_Smoke distance player < 25) && ((getpos _Smoke) select 2 < 0.5) && ((_Smoke isKindOf "SmokeShellBlue") || (_Smoke isKindOf "SmokeShellRed"))) then
	{
		while {true} do 
	
		{
			if (!((goggles player == "G_Combat") || (goggles player == "G_Balaclava_combat"))) then 
			{
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [20]; 
				"dynamicBlur" ppEffectCommit 3;
				enableCamShake true; 
				addCamShake [10, 45, 10];
				player setFatigue 1;
				[0.5,0.01] spawn DWEV_fnc_handleSound;
				DWEV_traingas_effect = true;
				sleep 5;
			};
	_Smoke = nearestObject [getpos player, "SmokeShell"];
	if !((_Smoke distance player < 25) && ((getpos _Smoke) select 2 < 0.5) && ((_Smoke isKindOf "SmokeShellBlue") || (_Smoke isKindOf "SmokeShellRed"))) exitWith
	{
			"dynamicBlur" ppEffectEnable true; 
			"dynamicBlur" ppEffectAdjust [0]; 
			"dynamicBlur" ppEffectCommit 15; 
			resetCamShake; 
			[20] spawn DWEV_fnc_handleSound;
			sleep 20;
			DWEV_traingas_effect = false;
	};
			
		};
				
	};

	uisleep 0.5;

}; 