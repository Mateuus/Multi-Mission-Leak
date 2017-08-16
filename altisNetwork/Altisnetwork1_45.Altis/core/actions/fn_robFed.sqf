#include "..\..\script_macros.hpp"

/*

	file: fn_robShops.sqf

	Original Author: MrKraken


addAction["Rob the Gas Station",life_fnc_robShops, "Kavala Gas Services"];

*/

private["_robber","_shop","_name","_cashStored","_ui","_progress","_pgText","_cP","_pos","_policeWarned"];

_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_cashStored = 300000 + round(random 450000); //The amount the shop has to rob, you could make this a parameter of the call 
_action = [_this,2] call BIS_fnc_param;//Action name
_name = [_this,3] call BIS_fnc_param;//Shop Name  

//Checks
//-- Check the side
if({side _x == west} count playableUnits < 5) exitWith {hint "There are not enough cops online for you to rob this! (5 Minimum)"};

//-- Check if player is civilian
if(side _robber != civilian) exitWith { hint "You can not rob this cashier!" };

//-- Check if player is within range
if(_robber distance _shop > 4) exitWith { hint "You need to be within 1m of the cashier to rob him!" };

//-- Check if player has a weapon
if (currentWeapon _robber == "") exitWith { hint "You cannot rob the cashier without a weapon!" };

//-- Check if player is not in vehicle
if(vehicle player != player) exitWith {hint "You cannot rob this cashier from a vehicle!";};
//Var checks
if(_shop getVariable ["fedrob_empty",false]) exitWith {hint "This cashier was robbed recently and cannot be robbed again for a time.";};
if(_shop getVariable ["fedrob_ip",false]) exitWith {hint "This cashier is already being robbed!";};

//Check if player has Vitem boltcutters
//if (!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false; hint "You need to have boltcutters"};


//-- start robbery
_shop setVariable ["fedrob_ip",true,true];

//-- create a map marker
_stationMarker = createMarker ["station_robbery", player];
_stationMarker setMarkerShape "ICON";
_stationMarker setMarkerType "mil_warning";
_stationMarker setMarkerColor "ColorRed";
_stationMarker setMarkerText format["BANK ROBBERY IN PROGRESS"];


_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);

//-- could do something with this later but meh
[1,format["ALARM! - Kavala Bank is being robbed!"]] remoteExec ["life_fnc_broadcast",west];
["drob", false] remoteExec ["life_fnc_dispatch",west];
[0,format["ALARM! - Kavala Bank is being robbed!"]] remoteExec ["life_fnc_broadcast",west];

//-- Setup progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress, stay close (2m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01; 

while{true} do 
{			
	sleep 0.1;	
	_cP = _cP + 0.0001;		
	_progress progressSetPosition _cP;		
	_pgText ctrlSetText format["Robbery in Progress, stay close (2m) (%1%2)...",round(_cP * 100),"%"];	

	if(_cP >= 1) exitWith {};		
	if(_robber distance _shop > 4) exitWith {hint "You need to stay within 2m to Rob registry! - Now cops are on the way.";};		
	if!(alive _robber) exitWith {};	
	if(life_istazed) exitWith {};
	if(player != vehicle player) exitWith {};
};

//-- Cleanup - reset npc, delete marker
_shop switchMove "";
deleteMarker "station_robbery";
5 cutText ["","PLAIN"];

//-- Set vars
_shop setVariable ["fedrob_ip",false,true];
_shop setVariable ["fedrob_empty",true,true];

//-- Make the player wanted
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

//-- If the player suceeded, give them the money
if(_cP >= 1) then {
	titleText[format["You have stolen £%1, you should run before the cops arrive!",[_cashStored] call life_fnc_numberText],"PLAIN"];	
	life_cash = life_cash + _cashStored;	
	//-- Player cant use atm for a time
	life_use_atm = false;	
	sleep (30 + random(180));
	life_use_atm = true;
	if!(alive _robber) exitWith {};
};

//-- Wait a while so shop can be robbed again

sleep 21600;
_shop setVariable ["fedrob_empty",false,true];