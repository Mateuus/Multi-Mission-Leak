/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
	    life_actions = life_actions + [player addAction["<t color='#00FF00'>Polizeimarke zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5 && isPlayer cursorTarget']];

		
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Absperrband einpacken</t>",life_fnc_packUpBarrier,"",0,false,false,"",'
		_barrier = nearestObjects[getPos player, ["TapeSign_F"],3] select 0; !isNil "_barrier" && !isNil {(_barrier getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler einpacken</t>",life_fnc_packUpStrahler,"",0,false,false,"",'
		_strahler = nearestObjects[getPos player, ["Land_PortableLight_double_F"],3] select 0; !isNil "_strahler" && !isNil {(_strahler getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Barriere einpacken</t>",life_fnc_packUpBarricade,"",0,false,false,"",'
		_barricade = nearestObjects[getPos player, ["RoadBarrier_small_F"],5] select 0; !isNil "_barricade" && !isNil {(_barricade getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Spikes einpacken</t>",life_fnc_packupSpikes,"",0,false,false,"",'
		_spikes = nearestObjects[getPos player, ["Land_Razorwire_F"],5] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
		
		life_actions = life_actions + [player addAction["Objekte Beschlagnahmen",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["Box_NATO_Ammo_F","CamoNet_OPFOR_F","Land_Razorwire_F","Land_PortableLight_double_F","TapeSign_F","RoadBarrier_small_F","WeaponHolderSimulated","weaponholder","GroundWeaponHolder","Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"],3])>0']];
	};
	
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		
		//Punchballs
		life_actions = life_actions + [player addAction["Punch Balls",life_fnc_punchBallsAction,"",0,false,false,"",'
        !isNull cursorTarget && player distance cursorTarget < 5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]']];
		
		life_actions = life_actions + [player addAction["Brieftasche zeigen",life_fnc_showLicenseAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget']];
		
		//mais aufheben
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Mais stehlen</t>",{play_fuckyou = false; []call life_fnc_packupmais; play_fuckyou = true;},"",0,false,true,"",'_mais = nearestObjects[getPos player,["Land_Sack_F"],2] select 0; !isNil "_mais" && play_fuckyou']];

		//zucker aufheben
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Zucker stehlen</t>",{play_fuckyou = false; []call life_fnc_packupzucker; play_fuckyou = true;},"",0,false,false,"",' _zucker = nearestObjects[getPos player,["Land_CanisterPlastic_F"],2] select 0; !isNil "_zucker" && play_fuckyou']];
		
		
	};
	
	case independent:
   {
        life_actions = life_actions + [player addAction["Ausweis zeigen",life_fnc_showLicenseAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget']];
		
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Absperrband einpacken</t>",life_fnc_packUpBarrier,"",0,false,false,"",'
		_barrier = nearestObjects[getPos player, ["TapeSign_F"],3] select 0; !isNil "_barrier" && !isNil {(_barrier getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler einpacken</t>",life_fnc_packUpStrahler,"",0,false,false,"",'
		_strahler = nearestObjects[getPos player, ["Land_PortableLight_double_F"],3] select 0; !isNil "_strahler" && !isNil {(_strahler getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Barriere einpacken</t>",life_fnc_packUpBarricade,"",0,false,false,"",'
		_barricade = nearestObjects[getPos player, ["RoadBarrier_small_F"],5] select 0; !isNil "_barricade" && !isNil {(_barricade getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Spikes einpacken</t>",life_fnc_packupSpikes,"",0,false,false,"",'
		_spikes = nearestObjects[getPos player, ["Land_Razorwire_F"],5] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
   };

};