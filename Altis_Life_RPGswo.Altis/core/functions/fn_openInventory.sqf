/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
	private["_vehicle","_veh_data","_unitsnear","_house"];
	if(dialog) exitWith {};
	if (DWEV_action_inUse) exitwith {}; // Fix dass Der Kofferraum während des Sammelns nicht mehr geöffnet werden kann
	if (DWEV_is_processing) exitWith {};// Fix dass Der Kofferraum während des Processens nicht mehr geöffnet werden kann
	_vehicle = param [0,ObjNull,[ObjNull]];
	_house = nearestBuilding (getPosATL player);

	if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR (typeof (_vehicle) IN ["Box_IND_Grenades_F","B_supplyCrate_F"]) )) exitWith {}; //Either a null or invalid vehicle type.
	if(!(_house in DWEV_vehicles) && {(_house getVariable ["locked",false])} && {(_vehicle getVariable ["BoxRobbed",false])}) exitwith {hint "Du hast keine Berechtigung in die Lagerkiste zuschauen, lass sie vom Hausbesitzer oeffnen oder brech sie auf!";};
	//if(player != vehicle player) exitWith {titleText["Du kannst nicht an den Kofferraum, wenn du im Fahrzeug bist.","PLAIN"];};
	
//	_sleeper = random 1; 	/// BUGFIX
//	sleep _sleeper;			/// Maßnahme gegen die Möglichkeit den Kofferraum mit 2 Leuten zu öffnen

	//### Unterbindet das Öffnen des Trunks, wenn eine 2 Zweite Person am Fahrzeug steht
	//_unitsnear = (nearestObjects[_vehicle, ["Man"], 10]) arrayIntersect playableUnits;
	//if(count _unitsnear > 1) exitWith {hint "Es Sind zu viele Leute in der Nähe"};
	//if((count crew _vehicle) >= 1) exitWith {titleText["Du kannst nicht an den Kofferraum, wenn Personen im Fahrzeug sind.","PLAIN"];};
	

	
	if((_vehicle getVariable ["trunk_in_use",false])) exitWith 
	{
		_unlockTime = ((_vehicle getVariable ["last_trunk_in_use_time",0]) - (serverTime - (30 * 60)));
		hint format ["Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden.\n\n Sollte dies eine Fehlannahme sein, kannst du deinen Kofferraum in %1 Minuten wieder öffnen",([_unlockTime] call DWEV_fnc_formatTime)];
	};
	
	if !(_vehicle getVariable ["INV_OPENER",(getPlayerUID player)] == getPlayerUID player) exitWith {hint "Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden."};

	[_vehicle,"trunk_in_use",true,true] remoteExecCall ["DWF_fnc_setObjVar",2];
	_vehicle setVariable["trunk_in_use",true,true];

	if(!createDialog "TrunkMenu") exitWith
	{
		hint "Fehler beim öffnen";
		_vehicle setVariable["trunk_in_use",false,true];
		[_vehicle,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2];
	};
	disableSerialization;

	_this spawn 
	{
		_vehicle = param [0,ObjNull,[ObjNull]];
		
		while {(_vehicle getVariable ["trunk_in_use",false] || !(isNull (findDisplay 3500)))} do
		{
			sleep 0.5;
			if !(_vehicle getVariable ["INV_OPENER",(getPlayerUID player)] == (getPlayerUID player)) exitWith {closeDialog 0; hint "Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden."};
		};
		
		//if !(_vehicle getVariable ["INV_OPENER",(getPlayerUID player)] == getPlayerUID player) exitWith {closeDialog 0; hint "Der Kofferraum ist in gebrauch, er kann nur von einer Person zur gleichen Zeit genutzt werden."};
	};


	if (typeof (_vehicle) IN ["Box_IND_Grenades_F","B_supplyCrate_F"]) then 
	{
		ctrlSetText[3501,format["Stauraum - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	}
	else 
	{
		ctrlSetText[3501,format["Kofferraum - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};

	_veh_data = [_vehicle] call DWEV_fnc_vehicleWeight;

	if(_veh_data select 0 == -1) exitWith
	{
		closeDialog 0;
		_vehicle setVariable["trunk_in_use",false];
		[_vehicle,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2];
		hint "Dieses Fahrzeug ist nicht zum Speichern von virtuellen Gegenständen.";
	};

	ctrlSetText[3504,format["Gewicht: %1/%2",_veh_data select 1,_veh_data select 0]];
	[_vehicle] call DWEV_fnc_vehInventory;
	DWEV_trunk_vehicle = _vehicle;

	_vehicle spawn
	{
		[_this,"last_trunk_in_use_time",serverTime,true] remoteExecCall ["DWF_fnc_setObjVar",2];
	
		waitUntil {sleep 0.25; isNull (findDisplay 3500)};
		
		/*
		if ((side player) == Civilian && !vehicleEnablefullsafe_T)	then
		{
			if((typeOf (_this) in ["B_Truck_01_transport_F","B_Truck_01_mover_F","B_Truck_01_fuel_F","B_Truck_01_box_F","O_Truck_03_device_F","O_Truck_03_ammo_F","B_Truck_01_ammo_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F"])) then
			{
				[_this,player] remoteExec ["DB_fnc_saveVehTrunk",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
				[3] call SOCK_fnc_updatePartial;
			};
		}
		else
		{
			if((_this iskindof "LandVehicle")) then 
			{		
				[_this,player] remoteExec ["DB_fnc_saveVehTrunk",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
				[3] call SOCK_fnc_updatePartial;
			};
		};
		*/
		
		if((_this iskindof "LandVehicle") && vehicleEnablefullsafe_T) then 
		{		
			[_this,player] remoteExec ["DB_fnc_saveVehTrunk",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
			[3] call SOCK_fnc_updatePartial;
		};

		
		if (typeof (_this) IN ["Box_IND_Grenades_F","B_supplyCrate_F"]) then 
		{
			[_this] remoteExec ["DWF_fnc_updateHouseContainerTrunk",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
			[3] call SOCK_fnc_updatePartial;
		};
		
		_this setVariable["trunk_in_use",false,true];
		[_this,"trunk_in_use",false,true] remoteExecCall ["DWF_fnc_setObjVar",2];
	};