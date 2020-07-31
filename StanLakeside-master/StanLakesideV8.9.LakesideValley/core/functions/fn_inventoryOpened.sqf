/*
Inventory Opened Event Handler
*/
private["_container","_unit","_handle"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
handle = false;


/*
if(vehicle player != player || _container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air" || _container isKindOf "Motorcycle" ) then {
	[] spawn fnc_testdupe;
};	
*/


_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) exitWith {
	handle = true;
	handle;
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		[localize "STR_House_ContainerDeny", false] spawn domsg;
		handle = true;
		handle;
	};
};


//Allow !deadPlayers who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	[localize "STR_NOTF_NoLootingPerson", false] spawn domsg;
	handle = true;
	handle;
};

if(_container isKindOf "Car" && {(locked _container) == 2}) exitWith {
	if(!(_container in life_vehicles)) then {
	["Nie mozesz otworzyc bagaznika gdy pojazd jest zamkniety", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "Ship" && {(locked _container) == 2}) exitWith {
	if(!(_container in life_vehicles)) then {
	["Nie mozesz otworzyc bagaznika gdy pojazd jest zamkniety", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "Air" && {(locked _container) == 2}) exitWith {
	if(!(_container in life_vehicles)) then {
	["Nie mozesz otworzyc bagaznika gdy pojazd jest zamkniety", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "LandVehicle" && {(locked _container) == 2}) exitWith {
	if(!(_container in life_vehicles)) then {
	["Nie mozesz otworzyc bagaznika gdy pojazd jest zamkniety", false] spawn domsg;
	handle = true;
	handle;
	};
};

if(_container isKindOf "MotorCycle" && {(locked _container) == 2}) exitWith {
	if(!(_container in life_vehicles)) then {
	["Nie mozesz otworzyc bagaznika gdy pojazd jest zamkniety", false] spawn domsg;
	handle = true;
	handle;
	};
};



[] spawn
{
	uiSleep 0.05;
	waituntil {!(isnull (finddisplay 602)) || handle };
	if(!handle) then {
		((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call fnc_item_CG"];  
		((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call fnc_item_CG"];  
		((findDisplay 602) displayCtrl 640) ctrlSetEventHandler ["LBDblClick", "_this call fnc_item_CG"];  
		((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call fnc_item_CG"];
	}; 
};

[] spawn
{
	waituntil {!(isnull (finddisplay 602)) || handle };
	if(!handle) then {
		while {true} do
		{
			if(!isNull (findDisplay 49)) exitwith {
				closedialog 0;
				sleep 0.25;
				closedialog 0;
			};
			if(!isNull (findDisplay 602)) exitwith {
			};
			sleep 0.05;
		};
	};
};