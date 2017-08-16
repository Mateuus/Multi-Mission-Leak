/*
	File: fn_CallTaxi.sqf
	Autor: MarkusSR1984
	
	Description: Was tut diesews Script wohl ?!?!?

*/

				if (isNil "last_taxi_call") then {last_taxi_call = 0;};
				if ((diag_tickTime - last_taxi_call) < 60) exitWith {hint "Du darfst nicht so oft nach einem Taxi rufen! Warte etwas und versuch es später erneut.";};
				last_taxi_call = diag_tickTime;
				
				if (surfaceIsWater position player) exitWith
				{
					["Wir würden Ihnen gerne einen Wagen schicken! ABER unsere Fahrzeuge können leider nicht schwimmen! Gehen Sie an Land und versuchen Sie es erneut.","Taxizentrale Wolf",0] call DWF_fnc_clientMessage;
				};
			
				if(call DWEV_fnc_noTaxiZone) exitWith
				{
					["Wir können von unseren Fahrern nicht verlangen dass sie an diesen Ort fahren! Versuch es an einer anderen Stelle!","Taxizentrale Wolf",0] call DWF_fnc_clientMessage;
				};
				
				if (vehicle player != player) exitWith
				{
					["Du hast doch schon ein Fahrzeug ?!? Steig aus wenn du ein Taxi rufen willst","Taxizentrale Wolf",0] call DWF_fnc_clientMessage;
				};
				
				if (player getVariable["LIFETAXI",false]) exitWith
				{				
					["Es ist bereits ein Taxi unterwegs zu dir! Bitte hab ein wenig geduld bis es eingetroffen ist","Taxizentrale Wolf",0] call DWF_fnc_clientMessage;
				};
					
				[player] remoteExec ["MSR_fnc_callTaxi",2]; // evtl direkt an den HC senden ???? KEIN remoteExec !!!!
				