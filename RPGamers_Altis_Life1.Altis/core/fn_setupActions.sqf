/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
//_doors = ["Land_BottlePlastic_V1_F"];

switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
        // Suicide Bomb        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active Suicide Vest</t>",life_fnc_suicideBomb,"",0,false,false,"",'
        vest player == "V_HarnessOGL_gry" && !life_suicide && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "restrainedz") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
        //Gather Heroin
        life_actions pushBack (player addAction["Gather Opium Poppy",life_fnc_gatherDrugs,["heroin_unprocessed",1],3,false,true,"",'(player distance (getMarkerPos "heroin_1") < 75)']);
        //Gather Cannabis
        life_actions pushBack (player addAction["Gather Cannabis",life_fnc_gatherDrugs,["cannabis",1],3,false,true,"",'(player distance (getMarkerPos "weed_1") < 75)']);
        life_actions pushBack (player addAction["Gather Cannabis",life_fnc_gatherDrugs,["cannabis",1],3,false,true,"",'(player distance (getMarkerPos "weed_2") < 75)']);
        life_actions pushBack (player addAction["Catch Frog",life_fnc_gatherDrugs,["froglegs",1],3,false,true,"",'(player distance (getMarkerPos "froglegs") < 35)']);
    };
    case west: {
        life_actions pushBack (player addAction["<t color='#FF0000'>Seize Weapons</t>",life_fnc_seize,cursorTarget,0,false,false,"",'((count(nearestObjects [player,["WeaponHolder"],3])>0) || (count(nearestObjects [player,["GroundWeaponHolder"],3])>0) || (count(nearestObjects [player,["WeaponHolderSimulated"],3])>0)) && !(player getVariable "restrained") && !(player getVariable "restrainedz")']);
        //life_actions = life_actions + [player addAction["Open Prison Door",life_fnc_doorAnimate,"",0,false,false,"",'!isNull cursorTarget && (typeOf cursorTarget) in _doors && cursorTarget distance player < 3.5']];
        
        //gatherevidence
        life_actions pushBack (player addAction["Gather Evidence",life_fnc_gatherEvidence,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && !dialog && typeOf cursorTarget == "Land_Suitcase_F"']);
    };
};

life_actions pushBack (player addAction["<t color='#00FF00'>Activate Nitro</t>",life_fnc_activateNitro,false,2,false,false,"",
' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) ']);

life_actions pushBack (player addAction["<t color = '#328828'>Put on Seatbelt</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
//life_actions pushBack (player addAction["<t color = '#D660D6'>Remove Seatbelt</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);

//Pickup Item
life_actions pushBack (player addAction["Pickup Item(s)",{createDialog "life_pickup_items"},"",0,false,false,"",
' !isNull nearestObject (screenToWorld [0.5,0.5]) && count (nearestObject (screenToWorld [0.5,0.5]) getVariable ["item",[]]) > 0 && player distance nearestObject (screenToWorld [0.5,0.5]) <= 4 && !life_action_inUse && (isNull objectParent player)']);

/*
if(vehicle player != player) then {
    life_actions pushBack (player addAction ["<t color='#DDDD00'>Turn Signal OFF</t>",{[[vehicle player,0],"life_fnc_turnSignal",false,false] spawn BIS_fnc_MP;(vehicle player) setVariable ["signal",0,true]},"",2,false,false,"",' vehicle player != player && ((typeOf vehicle player) in ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_box_F","C_Van_01_transport_F"]) && ((driver vehicle player) == player) && ((vehicle player getVariable ["signal", 0]) != 0)']);
    life_actions pushBack (player addAction ["<t color='#DDDD00'>Turn Signal LEFT</t>",{[[vehicle player,1],"life_fnc_turnSignal",false,false] spawn BIS_fnc_MP;(vehicle player) setVariable ["signal",1,true]},"",2,false,false,"",' vehicle player != player && ((typeOf vehicle player) in ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_box_F","C_Van_01_transport_F"]) && ((driver vehicle player) == player) && ((vehicle player getVariable ["signal", 0]) != 1)']);
    life_actions pushBack (player addAction ["<t color='#DDDD00'>Turn Signal RIGHT</t>",{[[vehicle player,2],"life_fnc_turnSignal",false,false] spawn BIS_fnc_MP;(vehicle player) setVariable ["signal",2,true]},"",2,false,false,"",' vehicle player != player && ((typeOf vehicle player) in ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_box_F","C_Van_01_transport_F"]) && ((driver vehicle player) == player) && ((vehicle player getVariable ["signal", 0]) != 2)']);
};*/