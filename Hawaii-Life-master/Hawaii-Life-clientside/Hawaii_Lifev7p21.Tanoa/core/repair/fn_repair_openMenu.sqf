/*
	File: fn_repair_openMenu.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private ["_vehicle","_trucks"];
_vehicle = param [0,ObjNull,[ObjNull]];

_trucks = ["B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_box_F","B_Truck_01_mover_F","I_Truck_02_covered_F","I_Truck_02_fuel_F","I_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","O_Truck_03_device_F"];

switch (true) do {
	case (_vehicle isKindOf "Car"): {
		if(typeOf (_vehicle) in _trucks) then {
			createDialog "life_repair_truck";
			disableSerialization;
			_dialog = findDisplay 3382;
			_Info = _dialog displayCtrl 3385;
			_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2<br/><t align='left' color='#FFB124'>Tank:</t> %3<br/><br/><t align='left' color='#FFB124'>Reifen L1:</t> %4<br/><t align='left' color='#FFB124'>Reifen L2:</t> %5<br/><t align='left' color='#FFB124'>Reifen L3:</t> %6<br/><t align='left' color='#FFB124'>Reifen L4:</t> %7<br/><br/><t align='left' color='#FFB124'>Reifen R1:</t> %8<br/><t align='left' color='#FFB124'>Reifen R2:</t> %9<br/><t align='left' color='#FFB124'>Reifen R3:</t> %10<br/><t align='left' color='#FFB124'>Reifen R4:</t> %11</t>",100 - ((_vehicle getHitpointDamage "HitBody")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100),100 - ((_vehicle getHitpointDamage "HitFuel")*100),100 - ((_vehicle getHitpointDamage "HitLFWheel")*100),100 - ((_vehicle getHitpointDamage "HitLF2Wheel")*100),100 - ((_vehicle getHitpointDamage "HitLMWheel")*100),100 - ((_vehicle getHitpointDamage "HitLBWheel")*100),100 - ((_vehicle getHitpointDamage "HitRFWheel")*100),100 - ((_vehicle getHitpointDamage "HitRF2Wheel")*100),100 - ((_vehicle getHitpointDamage "HitRMWheel")*100),100 - ((_vehicle getHitpointDamage "HitRBWheel")*100)];
		} else {
			createDialog "life_repair_car";
			disableSerialization;
			_dialog = findDisplay 3380;
			_Info = _dialog displayCtrl 3385;
			_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2<br/><t align='left' color='#FFB124'>Tank:</t> %3<br/><br/><t align='left' color='#FFB124'>Reifen L1:</t> %4<br/><t align='left' color='#FFB124'>Reifen L2:</t> %5<br/><br/><t align='left' color='#FFB124'>Reifen R1:</t> %6<br/><t align='left' color='#FFB124'>Reifen R2:</t> %7</t>",100 - ((_vehicle getHitpointDamage "HitBody")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100),100 - ((_vehicle getHitpointDamage "HitFuel")*100),100 - ((_vehicle getHitpointDamage "HitLFWheel")*100),100 - ((_vehicle getHitpointDamage "HitLF2Wheel")*100),100 - ((_vehicle getHitpointDamage "HitRFWheel")*100),100 - ((_vehicle getHitpointDamage "HitRF2Wheel")*100)];
		};
	};
	case (_vehicle isKindOf "Air"): {
		createDialog "life_repair_heli";
		disableSerialization;
		_dialog = findDisplay 3383;
		_Info = _dialog displayCtrl 3385;
		_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Inst:</t> %2<br/><t align='left' color='#FFB124'>Motor:</t> %3<br/><br/><t align='left' color='#FFB124'>HRotor:</t> %4<br/><t align='left' color='#FFB124'>VRotor</t> %5</t>",100 - ((_vehicle getHitpointDamage "HitHull")*100),100 - ((_vehicle getHitpointDamage "HitAvionics")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100),100 - ((_vehicle getHitpointDamage "HitHRotor")*100),100 - ((_vehicle getHitpointDamage "HitVRotor")*100)];
	};
	case (_vehicle isKindOf "Ship"): {
		if(typeOf (_vehicle) in ["O_SDV_01_F","B_SDV_01_F","C_Rubberboat","B_Boat_Transport_01_F","B_Boat_Armed_01_minigun_F"]) then {
			createDialog "life_repair_boat";
			disableSerialization;
			_dialog = findDisplay 3384;
			_Info = _dialog displayCtrl 3385;
			_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2</t>",100 - ((_vehicle getHitpointDamage "HitBody")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100)];
		} else {
			createDialog "life_repair_boat";
			disableSerialization;
			_dialog = findDisplay 3384;
			_Info = _dialog displayCtrl 3385;
			_Info ctrlSetStructuredText parseText format["<t align='left' size='1.2'>Fahrzeug Status</t><br/><br/><t align='left' color='#FFB124'>Body:</t> %1<br/><t align='left' color='#FFB124'>Motor:</t> %2</t>",100 - ((_vehicle getHitpointDamage "HitHull")*100),100 - ((_vehicle getHitpointDamage "HitEngine")*100)];
		};
	};
};