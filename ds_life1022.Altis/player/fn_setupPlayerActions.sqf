/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up all actions belonging to a player at setup time
*/

player addAction ["Pack Go Kart",DS_fnc_packItem,["C_Kart_01_Blu_F","Portable Kart",civilian,"goKart"],0,false,false,"",
	'(!isNull cursorTarget) && {(typeOf cursorTarget) isEqualTo "C_Kart_01_Blu_F"} && {(player distance cursorTarget) < 4} && {(DS_currentWeight + (["goKart",1] call DS_fnc_itemWeight)) <= DS_maxWeight} && {!(playerSide isEqualTo west)}'];

player addAction ["Use Parachute",DS_fnc_parachute,[],0,false,false,"",
	'((vehicle player) isKindOf "Air") && {DS_item_chute > 0}'];

player addAction ["Pack Campfire",DS_fnc_packItem,["Land_Campfire_F","Camp Fire",civilian,"fire"],0,false,false,"",
	'(!isNull cursorTarget) && {(typeOf cursorTarget) isEqualTo "Land_Campfire_F"} && {(player distance cursorTarget) < 3} && {(DS_currentWeight + (["fire",1] call DS_fnc_itemWeight)) <= DS_maxWeight}'];

player addAction ["Heal At Fire",DS_fnc_healFire,[],0,false,false,"",
    '(!isNull cursorTarget) && {(typeOf cursorTarget) isEqualTo "Land_Campfire_F"} && {(player distance cursorTarget) < 7}'];

player addAction ["Defuse IED",DS_fnc_defuseIED,[],0,false,false,"",
    '(!isNull cursorTarget) && {(typeOf cursorTarget) in ["Land_JunkPile_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_Tyres_F"]} && {(player distance cursorTarget) < 7} && {cursorTarget getVariable ["ied",false]} && {!(cursorTarget getVariable ["defusing",false])}'];

player addAction ["Load vehicle onto this truck",DS_fnc_vehLoad,[],0,false,false,"",
    '(isNull objectParent player) && {!DS_vehicleLoading} && {cursorTarget isKindOf "Car"} && {!(cursorTarget getVariable ["truckMission",false])} && {!(cursorTarget getVariable ["gotLoad",false])} && {(player distance cursorTarget) < 20} && {!(player getVariable ["mechanic",false])} && {(typeOf cursorTarget) in ["I_Truck_02_transport_F","B_Truck_01_transport_F","O_Truck_03_transport_F"]}'];

player addAction ["Load this vehicle onto a truck",DS_fnc_vehLoad,[],0,false,false,"",
    '(isNull objectParent player) && {DS_vehicleLoading} && {((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship"))} && {(player distance cursorTarget) < 20} && {!(player getVariable ["mechanic",false])}'];

player addAction ["Unload vehicle",DS_fnc_vehUnload,[],0,false,false,"",
	'(isNull objectParent player) && {cursorTarget isKindOf "Car"} && {(player distance cursorTarget) < 20} && {cursorTarget getVariable ["gotLoad",false]} && {!(player getVariable ["mechanic",false])}'];

switch(playerSide)do {
	case civilian: {
		player addAction ["Capture Convoy",DS_civ_captureConvoy,0,0,false,false,"",
			'(!isNull cursorTarget) && {cursorTarget getVariable ["policeConvoy",false]} && {(player distance cursorTarget) < 10}'];

		player addAction ["Take Battery",DS_civ_giveBattery,1,0,false,false,"",
			'(!isNull cursorTarget) && {cursorTarget getVariable ["policeConvoy",false]} && {(player distance cursorTarget) < 10}'];

		player addAction ["Rob Person",DS_civ_rob,"",0,false,false,"",
			'(!isNull cursorTarget) && {(player distance cursorTarget) < 3.5} && {isPlayer cursorTarget} && {(animationState cursorTarget) == "Incapacitated"} && {!(cursorTarget getVariable ["robbed",false])}'];

		player addAction ["<t color='#00FF00'>Activate Nitro</t>",DS_fnc_activateNitro,false,2,false,false,"",
			'(!isNull objectParent player) && {(driver (vehicle player)) isEqualTo player} && {((vehicle player) getVariable ["nitro", 0]) > 0}'];

		player addAction ["<t color='#00FF00'>Claim Checkpoint</t>",DS_fnc_captureCP,false,2,false,false,"",
			'((player distance cp1 < 100)||{player distance cp2 < 100}||{player distance cp3 < 100})'];

		player addAction ["Take Secret Documents",DS_fnc_spyClient,["civ"],1,false,true,"",
			'(player distance VipTarget < 15)'];

		player addAction ["Drop Fishing Net",DS_civ_fishingNet,"",0,false,false,"",
			'(surfaceisWater (getPos (vehicle player))) && {(vehicle player) isKindOf "Ship"} && {(speed (vehicle player)) < 2} && {(speed (vehicle player)) > -1} && {!DS_doingStuff}'];

		player addAction ["Dismantle MCU",DS_civ_dismantleMCU,[cursorTarget],0,false,false,"",
			'(!isNull cursorTarget) && {cursorTarget getVariable ["isMCU",false]} && {(typeOf cursorTarget) isEqualTo "O_Truck_03_covered_F"} && {(player distance cursorTarget) < 7}'];

		player addAction ["Dismantle MCU",DS_civ_dismantleMCUWater,[cursorTarget],0,false,false,"",
			'(!isNull cursorTarget) && {cursorTarget getVariable ["isMCUWater",false]} && {(player distance cursorTarget) < 7}'];

		player addAction ["Dismantle Ladder",{["jail10",true,1] call DS_fnc_handleInventory;[cursorObject] call DS_fnc_deleteBuildItem;},[],0,false,false,"",
			'(!isNull cursorObject) && {(player distance cursorObject) < 7} && {cursorObject getVariable "buildItemCiv"}'];
	};
	case west: {
		player addAction ["Pack UAV",DS_fnc_packItem,["B_UAV_01_F","Portable UAV",west,"UAV"],0,false,false,"",
			'(!isNull cursorTarget) && {(typeOf cursorTarget) isEqualTo "B_UAV_01_F"} && {(player distance cursorTarget) < 3} && {(DS_currentWeight + (["UAV",1] call DS_fnc_itemWeight)) <= DS_maxWeight}'];

		player addAction ["<t color='#00FF00'>Reclaim Checkpoint</t>",DS_fnc_reclaimCP,false,2,false,false,"",
			'((player distance cp1 < 100)||{player distance cp2 < 100}||{player distance cp3 < 100})'];

		player addAction ["Pickup Spike Strip",DS_cop_packSpikes,["Land_Razorwire_F","Spike Strip",west,"spikeStrip"],0,false,false,"",
			'_spikes = nearestObjects [player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];

		player addAction ["Detain This Spy",DS_fnc_spyClient,["cop"],1,false,true,"",
			'(player distance VipTarget < 15)'];

		player addAction ["Repair Power Station",DS_fnc_repairPower,2,1,false,true,"",
			'(player distance powerStation1 < 30)'];

		player addAction ["Interact",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
			'(!isNull cursorObject) && {(typeOf cursorObject) isEqualTo "Land_WoodenBox_F"} && {(player distance cursorObject) < 7} && {cursorObject getVariable "buildBox"}'];

		player addAction ["Pack Item",{[cursorObject] call DS_fnc_deleteBuildItem;},[],0,false,false,"",
			'(!isNull cursorObject) && {(player distance cursorObject) < 7} && {cursorObject getVariable "buildItem"}'];

		player addAction ["Dismantle Ladder",{[cursorObject] call DS_fnc_deleteBuildItem;},[],0,false,false,"",
			'(!isNull cursorObject) && {(player distance cursorObject) < 7} && {cursorObject getVariable "buildItemCiv"} && {(DS_maxWeight - DS_currentWeight) < 20}'];

		[] call DS_cop_addTaskActions;
	};
	case independent: {
		//Mechanic
		if(player getVariable ["mechanic",false])then {
			player addAction ["<t color='#FF8000'>Tow This Vehicle</t>",DS_fnc_mechVehLoad,[],0,false,false,"",
	        	'(isNull objectParent player) && {((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship"))} && {DS_vehicleLoading} && {!(typeOf cursorTarget in ["B_Truck_01_mover_F"])}'];

			player addAction ["<t color='#FF8000'>Tow A Vehicle To This Vehicle</t>",DS_fnc_mechVehLoad,[],0,false,false,"",
				'(isNull objectParent player) && {(typeOf cursorTarget) isEqualTo "B_Truck_01_mover_F"} && {!DS_vehicleLoading} && {!(cursorTarget getVariable ["gotLoad",false])}'];

			player addAction ["<t color='#FF8000'>Un-tow Vehicle</t>",DS_fnc_mechVehUnload,[cursorTarget],0,false,false,"",
	        	'(isNull objectParent player) && {(typeOf cursorTarget) isEqualTo "B_Truck_01_mover_F"} && {cursorTarget getVariable ["gotLoad",false]}'];

			player addAction ["Building Items",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
				'(!isNull cursorTarget) && {(DS_infoArray select 23) > 19} && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air"))} && {(player distance cursorTarget) < 8} && {cursorTarget in DS_keyRing}'];

			player addAction ["Repair Nearby Buildings",DS_fnc_mechRepairBuildings,[[],[]],0,false,false,"",
				'(!isNull cursorTarget) && {(DS_infoArray select 23) > 22} && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air"))} && {(player distance cursorTarget) < 8} && {cursorTarget in DS_keyRing}'];

			player addAction ["<t color='#FF8000'>Make Repair Kit</t>",DS_mech_makeRepair,[],0,false,false,"",""];

			player addAction ["<t color='#FF8000'>Make Nitro Kit</t>",DS_mech_makeNos,[],0,false,false,"",""];
		};

		//Medic
		if(player getVariable ["medic",false])then {
			player addAction ["<t color='#FF8000'>Make MediKit</t>",DS_med_makeMedi,[],0,false,false,"",""];

			player addAction ["Building Items",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
				'(!isNull cursorTarget) && {(DS_infoArray select 10) > 27} && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air"))} && {(player distance cursorTarget) < 8} && {cursorTarget in DS_keyRing}'];
		};

		//Security
		if(player getVariable ["security",false])then {
			player addAction ["Interact",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
				'(!isNull cursorTarget) && {(typeOf cursorTarget) isEqualTo "Land_WoodenBox_F"} && {(player distance cursorTarget) < 7} && {cursorTarget getVariable "buildBox"}'];

			player addAction ["Pack Item",{[cursorObject] call DS_fnc_deleteBuildItem;},[],0,false,false,"",
				'(!isNull cursorObject) && {(player distance cursorObject) < 7} && {cursorObject getVariable "buildItem"}'];

			player addAction ["Pickup Spike Strip",DS_cop_packSpikes,["Land_Razorwire_F","Spike Strip",west,"spikeStrip"],0,false,false,"",
				'_spikes = nearestObjects [player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
		};
	};
};