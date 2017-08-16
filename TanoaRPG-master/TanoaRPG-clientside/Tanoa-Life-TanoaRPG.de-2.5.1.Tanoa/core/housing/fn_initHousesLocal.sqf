/*
	Author: CooliMC
	File: fn_initHousesLocal.sqf
	
	Description:
	New Init Of Houses Because Tonic did something Wrong and Bohemia did everything wrong
*/
private["_pos","_houses","_numOfDoors","_house"];
_houses = (mvh getVariable ["Houses", []]);

if((count _houses) != 0) then
{
	{
		_pos = call compile format["%1",_x select 2];
		_house = (nearestObject [_pos, "Building"]);
		if((_house getVariable ["house_id", -1]) == (-1)) then
		{
			_house setVariable["house_owner",[_x select 1,_x select 3],true];
			_house setVariable["locked",true,true];
			
			_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
			for "_i" from 1 to _numOfDoors do {
				_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
			};
			
			_house setVariable["house_id",_x select 0,true];
		};
	} forEach _houses;
};