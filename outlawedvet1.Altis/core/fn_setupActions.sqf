/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
		// Vehicle armament script
		life_actions = life_actions + [player addAction["<img image='\A3\UI_F_Curator\Data\CfgMarkers\kia_ca.paa' size='1'></img> Purchase Armament",life_fnc_arm,"",0,false,false,"",'(typeOf(vehicle player) in ["O_MRAP_02_hmg_F","I_G_Offroad_01_armed_F","I_Plane_Fighter_03_CAS_F","O_Heli_Light_02_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F","O_Heli_Attack_02_F","O_APC_Wheeled_02_rcws_F","B_T_VTOL_01_armed_F","I_APC_tracked_03_cannon_F"]) && speed (vehicle player) < 2 && speed (vehicle player) > -1']];
		//Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
    };
	
	case west: {
	//Armament script - RPGforYOU
	life_actions = life_actions + [player addAction["<img image='\A3\UI_F_Curator\Data\CfgMarkers\kia_ca.paa' size='1'></img> Purchase Armament",life_fnc_arm,"",0,false,false,"",'(typeOf(vehicle player) in ["O_MRAP_02_hmg_F","O_T_LSV_02_armed_black_F","O_APC_Wheeled_02_rcws_F","B_G_Offroad_01_armed_F","B_Heli_Transport_01_camo_F","B_MRAP_01_hmg_F","I_Plane_Fighter_03_CAS_F","B_Boat_Armed_01_minigun_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F","O_Plane_CAS_02_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_AA_F","I_MRAP_03_hmg_F","I_Heli_light_03_F"]) && speed (vehicle player) < 2 && speed (vehicle player) > -1']];
	//seize Objects
	life_actions = life_actions + [player addAction["Seize objects",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'(count(nearestObjects [player,["weaponHolder"],5])>0) || (count(nearestObjects [player,["WeaponHolderSimulated"],5])>0)']];
	};
};
