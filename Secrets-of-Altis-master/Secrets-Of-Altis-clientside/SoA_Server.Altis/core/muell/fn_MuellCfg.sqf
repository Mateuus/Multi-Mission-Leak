/*#######################################
#	Muellcontainer Cfg					#
#	Author: [MdF] Feindflug				#
#######################################*/

private["_wahl","_uid","_carsNear","_objectNear","_deponie"];
_wahl = (_this select 0);
_unit = player;
_unitSide = side _unit;
_uid = getplayerUID _unit;
_dist = 100;
_marker = "";
_setM = _unit getVariable "MuellMarkSet";
_carsNear = nearestObjects [_unit, ["C_Offroad_01_F","I_Truck_02_covered_F"], 7];
_objectNear = nearestObjects [_unit, ["Land_GarbageContainer_closed_F"], 5];
_deponie = nearestObjects [_unit, ["Land_cargo_house_slum_F"], 7];

if(_unitSide != civilian) exitWith {hint "Du kannst nur als Zivilist Mülltonnen mitnehmen!";};
if(vehicle _unit != _unit) exitWith {hint "In einem Fahrzeug kannst du diese Funktion nicht nutzen!";};

switch (_wahl) do
{
	case 0:
	{
		if(dialog) exitWith {};
		disableSerialization;

		if(!createDialog "Muell_Menue") exitWith {"Kann denn Dialog nicht Erstellen"};
		
		waitUntil {!isNull (findDisplay 99991)};
		_display = findDisplay 99991;
		_btn1 = _display displayCtrl 99982;
		_btn2 = _display displayCtrl 99983;
		_btn1 ctrlEnable false;
		_btn2 ctrlEnable false;
		_btn1 ctrlSetText "Nicht verfügbar.";
		
		if((count _objectNear) > 0 && (_unit distance (_objectNear select 0)) < 2) then
		{
			if((count attachedObjects _unit) > 0) then 
			{
				_btn1 ctrlEnable true;
				_btn1 ctrlSetText "Tonne Absetzen";
				_btn1 buttonSetAction "[2] spawn life_fnc_MuellCfg; closedialog 0;"
			} else {
				_btn1 ctrlEnable true;
				_btn1 ctrlSetText "Tonne Mitnehmen";
				_btn1 buttonSetAction "[1] spawn life_fnc_MuellCfg; closedialog 0;"
			};
		};
		
		if((count _carsNear) > 0 && (_unit distance (_carsNear select 0)) < 4) then
		{
			if(count (attachedObjects (_carsNear select 0)) > 16) then
			{
				_btn2 ctrlEnable true;
				_btn2 ctrlSetText "Auto abladen";
				_btn2 buttonSetAction "[4] spawn life_fnc_MuellCfg; closedialog 0;"
			} else {
				_btn2 ctrlEnable true;
				_btn2 ctrlSetText "Auto beladen";
				_btn2 buttonSetAction "[3] spawn life_fnc_MuellCfg; closedialog 0;"
			};
		};
	};
		
	// Tonne mitnehmen
	case 1:
	{
		if((_unit distance (_objectNear select 0)) < 2.1) then
		{
			if(((_objectNear select 0) getVariable "muellUID") == _uid) exitWith {(_objectNear select 0) attachTo [_unit,[0.1,1.2,0.65]]};
			
			if((_objectNear select 0) getVariable "NewSpawn") then 
			{
				if((_unit getVariable "muellCMAX") == muellCMAX) exitWith {hint format["Du kannst nur %1 Mülltonne mitnehmen!",muellCMAX];};
				
				(_objectNear select 0) attachTo [_unit,[0.1,1.2,0.65]];
				(_objectNear select 0) setVariable["muellUID",_uid,true];
				(_objectNear select 0) setVariable["NewSpawn",false,true];
			
				_unit setVariable["muellCMAX",muellCMAX,false];
				
				if((count muellMarkSet) > 0) then 
				{
					{
						_range = ((getMarkerPos (_x select 0)) distance (vehicle _unit));
						if (_range < _dist) then {_dist = _range; _marker = (_x select 0)};
					} foreach muellMarkSet;
					
					if(_marker != "") then 
					{
						if(count (_unit getVariable "MuellMarkSet") > 0) then
						{
							_unit setVariable["MuellMarkSet",[_setM,[_marker]],false];
						} else {
							_unit setVariable["MuellMarkSet",[[_marker]],false];
						};
					};
				};
			} else {
				hint "Das ist nicht deine Mülltonne also Finger weg!";
			};
		};
	};
	
	// Tonne absetzen
	case 2:
	{
		if((count _deponie) > 0 && _unit distance (getMarkerPos "muell_1") < 2) exitWith {detach (_objectNear select 0); hint "Du hast die Mülltonne auf denn markierten Bereich gestellt. Nun verkaufe sie!";};
		if((count _deponie) > 0 && _unit distance (getMarkerPos "muell_2") < 2) exitWith {detach (_objectNear select 0); hint "Du hast die Mülltonne auf denn markierten Bereich gestellt. Nun verkaufe sie!";};
	
		if((count (nearestObjects [_unit, ["Car","Air","Ship","House"], 5])) == 0 && !isOnRoad player) then
		{
			detach (_objectNear select 0);
			detach (_objectNear select 0);
		} else {
			hint "Du kannst in der Nähe eines Fahrzeuges, Hauses oder auf einer Straße keine Mülltonne abstellen!";
		};
	};
	
	// Tonne auf das Auto beladen
	case 3:
	{	
		if((count _carsNear) > 0) then
		{
			if((_unit distance (_carsNear select 0)) < 4 && ((_objectNear select 0) getVariable "muellUID") == _uid) then
			{
				switch (typeOf cursortarget) do
				{
					case "C_Offroad_01_F":
					{
						(_objectNear select 0) attachTo [(_carsNear select 0),[0,-2,0]];
						(_carsNear select 0) setVariable["muellCarUID",_uid,true];
					};

					case "I_Truck_02_covered_F": 
					{
						(_objectNear select 0) attachTo [(_carsNear select 0),[0,-3,0]];
						(_carsNear select 0) setVariable["muellCarUID",_uid,true];
					};
				};
			} else {
				hint "Du hast keine Mülltonne!";
			};
		};
	};
	
	// Tonne vom Auto runternehmen
	case 4:
	{
		if((_carsNear select 0) getVariable "muellCarUID" == _uid) then
		{
			(_objectNear select 0) attachTo [_unit,[0.1,1.2,0.65]];
		} else {
			hint "Finger weg! Dies ist nicht deine Mülltonne!";
		};
	};
};