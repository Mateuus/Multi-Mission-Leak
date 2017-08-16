#include "..\..\macros.hpp"
/*
	File: fn_increaseFuel.sqf
	Autor: MarkusSR1984
	
	Description: Erhöt den Spritverbrauch der Fahrzeuge und erledigt noch so einige dinge

	Diese Datei muss wieder Ihrem eigentlichen Zweck zugeführt werden
	alles andere Über Eventhandler erledigen
	
*/

_lastVehicle = vehicle player;
saveFuelVehicleQueue = [];

while {true} do 
{
	if (vehicle player != _lastVehicle) then  // Sichtweite setzen falls nötig
	{
		[] spawn DWEV_fnc_updateViewDistance;
		_lastVehicle = vehicle player;
	};

	if (vehicle player != player) then // Spieler befindet sich in einem Fahrzeug
	{
	_unit = vehicle player;
	_vehicleSide = _unit getVariable["side","unknown"];
	_vehicleSlotPlayer = assignedVehicleRole player;
	
		if ((driver vehicle player == player) ) then // Spieler ist der Fahrer des Fahrzeuges
		{
			_rate = 0;
			_speedrate = 0;
			_type = typeOf _unit;
			_saveFuel = (round ((fuel _unit) * 100));
						
			// Civilisten nicht an Steuer eines Feuerwehr autos
	/*		if (_vehicleSide == "med" && (side player) == civilian) exitWith 
			{
				hint "Du hast keine Berechtigung dieses Fahrzeug zu fahren";
				if (_unit in DWEV_vehicles) then // Wenn der Spieler einen Schüssel besitzt nimm ihm diesen ab
				{
					DWEV_vehicles = DWEV_vehicles - [_unit];
				};
				_unit setVehicleLock "LOCKED"; // Fahrzeug abschließen
				moveOut player; // Spieler aus dem Fahrzeug werfen
			};
	*/
			
			if ((_unit) getVariable["sperre",false] || (_unit) getVariable["protected",false]) then
			{
				_unit setVariable["wegfahrsperre",true];
				{
					if ((_x select 0) == getPlayerUID player) then 
					{
						hint format ["Hallo %1\nDie Wegfahrsperre wurde für dich deaktiviert!",(_x select 1)];
						_unit setVariable["wegfahrsperre",false];
						_unit setVariable["alarm_in_use",false,true];
					};
				} count (_unit getVariable["vehicle_info_owners",[]]);
				
				if (_unit getVariable["wegfahrsperre",false]) then 
				{
					hint "Dieses Fahrzeug ist durch eine Wegfahrsperre geschützt";
					_unit engineOn false;
					_unit setVelocity[0,0,0];
				}			
			}
			else
			{
				_unit setVariable["wegfahrsperre",false]; // Sperre aufheben
			};
				
			_unit removeAllEventHandlers "handleDamage"; // Zur Sicherheit das nicht 1000 EV auf dem Fahrzeug liegen
			_unit removeAllEventHandlers "Engine";
			_unit addEventHandler ["handleDamage", {_this call DWEV_fnc_handleVehDamage}]; // Wenn Schaden verursacht wird in der DB speichern // ACHTUNG muss auch beim reparieren aufgerufen werden
			_unit addEventHandler ["Engine",{if ((_this select 0) getVariable["wegfahrsperre",false]) then {(_this select 0) engineOn false; (_this select 0) setVelocity[0,0,0];};}];
		
		
			// Konfiguration der Fahrzeuge
			switch (_type) do 
			{ 
				case "B_Heli_Light_01_F": {_rate = 1;}; // Hummingbird
				case "I_Plane_Fighter_03_CAS_F": { _rate = 0.1; }; // A-143 Buzzard
				case "B_Plane_CAS_01_F": { _rate = 0.1; }; // A-164 Wipeout
				case "O_Plane_CAS_02_F": { _rate = 0.1; }; // To-199 Neophron 
				case "B_Heli_Attack_01_F": { _rate = 2.5; }; // AH-99 Blackfoot
				case "O_Heli_Attack_02_F": { _rate = 3.5; }; // Mi-48 Kajman
				case "O_Heli_Attack_02_black_F": { _rate = 3.5; }; // Mi-48 Kajman
				case "B_Heli_Transport_01_F": { _rate = 3.5; }; // ghosthawk
				case "C_Heli_Light_01_civil_F": { _rate = 1; }; // M-900
				case "I_Heli_Transport_02_F": { _rate = 3; }; // MoHawk
				case "I_Heli_light_03_unarmed_F": { _rate = 1.25; }; // HellCat
				case "B_Heli_Transport_03_unarmed_F": { _rate = 3; }; // Huron
				case "O_Heli_Light_02_unarmed_F": { _rate = 1.5; }; // Orca		
				case "O_Truck_03_ammo_F": { _rate = 8; }; // Tempest Munition
				case "B_MRAP_01_F": { _rate = 7; }; // Hunter
				case "O_MRAP_02_F": { _rate = 8; }; // ifrit
				case "I_MRAP_03_F": { _rate = 8; }; // strider
				case "B_SDV_01_F": { _rate = 1; }; // strider
				case "C_Plane_Civil_01_F": { _rate = 0.2; }; // APEX Cessna
				case "B_T_VTOL_01_infantry_F": { _rate = 0.2; }; // APEX Senkrechtstarter Propeller
				case "O_T_VTOL_02_infantry_F": { _rate = 0.2; }; // Senkrechtstarter Düsenjet
				default {_rate = 4; };  // Standardwert
			};
			
			// _rate 2 == Doppelter Verbrauch + Geschwindigkeitsanteil
			// _rate 1 == Original Arma Verbrauch + Geschwindigkeitsanteil
			// _rate 0 == KEIN VERBRAUCH
			
		
		
		
			while {(alive _unit) and (fuel _unit > 0)} do 
			{ 
				_lastFuel = fuel _unit;
				sleep 0.25;
				_currFuel = fuel _unit;
				_fuelDiff = _lastFuel - _currFuel;
				_speedrate = ((_rate * speed _unit) / 100);			
				if (isengineon _unit && (_lastFuel > _currFuel)) then 
				{
					_unit setFuel ( _lastFuel - (_fuelDiff * (_rate + _speedrate)));
				};
			
			
				if ((_saveFuel - 5)>= (round ((fuel _unit) * 100)) || (_saveFuel)< (round ((fuel _unit) * 100))) then
				{
					_saveFuel = (round ((fuel _unit) * 100));
					
					if !(_unit in saveFuelVehicleQueue) then 
					{
						saveFuelVehicleQueue pushBack _unit;
						_unit spawn 
						{
							sleep 30;
							[_this ,(round ((fuel _this) * 100))] remoteExec ["DB_fnc_saveVehFuel",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
							saveFuelVehicleQueue = saveFuelVehicleQueue - [_this];
						};	
					};									
				};
									
				if !((driver vehicle player == player) && (vehicle player != player)) exitWith {_unit removeAllEventHandlers "Engine";};
				
				if (player getVariable["verwarnungen_vdm",0] > 5) then
				{
					[player,"Überfahren anderer Spieler"] remoteExec ["CLIENT_fnc_kickMe",2];
				};
				
			};
		}
		else // Spieler ist nicht der Fahrer des Fahrzeuges
		{
			if ((_unit isKindOf "Air") && (_vehicleSide == "med") && ((side player) == civilian) && (_vehicleSlotPlayer select 0 == "Turret")) exitWith 
			{
				hint "Du hast keine Berechtigung dieses Fahrzeug zu fahren";
				if (_unit in DWEV_vehicles) then // Wenn der Spieler einen Schüssel besitzt nimm ihm diesen ab
				{
					DWEV_vehicles = DWEV_vehicles - [_unit];
				};
				_unit setVehicleLock "LOCKED"; // Fahrzeug abschließen
				moveOut player; // Spieler aus dem Fahrzeug werfen
			};

			if ((_unit isKindOf "Air") && ((_unit getVariable["sperre",false]) || (_unit getVariable["protected",false]) && (_vehicleSlotPlayer select 0 == "Turret"))) then
			{
				_unit setVariable["wegfahrsperre",true];
				{
					if ((_x select 0) == getPlayerUID player || (_x select 0) == getPlayerUID (driver vehicle player)) then 
					{
						_unit setVariable["wegfahrsperre",false];
					};
										
				} count (_unit getVariable["vehicle_info_owners",[]]);
				
				if (_unit getVariable["wegfahrsperre",false]) then 
				{
					hint "Dieses Fahrzeug ist durch eine Wegfahrsperre geschützt";
					_unit engineOn false;
					_unit setVelocity[0,0,0];
				}			
			}
			else
			{
				_unit setVariable["wegfahrsperre",false]; // Sperre aufheben
			};

			
		};
	};
	
	if (player getVariable["noobschutz",false]) then // Hat der Spieler noch noobschutz ????
	{
		if (((dwf_cash + dwf_atmcash) >= 288000) || !(primaryWeapon player == "") || !(handgunWeapon player == "")) then
		{
			// Spieler hat sich eingelebt, noobschutz wird deaktiviert
			player setVariable["noobschutz",nil,true];
			{_x setVariable["protected",nil,true];} count DWEV_vehicles;
			hint "ACHTUNG\n\nDeine Eingewöhnungsphase ist nun vorrüber. Du bist ab jetzt ein vollwertiger Bürger des Staates Altis und kannst somit von jedem Kriminellen überfallen und getötet werden! Sei auf der Hut!";
			[getPlayerUID player] remoteExec ["DWF_fnc_removeNoobProtection",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen	
		};	
	};

	if (actionWeaponfree && !(currentWeapon player IN WEAPONFREE_ALLOWED_WEAPON)) then
	{
		player action ["SwitchWeapon", player, player, 100];
	};
	
	sleep 1;

};