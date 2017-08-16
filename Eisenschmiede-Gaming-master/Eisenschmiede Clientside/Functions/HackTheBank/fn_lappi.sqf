/*
	HACK THE BANK!
	Autor: stolzerrabe
	
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
	
	-- This Code based on Tonic´s "fn_SpikeTrip.sqf"
	
	It let you deploy a Laptop on to a Table
*/

private["_Lappi","_table"];
if(isNil "HackBankCam")	then {HackBankCam = 0;};
_Lappi = "Land_Laptop_unfolded_F" createVehicle position player;
_Lappi attachTo [player,[0,1.5,1.1]];
_Lappi setDir 180;
_Lappi setVariable["LappiDragged","Dragged",true];


ES_action_placeLappi = player addAction["Laptop platzieren",{if(!isNull ES_theLappi) then 
		{ 
		
		
			_table = nearestObject[player, "OfficeTable_01_new_F"]; 			
			detach ES_theLappi;
			ES_theLappi attachTo[_table,[-0.3,0.1,-1.61]];
			ES_theLappi = ObjNull;

		};	
		player removeAction ES_action_placeLappi; 
		ES_action_placeLappi = nil;
		},"",999,false,false,"",'!isNull ES_theLappi'];
		
		ES_theLappi = _Lappi;
		waitUntil {isNull ES_theLappi};
		if(!isNil "ES_action_placeLappi") then {player removeAction ES_action_placeLappi;};
		if(isNull _theLappi) exitWith {ES_theLappi = ObjNull;};
	
_Lappi enablesimulation false;
_Lappi setDamage 0;



	ES_action_pickupLappi = player addAction["<t color='#00FF00'>Laptop einpacken</t>",ES_fnc_packupLappi,"",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
	ES_action_HTBNow = player addAction["<t color='#FF0000'>Hacke die Bank</t>",ES_fnc_hackthebank,"",0,false,false,"",' _laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0; !isNil "_laptop" && !isNil {(_laptop getVariable "LappiDragged")}'];
			

