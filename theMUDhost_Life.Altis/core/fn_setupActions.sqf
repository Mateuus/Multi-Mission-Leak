/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		// Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		
		// Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];

		// Check for Bombs
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Check for Bombs</t>",life_fnc_bombDetect,"",99,false,true,"",' player distance cursorTarget < 5 && (cursorTarget getVariable["dchargeplaced",FALSE]) && ((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Building")) ']];
		
		// Defuse Bombs
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Defuse Explosives</t>", life_fnc_bombDefuseKit,"",99,false,false,"",' player distance cursorTarget < 5 && (cursorTarget getVariable["dchargefound",FALSE]) && ((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Building")) ']];
		
		// Harvest Organs
		life_actions = life_actions + [player addAction["Harvest Organs",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];		

		// Suicide Vest
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Activate Suicide Jacket</t>",life_fnc_suicideBomb,"",0,false,false,"",
        'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !life_isSuiciding && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];	
		
		// Air Vehicle Ejection (For Helicopter Pilots and Co-Pilots Mostly... :(   Thanks to A3Wasteland
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Emergency Eject</t>",life_fnc_forceEject,"",0,false,false,"", '(vehicle player) isKindOf "Air" && (driver vehicle player) == player)']];
		
		//Searching Buildings for Loot
		life_actions = life_actions + [player addAction["<t color='#fdff01'>Search Building</t>",life_fnc_lootHouse,"",0,false,false,"",'vehicle player == player && (typeOf cursorTarget in["Land_u_House_Small_01_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V1_F","Land_d_House_Small_01_V1_F","Land_Unfinished_Building_01_F","Land_u_House_Big_02_V1_F"]) && (vehicle player) distance cursorTarget < 5 && !(cursorTarget getVariable ["looted",FALSE]) && playerSide == civilian']];
	};
	
	case west:
	{
		// Seize PlayerWeapons
		life_actions = life_actions + [player addAction["Seize Weapons",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",
		'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
		
		// Placing Objects
		life_actions = life_actions + [player addAction["<t color='#0099FF'>Place Object</t>",life_fnc_placedObject,player,0,false,false,"",'!isNull life_placing']];
		
		// Pickup Objects
		life_actions = life_actions + [player addAction["<t color='#0099FF'>Pick Up Object</t>",life_fnc_pickupObject,cursorTarget,0,false,false,"",
		' (typeOf cursorTarget in ["RoadCone_F","RoadBarrier_F","Land_CncBarrierMedium_F","Land_CncBarrierMedium4_F","Land_BarGate_F","PlasticBarrier_03_blue_F","Land_Cargo_House_V1_F","Land_PortableLight_single_F","Land_PortableLight_double_F","B_HMG_01_F"]) && (player distance cursorTarget) < 5 ']];
		
		// Destroy Objects
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Destroy Object</t>",life_fnc_destroyObject,cursorTarget,0,false,false,"",
		' (typeOf cursorTarget in ["Rope","Land_Cargo_House_V1_ruins_F"]) && (player distance cursorTarget) < 5 ']];
	};

};

//Sit Down
life_actions = life_actions + [player addAction["<t color='#0099FF'>Sit Down</t>",life_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_ChairWood_F")']];

//Stand Up
life_actions = life_actions + [player addAction["<t color='#0099FF'>Stand Up</t>", life_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];