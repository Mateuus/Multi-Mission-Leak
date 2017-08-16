/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
	case civilian: {
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		//De-Maskieren
		life_actions = life_actions + [player addAction["<t color='#FFB124'>Augenbinde abnehmen</t>",life_fnc_unmask,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget getVariable "masked" && player distance cursorTarget < 3 && cursorTarget isKindOf "Man" ']];
		//Punch
		life_actions = life_actions + [player addAction["<t color='#FFB124'>Schlag in die Eier</t>",life_fnc_punchBallsAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]']];
	};
	case west:
	{
		//Seize weapons
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Waffen beschlagnahmen</t>",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
        //seize Objects
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Beschlagnahmen</t>",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
		//De-Maskieren
		life_actions = life_actions + [player addAction["<t color='#FFB124'>Augenbinde abnehmen</t>",life_fnc_unmask,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget getVariable "masked" && player distance cursorTarget < 3 && cursorTarget isKindOf "Man" ']];
	};
	case independent:
	{
        //seize Objects
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Beschlagnahmen</t>",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
	};
};

//Ausweis
life_actions = life_actions + [player addAction["Ausweis zeigen",life_fnc_passshow,"",1,false,true,"",'!isNull cursorTarget && player distance cursorTarget < 3 && cursorTarget isKindOf "Man"']];