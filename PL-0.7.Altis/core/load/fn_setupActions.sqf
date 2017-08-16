#include "..\script_macros.hpp"
/*
	File: fn_setupActions.sqf

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
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		//Présenter le Passeport
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Montrer son passeport</t>",life_fnc_civPasseport,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (cursorTarget distance player < 5) ']];
		//Présenter l'insigne BIR
		if(license_civ_BIR) then {
		life_actions = life_actions + [player addAction["<t color='#1F80C9'>Montrer son insigne</t>",life_fnc_civShowLicense,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (cursorTarget distance player < 5) ']];
		};
		//Monter en conducteur civ
		life_actions = life_actions + [player addAction["<t color='#0000BB'>Monter en conducteur</t>",life_fnc_dlcEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) == 0 && (((typeOf cursorTarget) == "C_Offroad_02_unarmed_F")||((typeOf cursorTarget) == "B_T_VTOL_01_vehicle_F")||((typeOf cursorTarget) == "B_T_VTOL_01_infantry_F")||((typeOf cursorTarget) == "O_T_VTOL_02_infantry_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_racing_F")||((typeOf cursorTarget) == "C_Boat_Transport_02_F")||((typeOf cursorTarget) == "B_CTRG_LSV_01_light_F")||((typeOf cursorTarget) == "B_T_LSV_01_unarmed_F")||((typeOf cursorTarget) == "C_Scooter_Transport_01_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_box_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_F")||((typeOf cursorTarget) == "B_Heli_Transport_03_unarmed_F")||((typeOf cursorTarget) == "O_T_LSV_02_armed_F")||((typeOf cursorTarget) == "O_T_LSV_02_unarmed_F")||((typeOf cursorTarget) == "C_Kart_01_Blu_F")||((typeOf cursorTarget) == "C_Kart_01_Fuel_F")||((typeOf cursorTarget) == "C_Kart_01_Red_F")||((typeOf cursorTarget) == "C_Kart_01_Vrana_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_F")) && (cursorTarget distance player < 5) && (playerSide == civilian)']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Se Soigner</t>",life_fnc_heal,"",99,false,false,"",' isNull objectParent player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
	};
	case west: {
		//Monter en conducteur cop
		life_actions = life_actions + [player addAction["<t color='#0000BB'>Monter en conducteur</t>",life_fnc_dlcEnter,"",1,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) == 0 && (((typeOf cursorTarget) == "C_Offroad_02_unarmed_F")||((typeOf cursorTarget) == "B_T_VTOL_01_vehicle_F")||((typeOf cursorTarget) == "B_T_VTOL_01_infantry_F")||((typeOf cursorTarget) == "O_T_VTOL_02_infantry_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_racing_F")||((typeOf cursorTarget) == "C_Boat_Transport_02_F")||((typeOf cursorTarget) == "B_CTRG_LSV_01_light_F")||((typeOf cursorTarget) == "B_T_LSV_01_unarmed_F")||((typeOf cursorTarget) == "C_Scooter_Transport_01_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_box_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_F")||((typeOf cursorTarget) == "B_Heli_Transport_03_unarmed_F")||((typeOf cursorTarget) == "O_T_LSV_02_armed_F")||((typeOf cursorTarget) == "O_T_LSV_02_unarmed_F")||((typeOf cursorTarget) == "C_Kart_01_Blu_F")||((typeOf cursorTarget) == "C_Kart_01_Fuel_F")||((typeOf cursorTarget) == "C_Kart_01_Red_F")||((typeOf cursorTarget) == "C_Kart_01_Vrana_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_F")) && (cursorTarget distance player < 5) && (playerSide == west)']];
		life_actions = [player addAction["<t color='#FF0000'>Saisir les objets</t>",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'(count(nearestObjects [player,["WeaponHolder"],3])>0)']];
		life_actions = life_actions + [player addAction["<t color='#1F80C9'>Montrer son insigne</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (cursorTarget distance player < 5) ']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Se Soigner</t>",life_fnc_heal,"",99,false,false,"",' isNull objectParent player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
		life_actions pushBack (player addAction["<t color='#F70101'>Demande de renforts</t>",life_fnc_confirmRenfort,"",0,FALSE,FALSE,""]);
	};
	case independent: {
		//Monter en conducteur DLC
		life_actions = life_actions + [player addAction["<t color='#0000BB'>Monter en conducteur</t>",life_fnc_dlcEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) == 0 && (((typeOf cursorTarget) == "C_Offroad_02_unarmed_F")||((typeOf cursorTarget) == "B_T_VTOL_01_vehicle_F")||((typeOf cursorTarget) == "B_T_VTOL_01_infantry_F")||((typeOf cursorTarget) == "O_T_VTOL_02_infantry_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_racing_F")||((typeOf cursorTarget) == "C_Boat_Transport_02_F")||((typeOf cursorTarget) == "B_CTRG_LSV_01_light_F")||((typeOf cursorTarget) == "B_T_LSV_01_unarmed_F")||((typeOf cursorTarget) == "C_Scooter_Transport_01_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_box_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_F")||((typeOf cursorTarget) == "B_Heli_Transport_03_unarmed_F")||((typeOf cursorTarget) == "O_T_LSV_02_armed_F")||((typeOf cursorTarget) == "O_T_LSV_02_unarmed_F")||((typeOf cursorTarget) == "C_Kart_01_Blu_F")||((typeOf cursorTarget) == "C_Kart_01_Fuel_F")||((typeOf cursorTarget) == "C_Kart_01_Red_F")||((typeOf cursorTarget) == "C_Kart_01_Vrana_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_F")) && (cursorTarget distance player < 5) && (playerSide == independent)']];
		//Monter en conducteur sans DLC
		life_actions = life_actions + [player addAction["Monter en conducteur",life_fnc_medEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		life_actions = life_actions + [player addAction["Monter en passager",life_fnc_medEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		life_actions = life_actions + [player addAction["Monter en chef de bord",life_fnc_medEnter,"chefdebord",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		life_actions = life_actions + [player addAction["Monter en Tireur",life_fnc_medEnter,"tireur",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		life_actions = life_actions + [player addAction["Sortir joueur vehicule",life_fnc_medEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Se Soigner</t>",life_fnc_heal,"",99,false,false,"",' isNull objectParent player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
	};
	case east: {
		//Monter en conducteur cop
		life_actions = life_actions + [player addAction["<t color='#0000BB'>Monter en conducteur</t>",life_fnc_dlcEnter,"",1,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) == 0 && (((typeOf cursorTarget) == "C_Offroad_02_unarmed_F")||((typeOf cursorTarget) == "B_T_VTOL_01_vehicle_F")||((typeOf cursorTarget) == "B_T_VTOL_01_infantry_F")||((typeOf cursorTarget) == "O_T_VTOL_02_infantry_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_racing_F")||((typeOf cursorTarget) == "C_Boat_Transport_02_F")||((typeOf cursorTarget) == "B_CTRG_LSV_01_light_F")||((typeOf cursorTarget) == "B_T_LSV_01_unarmed_F")||((typeOf cursorTarget) == "C_Scooter_Transport_01_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_box_F")||((typeOf cursorTarget) == "O_Heli_Transport_04_F")||((typeOf cursorTarget) == "B_Heli_Transport_03_unarmed_F")||((typeOf cursorTarget) == "O_T_LSV_02_armed_F")||((typeOf cursorTarget) == "O_T_LSV_02_unarmed_F")||((typeOf cursorTarget) == "C_Kart_01_Blu_F")||((typeOf cursorTarget) == "C_Kart_01_Fuel_F")||((typeOf cursorTarget) == "C_Kart_01_Red_F")||((typeOf cursorTarget) == "C_Kart_01_Vrana_F")||((typeOf cursorTarget) == "C_Plane_Civil_01_F")) && (cursorTarget distance player < 5) && (playerSide == west)']];
		life_actions = [player addAction["<t color='#FF0000'>Saisir les objets</t>",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'(count(nearestObjects [player,["WeaponHolder"],3])>0)']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Se Soigner</t>",life_fnc_heal,"",99,false,false,"",' isNull objectParent player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
	};
};
