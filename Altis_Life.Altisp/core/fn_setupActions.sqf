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
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) >= 0 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && (animationState cursorObject=="Incapacitated" or animationState cursorObject=="AmovPercMstpSnonWnonDnon_amovpercmstpssurwnondnon") && !(cursorObject getVariable["robbed",FALSE]) ']];
		//Zabierz Telefon
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobSmartphone",life_fnc_robItems,"",0,false,false,"",'!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && (animationState cursorObject=="Incapacitated" or animationState cursorObject=="AmovPercMstpSnonWnonDnon_amovpercmstpssurwnondnon")']];
		//Pasy
		life_actions = life_actions + [player addAction[localize "STR_pAct_PutSeatbelt",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_PutSeatbeltOFF",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']];
		//dowod
		life_actions = life_actions + [player addAction["Pokaż dowód",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
		//seflheal
		life_actions = life_actions + [player addAction["Wylecz się",life_fnc_heal,"",1,false,false,"",'("Medikit" in (items player)) && ((damage player) > 0.1)']];
		//Suicide alahsnackbar
		life_actions = life_actions + [player addAction["Aktywuj bombe",life_fnc_suicideBomb,"",0,false,false,"",' vest player == "V_HarnessOGL_brn" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		life_smokeTrail = false;
life_smokes = [];
life_actions = [];     
        
life_actions pushBack (player addAction["Smoke Trail",
    {
        life_smokeTrail = true;
        {
            private _colour = ["SmokeShellRed", "SmokeShellBlue"] select _forEachIndex;
            for "_i" from 0 to 5 do {
                private _veh = objectParent player;
                private _smoke = _colour createVehicle [random(50),random(50),random(50)];
                _smoke attachTo [_veh, _x];
                life_smokes pushBack _smoke;
            };
        } forEach [[-5,0.855469,-0.6],[5,0.855469,-0.6]];
    },"",0,false,false,"",'!life_smokeTrail && {!isNull objectParent player} && {objectParent player isKindOf "Plane"}']);
    
life_actions pushBack (player addAction["Stop Smoke Trail",
    {
        life_smokeTrail = false;
        {
            deleteVehicle _x;
        } forEach life_smokes;
    },"",0,false,false,"",'life_smokeTrail']);
	
	};

	case west: {
		//CopEnter
		life_actions pushBack [player addAction[localize "STR_pAct_CopDriver",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player == player) && (locked cursorObject) != 0 && cursorObject distance player < 5']];
		life_actions pushBack [player addAction[localize "STR_pAct_CopPassenger",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player == player)&& (locked cursorObject) != 0 && cursorObject distance player < 5 && (!(cursorObject isKindOf "B_Heli_Attack_01_F"))']];
		life_actions pushBack [player addAction[localize "STR_pAct_CopCommander",life_fnc_copEnter,"commander",100,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship"))&& (vehicle player == player) && (locked cursorObject) != 0 && cursorObject distance player < 5 && ((cursorObject isKindOf "B_Heli_Attack_01_F")||(cursorObject isKindOf "B_Heli_Transport_01_F")||(cursorObject isKindOf "B_MRAP_01_hmg_F"))']];
		life_actions pushBack [player addAction[localize "STR_pAct_CopExit",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		//Seize Weapon
		life_actions = life_actions + [player addAction[localize "STR_pAct_SeizeItem",life_fnc_seizeObjects,cursorObject,0,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']];
		//Pasy
		life_actions = life_actions + [player addAction[localize "STR_pAct_PutSeatbelt",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_PutSeatbeltOFF",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']];
		//dowod
		life_actions = life_actions + [player addAction["Pokaż dowód",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
		// nano EMP Little Bird
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Konsola EMP</t>",life_fnc_openEmpMenu,[],8,false,false,"",'[_this] call life_fnc_isEmpOperator']];
	};

	case independent: {
		//CopEnter
		life_actions pushBack [player addAction[localize "STR_pAct_CopDriver",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player == player) && (locked cursorObject) != 0 && cursorObject distance player < 5']];
		life_actions pushBack [player addAction[localize "STR_pAct_CopPassenger",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player == player)&& (locked cursorObject) != 0 && cursorObject distance player < 5 && (!(cursorObject isKindOf "B_Heli_Attack_01_F"))']];
		life_actions pushBack [player addAction[localize "STR_pAct_CopExit",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		//Pasy
		life_actions = life_actions + [player addAction[localize "STR_pAct_PutSeatbelt",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_PutSeatbeltOFF",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']];
		//dowod
		life_actions = life_actions + [player addAction["Pokaż dowód",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
		//Inject Morphine
        life_actions = life_actions + [player addAction[localize "STR_pAct_Inject",life_fnc_injectAction,"",0,false,false,"",'
            !isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && damage cursorTarget > 0.1']];

	};
};