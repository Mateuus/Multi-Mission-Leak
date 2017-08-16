/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		life_actions = life_actions + [player addAction["Personalausweis zeigen",{[player] remoteExecCall ["life_fnc_zeigePerso",cursorTarget];},"",0,false,false,"",'isPlayer cursorTarget && alive cursorTarget && (player distance cursorTarget < 3) && (speed player < 1 && speed cursorTarget < 1)']];
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];
	};
	case west:
	{
		life_actions = life_actions + [player addAction["Personalausweis ansehen (Anti RP)",{[cursorTarget] remoteExecCall ["life_fnc_zeigePerso",player];},"",0,false,false,"",'isPlayer cursorTarget && alive cursorTarget && (player distance cursorTarget < 3) && (speed player < 1 && speed cursorTarget < 1)']];
		life_actions = life_actions + [player addAction["Personalausweis zeigen",{[player] remoteExecCall ["life_fnc_zeigePerso",cursorTarget];},"",0,false,false,"",'isPlayer cursorTarget && alive cursorTarget && (player distance cursorTarget < 3) && (speed player < 1 && speed cursorTarget < 1)']];
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];
	};
	case independent:
	{
		life_actions = life_actions + [player addAction["Personalausweis zeigen",{[player] remoteExecCall ["life_fnc_zeigePerso",cursorTarget];},"",0,false,false,"",'isPlayer cursorTarget && alive cursorTarget && (player distance cursorTarget < 3) && (speed player < 1 && speed cursorTarget < 1)']];
	};
	case east:
	{
		//Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		life_actions = life_actions + [player addAction["Personalausweis zeigen",{[player] remoteExecCall ["life_fnc_zeigePerso",cursorTarget];},"",0,false,false,"",'isPlayer cursorTarget && alive cursorTarget && (player distance cursorTarget < 3) && (speed player < 1 && speed cursorTarget < 1)']];
	};
};
