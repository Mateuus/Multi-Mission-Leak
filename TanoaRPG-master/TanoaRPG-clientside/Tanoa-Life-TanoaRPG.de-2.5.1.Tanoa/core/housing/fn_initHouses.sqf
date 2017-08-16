/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
private["_position","_containers","_houseInv","_house","_houseName","_marker","_containerData","_trunk","_className","_weapons","_magazines","_items","_backpacks","_positions","_pos","_slots","_container","_houseID","_dataOld","_searchedData"];
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = (nearestObject [_position, "Building"]);
	_house setVariable["uid",round(random 99999),true];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	
	[_house,{ _this allowDamage false; }] remoteExec ["BIS_FNC_CALL",-2,true]; 
	_containers = [];
	_house setVariable["slots",[],true];
	if(!isNil {(_house getVariable "containers")}) then
	{
		{
			if(!isNull _x) then
			{
				deleteVehicle _x;
			};
		} foreach (_house getVariable "containers");
	};
	
	_houseInv = (_x select 1);	
	_trunk = (_houseInv select 0);
	_containerData = (_houseInv select 1);
	_house setVariable["Trunk",_trunk,true];
		
	_slots = [];
	{
		if(count _x == 0) exitWith {};
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;
		
		_positions = [_house] call tanoarpg_fnc_getBuildingPositions;
		_pos = [0,0,0];
		
		_slots pushBack (_positions select _forEachIndex);
		_pos = (_positions select _forEachIndex);
		
		if(_pos isEqualTo [0,0,0]) exitWith {};
		
		_container = createVehicle[_className,_pos,[],0,"NONE"];
		_container allowDamage false;
		_container setPosATL _pos;
		
		_container spawn
		{
			sleep 3;
			_this setVectorUP [0,0,1];
			_this allowDamage false;
		};
		
		_containers pushBack _container;
		clearWeaponCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearBackpackCargoGlobal _container;
		
		//Add weapons to the crate.
		{
			_weaponCount = (_weapons select 1) select _forEachIndex;
			_container addWeaponCargoGlobal [_x,_weaponCount];
		} foreach (_weapons select 0);
		
		//Add magazines
		{
			_magazineCount = (_magazines select 1) select _forEachIndex;
			_container addMagazineCargoGlobal [_x,_magazineCount];
		} foreach (_magazines select 0);
			
		//Add items
		{
			_itemCount = (_items select 1) select _forEachIndex;
			_container addItemCargoGlobal [_x,_itemCount];
		} foreach (_items select 0);
		
		//Add backpacks
		{
			_backpackCount = (_backpacks select 1) select _forEachIndex;
			_container addBackpackCargoGlobal [_x,_backpackCount];
		} foreach (_backpacks select 0);
		
	} foreach _containerData;
	
	_house setVariable["slots",_slots,true];
	_house setVariable["containers",_containers,true];
	
	_houseID = (_house getVariable["house_id", -1]);
	if(_houseID == (-1)) exitWith {};
	
	_dataOld = (mvh getVariable [format["HousesData_%1", (getPlayerUID player)],[]]);
	_searchedData = [];
	_data = [];
	{
		if((_x select 0) != _houseID) then
		{
			_data pushBack _x;
		} else {
			if((_position distance (_x select 2)) < 2) then
			{
				_searchedData = _x;
			};
		};
	} forEach _dataOld;
	
	if((count _searchedData) > 0) then
	{
		_searchedData set[1,_containers];
		_data pushBack _searchedData;
		mvh setVariable [format["HousesData_%1", (getPlayerUID player)], _data, true];
	};
} foreach life_houses;