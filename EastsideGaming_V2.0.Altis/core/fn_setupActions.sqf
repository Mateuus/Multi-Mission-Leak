/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
//Für alle Fraktionen
life_actions pushBack (player addAction["<t color='#0099FF'>Hinsetzen</t>",{[cursorObject,player] spawn ESG_fnc_hinsetzen;},true,1,true,true,"""",'player distance cursorObject < 3 && {(["bench",str cursorObject]call bis_fnc_instring || ["chair",str cursorObject]call bis_fnc_instring)} ']);
life_actions pushback (player addAction ["Bandagieren",{[player,playerSide]spawn ESG_fnc_bandage;},nil,50,TRUE,TRUE,'','!life_action_inUse && (getdammage player) > 0 && life_inv_bandage > 0 && (vehicle player isEqualTo player)',2,FALSE]);
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions pushback (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);
        //Rob person
        life_actions pushback (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject isEqualTo "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']);
    };
	
	case west: {
		life_actions pushback (player addAction["Boden entfernen",{{deleteVehicle _x;}foreach (nearestObjects [player,["weaponholder"],3]); titleText["Gegenstände wurden beschlagnahmt!","PLAIN DOWN"]},"",0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']);
	};
	
	case independent: {
		life_actions pushback(player addAction["Boden entfernen",{{deleteVehicle _x;}foreach (nearestObjects [player,["weaponholder"],3]); titleText["Gegenstände wurden beschlagnahmt!","PLAIN DOWN"]},"",0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']);
	};
};
