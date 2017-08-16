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
		
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
		
		//Ausweis 
	    life_actions = life_actions + [player addAction["<t color='#00FF00'>Ausweis zeigen</t>",life_fnc_civPasseport,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		
		//Gang
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Gang Gebiet einnehmen</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];

    };
	
	case west: {
	    //Ausweis
	life_actions = life_actions + [player addAction["<t color='#00FF00'>Dienstmarke zeigen</t>",life_fnc_copPassport,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
    
	//Waffen Entfernen
    life_actions = life_actions + [player addAction["Sachen beschlagnahmen",life_fnc_seizeWeapon,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
	
	//Gang
	life_actions = life_actions + [player addAction["<t color='#FF0000'>Gang Gebiet einnehmen</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];
	};
	
	
};