/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Detects what the player is trying to do with the action key and points him in that direction
*/

private ["_fish","_eyes","_view","_objects","_man","_droppedItems","_deadBody","_type","_object"];

if(DS_doingStuff)exitwith{};
_man = cursorTarget;
_object = cursorObject;
_type = (typeOf _man);
if(_type == "CraterLong")exitwith
	{
	deleteVehicle _man;
	};
if(_type == "CraterLong_small")exitwith
	{
	deleteVehicle _man;
	};
_remains = (nearestObjects [getpos player, ["Land_HumanSkeleton_F"],  4] select 0);
_droppedItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
_deadBody = ["Land_HumanSkeleton_F"];
if((DS_truckDriver)&&(_man getVariable ["chopperMission",false]))exitwith
	{
	_man setDamage 0;
	_man attachTo[player,[0,5.5,1.2]];
	DS_spikestrip = _man;
	DS_spikeAction = player addAction["Release Object",{if(!isNull DS_spikestrip) then {detach DS_spikestrip; DS_spikestrip enableSimulation true;DS_spikestrip = ObjNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
	};
if((player distance _man < 6)&&(_man isKindOf "Car") || (_man isKindOf "Air") || (_man isKindOf "Ship") || ((_man getVariable ["mechanicMission",false])&&(player getVariable ["mechanic",false])))exitwith
	{
	[_man] spawn DS_fnc_menuInteractionVehicle;
	};

if((player distance _man < 6)&&(_type in ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F",
"Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F","B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"]))exitwith
	{
	[_man] spawn DS_fnc_menuInteractionVehicle;
	};
		
if((_man isKindOf "Man")&&(player distance _man < 8))exitwith
	{
	[_man] spawn DS_fnc_menuInteraction;
	};
if((_man isKindOf "House_F")&&(player distance _man < 8))then	
	{
	if(_type in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F",
	"Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]) exitwith
		{
		[_man] spawn DS_fnc_menuHouseInteraction;
		};
	};
if((_type in ["Turtle_F"])&&(player distance _man < 6))exitWith 
	{
	[_man,true] call DS_civ_fishing;
	};
if(isNull _man) then 
	{
	private["_fish"];
	_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
	if(!isNil "_fish") then 
		{
		[_fish,false] call DS_civ_fishing;
		};
	};
if ((_type in ["Land_Atm_02_F"])&&(player distance _man < 3)) exitWith	
	{
	[] spawn DS_fnc_menuAtm;
	};
	
if ((_type in _droppedItems)&&(player distance _man < 4)) exitWith	
	{
	[_man] spawn DS_fnc_pickupItem;
	};
	
if ((_type in _deadBody)&&(playerside == west)&&(player distance _man < 4))exitWith	
	{
	[_man] spawn DS_cop_removeRemains;
	};
	
if ((_type in _deadBody)&&(player getVariable ["medic",false])&&(player distance _man < 4))exitWith	
	{
	[_man] spawn DS_med_removeRemainsMedic;
	};

if ((["Atm",str(typeOf _object)] call BIS_fnc_inString)&&(player distance _object < 3)) exitWith 
	{
	[] spawn DS_fnc_menuAtm;
	};	

if ((["atm",str(_object)] call BIS_fnc_inString)&&(player distance _object < 3)) exitWith 
	{
	[] spawn DS_fnc_menuAtm;
	};
/*
_pos1 = (eyePos player);
_pos2 = ([_pos1, ([(positionCameraToWorld [0,0,0]), (positionCameraToWorld [0,0,2])] call BIS_fnc_vectorDiff)] call BIS_fnc_vectorAdd);
_objects = lineIntersectsWith [_pos1,_pos2,objNull,objNull,true];
//_objects = lineIntersectsObjs [_pos1,_pos2,objNull,objNull,true];

systemchat format ["%1 || %2 || %3",_pos1,_pos2,_objects];

{
	if ([": atm",str(_x)] call BIS_fnc_inString) exitWith 
		{
		[] spawn DS_fnc_menuAtm;
		};
}forEach _objects;
*/







