/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

_house = nearestBuilding (getPosATL player);
if(!(_house in life_vehicles)) exitWith {hint "Du musst dich im Haus befinden um eine Kiste zu platzieren"};
_containers = _house getVariable["containers",[]];
_houseCfg = [(typeOf _house)] call tanoarpg_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint "Du kannst aktuell keine Boxen mehr in deinem Haus aufstellen."};

_slots = _house getVariable ["slots",[]];
_positions = [_house] call tanoarpg_fnc_getBuildingPositions;
_pos = [0,0,0];

{
	_slots = _house getVariable ["slots",[]];
	if(!(_x in _slots)) exitWith 
	{
		_slots pushBack _x;
		_house setVariable["slots",_slots,true];
		_pos = _x;
	};
} foreach _positions;

if(_pos isEqualTo [0,0,0]) exitWith {hint "Du hast keinen freien Platz mehr."};
if(!([false,_boxType,1] call tanoarpg_fnc_handleInv)) exitWith {};
switch (_boxType) do {
	case "storagesmall": {
		_container = "Box_IND_Grenades_F" createVehicle [0,0,0];
		_container allowDamage false;
		_container setPosATL _pos;
		
		_container spawn
		{
			sleep 3;
			_this setVectorUP [0,0,1];
			_this allowDamage false;
		};
		
		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[(_house getVariable["containers",[]]), (_house getVariable["house_id",-1]), (getPosATL _house)] remoteExec ["TEX_fnc_updateHouseContainers", 2, false];
		
		//Empty out the crate
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	};
	
	case "storagebig": {
		_container = "I_supplyCrate_F" createVehicle [0,0,0];
		_container allowDamage false;
		_container setPosATL _pos;
		
		_container spawn
		{
			sleep 3;
			_this setVectorUP [0,0,1];
			_this allowDamage false;
		};
		
		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[(_house getVariable["containers",[]]), (_house getVariable["house_id",-1]), (getPosATL _house)] remoteExec ["TEX_fnc_updateHouseContainers", 2, false];
		
		//Empty out the crate
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	};
};