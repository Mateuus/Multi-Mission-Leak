/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up all actions belonging to a player at setup time
*/

player addAction["Pack Go Kart",DS_fnc_packItem,["C_Kart_01_Blu_F","Portable Kart",civilian,"goKart"],0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "C_Kart_01_Blu_F" && (player distance cursorTarget) < 3 && (DS_currentWeight  + (["goKart",1] call DS_fnc_itemWeight)) <= DS_maxWeight '];
player addAction["Use Parachute",DS_fnc_parachute,[],0,false,false,"",
		'vehicle player isKindOf "Air" && DS_item_chute > 0'];		
player addAction["Pack Campfire",DS_fnc_packItem,["Land_Campfire_F","Camp Fire",civilian,"fire"],0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Campfire_F" && (player distance cursorTarget) < 3 && (DS_currentWeight  + (["fire",1] call DS_fnc_itemWeight)) <= DS_maxWeight '];	
player addAction["Heal at fire",DS_fnc_healFire,[],0,false,false,"",
        ' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Campfire_F" && (player distance cursorTarget) < 7 '];	
player addAction["Defuse IED",DS_fnc_defuseIED,[],0,false,false,"",
        ' !isNull cursorTarget && (typeOf cursorTarget) in ["Land_JunkPile_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_Tyres_F"] && (player distance cursorTarget) < 7 && (cursorTarget getVariable ["ied",false]) && (!(cursorTarget getVariable ["defusing",false]))'];			
player addAction["Load vehicle onto this truck",DS_fnc_vehLoad,[true],0,false,false,"",
        '((cursorTarget isKindOf "Car") && (!DS_vehicleLoading) && (!(cursorTarget getVariable ["gotLoad",false])) && ((typeOf cursorTarget) in ["I_Truck_02_transport_F","B_Truck_01_transport_F"]))'];	
player addAction["Load this vehicle onto a truck",DS_fnc_vehLoad,[false],0,false,false,"",
        '(((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (DS_vehicleLoading) && ((typeOf cursorTarget) in ["C_Boat_Civil_01_F","C_Rubberboat","O_SDV_01_F","C_Heli_Light_01_civil_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Light_01_F","I_Heli_light_03_F","I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F"]))'];	
player addAction["Unload vehicle",DS_fnc_vehUnload,[cursorTarget],0,false,false,"",
        '((cursorTarget isKindOf "Car") && (cursorTarget getVariable ["gotLoad",false]))'];	
		switch (playerSide) do
	{
	case civilian:
		{
		player addAction["Capture Convoy",DS_civ_captureConvoy,0,0,false,false,"",
		' !isNull cursorTarget && cursorTarget getVariable ["policeConvoy",false] && (player distance cursorTarget) < 10'];
		player addAction["Take Battery",DS_civ_giveBattery,1,0,false,false,"",
		' !isNull cursorTarget && cursorTarget getVariable ["policeConvoy",false] && (player distance cursorTarget) < 10'];
		player addAction["Rob Person",DS_civ_rob,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE])'];
		player addAction["<t color='#00FF00'>Activate Nitro</t>",DS_fnc_activateNitro,false,2,false,false,"",
		' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) '];
		player addAction["<t color='#00FF00'>Claim Checkpoint</t>",DS_fnc_captureCP,false,2,false,false,"",
		'((player distance cp1 < 100)||(player distance cp2 < 100)||(player distance cp3 < 100))'];
		player addAction ["Take secret documents",DS_fnc_spyClient,["civ"],1,false,true,"","player distance VipTarget < 15 and ((playerside) == civilian)"];
		player addAction["Drop Fishing Net",DS_civ_fishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship")&& speed (vehicle player) < 2 && speed (vehicle player) > -1 && !DS_doingStuff '];
		player addAction["Dismantle MCU",DS_civ_dismantleMCU,[cursorTarget],0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "O_Truck_03_covered_F" && (player distance cursorTarget) < 7'];
		player addAction["Stop myself being bugged",{player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";sleep 0.5;player playMoveNow "AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end";},[cursorTarget],0,false,false,"",
		' (surfaceisWater (getPos vehicle player) && (player == vehicle player))'];
		};
	case west:
		{
		player addAction["Pack UAV",DS_fnc_packItem,["B_UAV_01_F","Portable UAV",west,"UAV"],0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "B_UAV_01_F" && (player distance cursorTarget) < 3 && (DS_currentWeight  + (["UAV",1] call DS_fnc_itemWeight)) <= DS_maxWeight '];
		player addAction["<t color='#00FF00'>Reclaim Checkpoint</t>",DS_fnc_reclaimCP,false,2,false,false,"",
		'((player distance cp1 < 100)||(player distance cp2 < 100)||(player distance cp3 < 100))'];
		player addAction["Pickup SpikeStrip",DS_cop_packSpikes,["Land_Razorwire_F","Spike Strip",west,"spikeStrip"],0,false,false,"",
		' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
		player addAction ["Detain this spy",DS_fnc_spyClient,["cop"],1,false,true,"","player distance VipTarget < 15 and ((playerside) == west)"];
		player addAction ["Repair Power Station",DS_fnc_repairPower,2,1,false,true,"",'(player distance powerStation1) < 30'];
		player addAction["Interact",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_WoodenBox_F" && ((player distance cursorTarget) < 7) && (cursorTarget getVariable "buildBox")'];
		player addAction["Pack Item",{deleteVehicle cursorTarget},[],0,false,false,"",
		' !isNull cursorTarget && ((player distance cursorTarget) < 7) && (cursorTarget getVariable "buildItem") && !DS_setTask'];
		player addAction["Building Items",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
		' !isNull cursorTarget && ((cursorTarget) isKindOf "LandVehicle") && (player distance cursorTarget) < 8 && (cursorTarget getVariable ["policeVehicle",false]) && ((player getVariable ["policeSquad",""]) == "Highway Patrol")'];
		player addAction["Building Items and Shops",DS_fnc_menuShop,[[],[115,116,666,14,21,22,23,37,24,92,69,132]],0,false,false,"",
		' !isNull cursorTarget && ((cursorTarget) isKindOf "LandVehicle") && (player distance cursorTarget) < 8 && (cursorTarget getVariable ["policeVehicle",false]) && ((player getVariable ["policeSquad",""]) == "Rapid Response")'];
		
		player addAction["Building Items and Shops",DS_fnc_menuShop,[[],[115,116,666,14,21,22,23,37,24,92,69,132]],0,false,false,"",
		' !isNull cursorTarget && ((cursorTarget) isKindOf "Air") && (player distance cursorTarget) < 8 && (cursorTarget getVariable ["policeVehicle",false]) && ((player getVariable ["policeSquad",""]) == "Coast Guard")'];
		
		player addAction["Fire Fuel Dart",DS_cop_fuelDart,[[],[]],0,false,false,"",
		' !isNull cursorTarget && ((vehicle player) isKindOf "Ship") && (!DS_dartFired) && ((player getVariable ["policeSquad",""]) == "Coast Guard")'];
		
		player addAction["Fire FuelDart",DS_cop_fuelDart,[],0,false,false,"",
		' !DS_dartFired && (typeOf (vehicle player) == "B_MRAP_01_F") && ((player getVariable ["policeSquad",""]) == "Highway Patrol") '];
		
		player addAction["Switch Stance",{DS_sharpShooterAction = true;},[],0,false,false,"",
		' (!DS_sharpShooterAction) && ((player getVariable ["policeSquad",""]) == "Sharp Shooter") '];
		player addAction["Switch to Sharpshooter mode (Lethal)",DS_cop_switchStance,[1],0,false,false,"",
		' ((DS_sharpShooter == 0)||(DS_sharpShooter == 2)) && ((player getVariable ["policeSquad",""]) == "Sharp Shooter") && (DS_sharpShooterAction)'];
		player addAction["Switch to Sharpshooter mode (Injure)",DS_cop_switchStance,[2],0,false,false,"",
		' ((DS_sharpShooter == 0)||(DS_sharpShooter == 1)) && ((player getVariable ["policeSquad",""]) == "Sharp Shooter") && (DS_sharpShooterAction) '];
		player addAction["Switch to normal mode",DS_cop_switchStance,[0],0,false,false,"",
		' ((DS_sharpShooter == 2)||(DS_sharpShooter == 1)) && ((player getVariable ["policeSquad",""]) == "Sharp Shooter") && (DS_sharpShooterAction) '];
		/*
		player addAction["Building Items",DS_fnc_setupBuilding,[true],0,false,false,"",
		' !isNull cursorTarget && ((cursorTarget) isKindOf "LandVehicle") && (player distance cursorTarget) < 8 && (cursorTarget getVariable ["policeVehicle",false]) && ((player getVariable ["policeSquad",""]) == "Highway Patrol")'];
		*/
		player addAction["<t color='#FF8000'>Update Task</t>",{DS_setTask = true;},[],2000,false,false,"",
		'!DS_setTask'];
		player addAction["<t color='#FF8000'>Awaiting Orders</t>",DS_fnc_setupTaskActions,0,1010,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Patrolling</t>",DS_fnc_setupTaskActions,1,1009,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Transporting</t>",DS_fnc_setupTaskActions,2,1006,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Pursuing</t>",DS_fnc_setupTaskActions,3,1007,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Processing</t>",DS_fnc_setupTaskActions,4,1005,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Responding</t>",DS_fnc_setupTaskActions,5,1008,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Piloting</t>",DS_fnc_setupTaskActions,6,1004,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Raiding</t>",DS_fnc_setupTaskActions,7,1003,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>Escorting Convoy</t>",DS_fnc_setupTaskActions,8,1002,false,false,"",
		'DS_setTask'];
		player addAction["<t color='#FF8000'>On a break</t>",DS_fnc_setupTaskActions,9,1001,false,false,"",
		'DS_setTask'];
		
		};
	case independent:
		{
		player addAction["Interact",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_WoodenBox_F" && ((player distance cursorTarget) < 7) && (cursorTarget getVariable "buildBox") && (player getVariable ["security",false])'];
		player addAction["Pack Item",{deleteVehicle cursorTarget},[],0,false,false,"",
		' !isNull cursorTarget && ((player distance cursorTarget) < 7) && (cursorTarget getVariable "buildItem") && (player getVariable ["security",false])'];
		
		player addAction["<t color='#FF8000'>Tow This Vehicle</t>",DS_fnc_mechVehLoad,[false],0,false,false,"",
        '((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")) && (DS_vehicleLoading) && (player getVariable ["Mechanic",false])'];	
		
		player addAction["<t color='#FF8000'>Tow A Vehicle To This Vehicle</t>",DS_fnc_mechVehLoad,[true],0,false,false,"",
		'((typeOf cursorTarget) in ["B_Truck_01_mover_F"]) && (player getVariable ["Mechanic",false]) && (!DS_vehicleLoading) && (!(cursorTarget getVariable ["gotLoad",false]))'];	
		
		player addAction["<t color='#FF8000'>Un-tow Vehicle</t>",DS_fnc_mechVehUnload,[cursorTarget],0,false,false,"",
        '((typeOf cursorTarget) in ["B_Truck_01_mover_F"])  && (cursorTarget getVariable ["gotLoad",false]) && (player getVariable ["Mechanic",false])'];
		/*
		player addAction["<t color='#FF8000'>Repair Nearby Objects</t>",DS_fnc_mechRepairBuildings,[],0,false,false,"",
        '(!DS_doingStuff) && (player getVariable ["Mechanic",false])'];
		*/
		
		player addAction["Building Items",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
		' !isNull cursorTarget && ((DS_infoArray select 23) > 19)&&(((cursorTarget) isKindOf "LandVehicle")||((cursorTarget) isKindOf "Air")) && (player distance cursorTarget) < 8 && (cursorTarget in DS_keyRing) && (player getVariable ["Mechanic",false])'];
		
		player addAction["Repair Nearby Buildings",DS_fnc_mechRepairBuildings,[[],[]],0,false,false,"",
		' !isNull cursorTarget && ((DS_infoArray select 23) > 22)&&(((cursorTarget) isKindOf "LandVehicle")||((cursorTarget) isKindOf "Air")) && (player distance cursorTarget) < 8 && (cursorTarget in DS_keyRing) && (player getVariable ["Mechanic",false])'];
		
		player addAction["<t color='#FF8000'>Make Repair Kit</t>",DS_mech_makeRepair,[],0,false,false,"",
        '(player getVariable ["Mechanic",false])'];	
		
		player addAction["<t color='#FF8000'>Make Nitro Kit</t>",DS_mech_makeNos,[],0,false,false,"",
        '(player getVariable ["Mechanic",false])'];	
		
		player addAction["Building Items",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
		' !isNull cursorTarget && ((DS_infoArray select 10) > 27)&&(((cursorTarget) isKindOf "LandVehicle")||((cursorTarget) isKindOf "Air")) && (player distance cursorTarget) < 8 && (cursorTarget in DS_keyRing) && (player getVariable ["medic",false])'];
		
		};
	};