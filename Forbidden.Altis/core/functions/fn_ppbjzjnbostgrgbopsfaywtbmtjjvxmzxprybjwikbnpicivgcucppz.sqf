private ["_tpusmlimdjzdeofscbefjqaacaywthmgszcbenlcuoiagrnqpwhdbqtsmmzzkofra","_gaaktjtguhnfngttskehpgyfsfyzbulylnwacpjugvyctvyckfciqqpmqyfflcaanzmr","_xnzvxhiqscmrzqydilznplrxbvsvjwsqgnxuczitgvstaikwcuaxyskawcnzdncbiwpzu","_zxzopsbasldlrdhvyrhkjrcazsaiwrgzkfxklojrvwpeomzhqcdcnlcvmstxqakuctybym","_blxntfllexgghqcdrhdpzrhyhhznlwimlimobwlpefakbqshnxxhurjfcewgrs"];   _tpusmlimdjzdeofscbefjqaacaywthmgszcbenlcuoiagrnqpwhdbqtsmmzzkofra = [_this,0,objNull,[objNull]] call BIS_fnc_param; _gaaktjtguhnfngttskehpgyfsfyzbulylnwacpjugvyctvyckfciqqpmqyfflcaanzmr = [_this,1,0,[0]] call BIS_fnc_param;  _xnzvxhiqscmrzqydilznplrxbvsvjwsqgnxuczitgvstaikwcuaxyskawcnzdncbiwpzu = switch (true) do { 	case (typeOf _tpusmlimdjzdeofscbefjqaacaywthmgszcbenlcuoiagrnqpwhdbqtsmmzzkofra in [ 		"B_Truck_01_mover_F","B_Truck_01_ammo_F","B_Truck_01_box_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F","B_Truck_01_transport_F","B_Truck_01_covered_F",  		"O_Truck_03_device_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F","O_Truck_03_transport_F","O_Truck_03_covered_F"  	]): {8}; 	case (typeOf _tpusmlimdjzdeofscbefjqaacaywthmgszcbenlcuoiagrnqpwhdbqtsmmzzkofra in ["O_Truck_02_Ammo_F","I_Truck_02_ammo_F","C_Truck_02_fuel_F","I_Truck_02_fuel_F","O_Truck_02_fuel_F","I_Truck_02_medical_F","O_Truck_02_medical_F","I_Truck_02_box_F","O_Truck_02_box_F","C_Truck_02_box_F","O_Truck_02_transport_F","I_Truck_02_transport_F","C_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_covered_F","C_Truck_02_covered_F"]): {6};  	default {4}; };  _zxzopsbasldlrdhvyrhkjrcazsaiwrgzkfxklojrvwpeomzhqcdcnlcvmstxqakuctybym = []; { 	if(_forEachIndex >= _xnzvxhiqscmrzqydilznplrxbvsvjwsqgnxuczitgvstaikwcuaxyskawcnzdncbiwpzu) exitWith {}; 	_zxzopsbasldlrdhvyrhkjrcazsaiwrgzkfxklojrvwpeomzhqcdcnlcvmstxqakuctybym pushBack _x; } foreach ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitRMWheel","HitLMWheel","HitRBWheel","HitLBWheel"];  _blxntfllexgghqcdrhdpzrhyhhznlwimlimobwlpefakbqshnxxhurjfcewgrs = true; { 	if((_tpusmlimdjzdeofscbefjqaacaywthmgszcbenlcuoiagrnqpwhdbqtsmmzzkofra getHitPointDamage _x) < 0.95) exitWith {_blxntfllexgghqcdrhdpzrhyhhznlwimlimobwlpefakbqshnxxhurjfcewgrs = false;}; } foreach _zxzopsbasldlrdhvyrhkjrcazsaiwrgzkfxklojrvwpeomzhqcdcnlcvmstxqakuctybym;  _blxntfllexgghqcdrhdpzrhyhhznlwimlimobwlpefakbqshnxxhurjfcewgrs; 