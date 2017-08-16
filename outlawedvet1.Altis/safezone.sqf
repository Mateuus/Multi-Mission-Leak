/*
    Safezone2.sqf - RPGforYOU
    
    DESCRIPTION:
	Safety zones
    
    CONFIGURATION:
    Edit the #defines below.
*/

private ["_eh1","_inArea","_zone1","_zone2","_zone3","_zone4","_dis1","_dis2","_dis3"];

_zone1 = getMarkerPos "campnorth"; //Rebelcamp North
_zone2 = getMarkerPos "campsouth"; //Rebelcamp South
_zone3 = getMarkerPos "spawn_island"; // Spawn Island
_zone4 = getMarkerPos "Donator_Zone"; // Donator Island

_dis1 = 200; // DISTANCE SAFE ZONE    
_dis2 = 300; // DISTANCE SAFE ZONE  
_dis3 = 280; // DISTANCE SAFE ZONE     


_inArea = false;

switch (playerSide) do
{
	case west:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _dis2) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis1) || (_zone4 distance player < _dis3)) && (!_inArea)) then 
				{     
					//_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint "You are entering a Safe Zone";
					player allowDamage false;
					(vehicle player) allowDamage false;
				};

				if (((_zone1 distance player > _dis2) && (_zone2 distance player > _dis2)  && (_zone3 distance player > _dis1) && (_zone4 distance player > _dis3)) && (_inArea)) then 
				{    
					//player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint "You are leaving a Safe Zone";
					player allowDamage true;
					(vehicle player) allowDamage true;
				};
     
			};
		};
	
	};
	
	case civilian:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _dis2) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis1) || (_zone4 distance player < _dis3)) && (!_inArea)) then 
				{     
					//_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint "You are entering a Safe Zone";
					player allowDamage false;
					(vehicle player) allowDamage false;
				};

				if (((_zone1 distance player > _dis2) && (_zone2 distance player > _dis2)  && (_zone3 distance player > _dis1) && (_zone4 distance player > _dis3)) && (_inArea)) then  
				{    
					//player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint "You are leaving a Safe Zone";
					player allowDamage true;
					(vehicle player) allowDamage true;
				};
     
			};
		};
	
	};
	
	case independent:
	{
		while {true} do
		{
			if (alive player) then
			{	
				if (((_zone1 distance player < _dis2) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis1) || (_zone4 distance player < _dis3)) && (!_inArea)) then 
				{     
					//_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					_inArea = true;
					hint "You are entering a Safe Zone";
					player allowDamage false;
					(vehicle player) allowDamage false;
				};

				if (((_zone1 distance player > _dis2) && (_zone2 distance player > _dis2)  && (_zone3 distance player > _dis1) && (_zone4 distance player > _dis3)) && (_inArea)) then 
				{    
					//player removeEventHandler ["fired", _eh1];
					_inArea = false;
					hint "You are leaving a Safe Zone";
					player allowDamage true;
					(vehicle player) allowDamage true;
				};
     
			};
		};
	
	};
	uiSleep 1.5;
};