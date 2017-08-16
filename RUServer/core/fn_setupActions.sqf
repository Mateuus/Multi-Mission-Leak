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
		    //Passport
		    life_actions = life_actions + [player addAction["<t color='#00FF00'>Ausweiß zeigen</t>",life_fnc_civPasseport,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget)']];
        };
        // take them organs
        life_actions = life_actions + [player addAction["Organ rausschneiden",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && (player getVariable "knocked")']];

	case west: {
		//Passport
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Dienstmarke zeigen</t>",life_fnc_copPasseport,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) ']];
		//Barriers
		player addaction ["Barriers",life_fnc_barrier,[""],0,false,true,"","vehicle player == player and BarrierOpen == 0"];
	};

	case independent: {
		//Passport
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Dienstmarke zeigen</t>",life_fnc_medPasseport,"",1,false,true,"",' playerSide == independent && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) ']];
		//Barriers
		player addaction ["Barriers",life_fnc_barrier,[""],0,false,true,"","vehicle player == player and BarrierOpen == 0"];
	};

};

life_actions pushBack (player addAction["<t color = '#D660D6'>Sitzgurt anlegen</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
life_actions pushBack (player addAction["<t color = '#D660D6'>Sitzgurt ablegen</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);
