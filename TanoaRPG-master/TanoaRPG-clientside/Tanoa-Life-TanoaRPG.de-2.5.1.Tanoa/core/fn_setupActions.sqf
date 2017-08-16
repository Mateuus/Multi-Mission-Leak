/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
		//Straßensperren aufheben
		life_actions = life_actions + [player addAction["Sperre aufheben",tanoarpg_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		//Nagelbänder aufheben
		life_actions = life_actions + [player addAction["Nagelband aufheben",tanoarpg_fnc_packupSpikes,"",0,false,false,"",' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
		//Hinsetzen
		life_actions = life_actions + [player addAction["Hinsetzen",tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
		//Aufstehen
		life_actions = life_actions + [player addAction["Aufstehen", tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
		//Polizeimarke
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Polizeimarke zeigen</t>",tanoarpg_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && player distance cursorTarget < 3 && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
	};
	
	case civilian:
	{
		//Take The Organs
		life_actions = life_actions + [player addAction["Skalpell benutzen",tanoarpg_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
		//Hinsetzen
		life_actions = life_actions + [player addAction["Hinsetzen",tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
		//Aufstehen
		life_actions = life_actions + [player addAction["Aufstehen", tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
		//Flugzeug Rückwärts An
		life_actions = life_actions + [player addAction ["<t color='#00FF00'>Reverse Thrust einschalten</t>", tanoarpg_fnc_aircraftPushBack,"",10,false,false,"",'((driver (vehicle player)) == player) && ((vehicle player) isKindOf "Air") && !life_flyback && ((typeof (vehicle player)) in life_flybacks)']];
		//Flugzeug Rückwärts Aus
		life_actions = life_actions + [player addAction ["<t color='#FF0000'>Reverse Thrust ausschalten</t>", "life_flyback = false;","",10,false,false,"",'((driver (vehicle player)) == player) && ((vehicle player) isKindOf "Air") && life_flyback && ((typeof (vehicle player)) in life_flybacks)']];
		//Ausrauben
		life_actions = life_actions + [player addAction["Person ausrauben",tanoarpg_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		//Zivlistenmarke
        life_actions = life_actions + [player addAction["<t color='#00FF00'>Personalausweis zeigen</t>",tanoarpg_fnc_civilianShowLicense,"",1,false,true,"",' playerSide == civilian && player distance cursorTarget < 3 && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		//Straßensperren aufheben
		life_actions = life_actions + [player addAction["Sperre aufheben",tanoarpg_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		//Nagelbänder aufheben
		life_actions = life_actions + [player addAction["Nagelband aufheben",tanoarpg_fnc_packupSpikes,"",0,false,false,"",' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
	};
	
	case east:
	{
		//Take The Organs
		life_actions = life_actions + [player addAction["Skalpell benutzen",tanoarpg_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
		//Hinsetzen
		life_actions = life_actions + [player addAction["Hinsetzen",tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
		//Aufstehen
		life_actions = life_actions + [player addAction["Aufstehen", tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
		//Ausrauben
		life_actions = life_actions + [player addAction["Person ausrauben",tanoarpg_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		//Imperiummarke
        life_actions = life_actions + [player addAction["<t color='#00FF00'>Imperialistenschein zeigen</t>",tanoarpg_fnc_imperiumShowLicense,"",1,false,true,"",' playerSide == east && player distance cursorTarget < 3 && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		//Straßensperren aufheben
		life_actions = life_actions + [player addAction["Sperre aufheben",tanoarpg_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		//Nagelbänder aufheben
		life_actions = life_actions + [player addAction["Nagelband aufheben",tanoarpg_fnc_packupSpikes,"",0,false,false,"",' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
	};
	
	case independent:
	{
		//Hinsetzen
		life_actions = life_actions + [player addAction["Hinsetzen",tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
		//Aufstehen
		life_actions = life_actions + [player addAction["Aufstehen", tanoarpg_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
		//Medicmarke
        life_actions = life_actions + [player addAction["<t color='#00FF00'>EMS-Schein zeigen</t>",tanoarpg_fnc_medicShowLicense,"",1,false,true,"",' playerSide == independent && player distance cursorTarget < 3 && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		//Straßensperren aufheben
		life_actions = life_actions + [player addAction["Sperre aufheben",tanoarpg_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		//Nagelbänder aufheben
		life_actions = life_actions + [player addAction["Nagelband aufheben",tanoarpg_fnc_packupSpikes,"",0,false,false,"",' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
	};
};