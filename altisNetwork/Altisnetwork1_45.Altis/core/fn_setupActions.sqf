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
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable["robbed",FALSE]) ']];
        //Passport 
	    //life_actions = life_actions + [player addAction["<t color='#00FF00'>Show ID Card</t>",life_fnc_civPasseport,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
        //Suicide alahsnackbar
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Activate Suicide Vest</t>",life_fnc_suicideBomb,"",0,false,false,"",' vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
    };
};

switch (playerSide) do {
    case west: {
      // life_actions pushBack (player addAction["<t color = '#D660D6'>S.W.A.T Loadout</t>",life_fnc_mxloadout,"",7,false,false,"",' vehicle player != player ']);
      // life_actions pushBack (player addAction["Seize Items",life_fnc_seizeObjects,cursorObject,1.5,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']);
      life_actions = life_actions + [player addAction["Seize Items",life_fnc_seizeObjects,cursorObject,1.5,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']];
    }
};

switch (playerSide) do {
	case independent: {
		//Inject Morphine
		life_actions = life_actions + [player addAction[localize "STR_pAct_Inject",life_fnc_injectAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && damage cursorTarget > 0.1']];
	};
};
//Gang
life_actions = life_actions + [player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];
//Pickup Item
//life_actions pushBack (player addAction["Pickup Item(s)",{createDialog "life_pickup_items"},"",0,false,false,"",' !isNull nearestObject (screenToWorld [0.5,0.5]) && count (nearestObject (screenToWorld [0.5,0.5]) getVariable ["item",[]]) > 0 && player distance nearestObject (screenToWorld [0.5,0.5]) <= 4 && !life_action_inUse && (isNull objectParent player)']);


life_actions pushBack (player addAction ["<img image='icons\seatbelton.paa' /><t color='#BBBB00'>Put Seatbelt On</t>", {life_seatbelt=true}, "", 3, false, true, "", 'vehicle player isKindOf "Car" && !life_seatbelt']);
life_actions pushBack (player addAction ["<img image='icons\seatbeltoff.paa' /><t color='#BBBB00'>Take Seatbelt Off</t>", {life_seatbelt=false}, "", 3, false, true, "", 'vehicle player isKindOf "Car" && life_seatbelt']);