/*

       Author: Don Richter
       File: fn_kiesbeladen.sqf
       Description: beladen von Fahrzeugen. Much innovation, much wow!

*/
disableSerialization;
if(life_beladen) exitWith {}; //Action is in use, exit to prevent spamming.
_Truck = TypeOf life_trunk_vehicle;
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","Box_IND_Grenades_F","B_supplyCrate_F","Box_IND_AmmoVeh_F"];
_vehicle = nearestObjects[getMarkerPos "xtc_beladen",["Car","Air"],20] select 0;
if!(_Truck in _FuelTrucks) exitWith {hint "Liquid Ecstasy in einem normalen Laster... Willst du die Suppe ernsthaft auf der Straße verteilen?"};
if(isnull _vehicle OR isNil "_vehicle" OR !alive _vehicle) exitWith {hint "Es steht kein Fahrzeug zum befüllen unter der Befüllunganlage!"};
if!(_vehicle in life_vehicles) exitWith {hint "Das Fahrzeug gehört nicht dir..."};
life_beladen = true;


5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Das Fahrzeug wird befüllt... (%1%2)",round(0.01 * 100),"%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
	{
		sleep 0.25;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Das Fahrzeug wird befüllt... (%1%2)",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
	};

5 cutFadeout 1;
life_beladen = false;		
_item = "xtc"; 
_vehInv = _vehicle getVariable ["Trunk",[[],0]];   
_items = _vehInv select 0;  
_vehgroesse = _vehInv select 1;   
_itemIndex = [_item,_items] call TON_fnc_index;   
_weight = [_vehicle] call life_fnc_vehicleWeight;   
_menge = [_item,([15,25] call life_fnc_randomRound),_weight select 1,_weight select 0] call life_fnc_calWeightDiff; 
 
if(_menge < 1) exitWith {hint "Dein Fahrzeug ist voll, mehr geht nicht rein..."};  
 
_itemgewicht = ([_item] call life_fnc_itemWeight) * _menge;   
if(_itemIndex == -1) then 
	{
		_items pushBack [_item,_menge];  
	} 
	else 
		{   
			_val = _items select _itemIndex select 1;    
			_items set[_itemIndex,[_item,_val + _menge]];   
		};
		
_vehicle setVariable["Trunk",[_items,_vehgroesse + _itemgewicht],true];
if(life_erfahrung<=5525) then {life_erfahrung = life_erfahrung +2;
systemChat "+2 EXP";};


