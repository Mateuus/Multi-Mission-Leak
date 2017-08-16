/*
	File: fn_GEMenu
	Author: Kevin Webb
	
	Description:
	Sets up our Grand Exchange UI
	Copyright © 2015 Kevin Webb, All rights reserved
	Written for Asylum Entertainment ™
*/
private["_offers","_control"];
disableSerialization;
_offers = param [0,[],[[]]];
ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

_control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;
if(count _offers == 0) then {_control lbAdd "No Offers Found!"};
{
	_className = _x select 1;
	_price = _x select 2;
	_isVirtual = _x select 3;
	_isWeapon = _x select 4;
	_isVehicle = _x select 5;
	_amount = _x select 6;
	_buySell = _x select 7;
	_vehicleID = _x select 8;
	_offeror = _x select 9;
	_displayName = "";
	_details = [];
	_nonVirt = false;
	_type = "";
	switch(true) do {
		case (_isVirtual == 1): {_displayName = [_className] call life_fnc_varToStr; _type = "Virtual"};
		case (_isWeapon == 1): {
			_toCheck = if(typeName _className == "ARRAY") then {_className select 0} else {_className};
			_details = [_toCheck] call life_fnc_fetchCfgDetails; _nonVirt = true; _type = "Weapon";
		};
		case (_isVehicle == 1): {_details = [_className] call life_fnc_fetchCfgDetails; _nonVirt = true; _type = "Vehicle"};
	};
	if(_isVehicle == 1) then {
		_displayName = _details select 1;
	} else {
		if(_isWeapon == 1) then {_displayName = _details select 1};
		_displayName = _displayName + format[" x %1",_amount];
	};
	_control lbAdd _displayName;
	_control lbSetData [(lbSize _control)-1,str([_displayName,_price,_buySell,_className,_type,_amount,_vehicleID,_offeror])];
	if(_nonVirt) then {
		_control lbSetPicture [(lbSize _control)-1,_details select 2];
	} else {
		_control lbSetPicture [(lbSize _control)-1,format["icons\%1.paa",[_className,1] call life_fnc_varHandle]];
	};
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _offers;
_ctrl = (findDisplay 2800) displayCtrl 39403;
lbClear _ctrl;
_index = _ctrl lbAdd "Weapons";
_ctrl lbSetValue [_index, 0];
_index = _ctrl lbAdd "Vehicles";
_ctrl lbSetValue [_index,1];
_index = _ctrl lbAdd "Resources";
_ctrl lbSetValue [_index, 2];

fnc_addWeapons = {
	_ctrl = (findDisplay 2800) displayCtrl 44004;
	lbClear _ctrl;
	_index = _ctrl lbAdd "P07 9mm Handgun";
	_ctrl lbSetData [_index, str(["hgun_P07_F","Weapon"])];
	_index = _ctrl lbAdd "Rook-40 9mm Handgun";
	_ctrl lbSetData [_index, str(["hgun_Rook40_F","Weapon"])];
	_index = _ctrl lbAdd "Zubr .45ACP Revolver";
	_ctrl lbSetData [_index, str(["hgun_Pistol_heavy_02_F","Weapon"])];
	_index = _ctrl lbAdd "M1911 .45ACP Handgun";
	_ctrl lbSetData [_index, str(["hgun_ACPC2_F","Weapon"])];
	_index = _ctrl lbAdd "Four-Five .45ACP Handgun";
	_ctrl lbSetData [_index, str(["hgun_Pistol_heavy_01_F","Weapon"])];
	_index = _ctrl lbAdd "PDW2000 9mm SMG";
	_ctrl lbSetData [_index, str(["hgun_PDW2000_F","Weapon"])];
	_index = _ctrl lbAdd "Sting 9mm SMG";
	_ctrl lbSetData [_index, str(["SMG_02_F","Weapon"])];
	_index = _ctrl lbAdd "Vermin .45ACP SMG";
	_ctrl lbSetData [_index, str(["SMG_01_F","Weapon"])];
	_index = _ctrl lbAdd "SDAR 5.56mm";
	_ctrl lbSetData [_index, str(["arifle_SDAR_F","Weapon"])];
	_index = _ctrl lbAdd "TRG-20 5.56mm Carbine";
	_ctrl lbSetData [_index, str(["arifle_TRG20_F","Weapon"])];
	_index = _ctrl lbAdd "TRG-21 5.56mm Rifle";
	_ctrl lbSetData [_index, str(["arifle_TRG21_F","Weapon"])];
	_index = _ctrl lbAdd "MK20 5.56mm Carbine";
	_ctrl lbSetData [_index, str(["arifle_Mk20C_F","Weapon"])];
	_index = _ctrl lbAdd "MK20 5.56mm Rifle";	
	_ctrl lbSetData [_index, str(["arifle_Mk20_F","Weapon"])];
	_index = _ctrl lbAdd "Katiba 6.5mm Carbine";
	_ctrl lbSetData [_index, str(["arifle_Katiba_C_F","Weapon"])];
	_index = _ctrl lbAdd "Katiba 6.5mm Rifle";
	_ctrl lbSetData [_index, str(["arifle_Katiba_F","Weapon"])];
	/*_index = _ctrl lbAdd "MX 6.5mm Carbine";
	_ctrl lbSetData [_index, str(["arifle_MXC_F","Weapon"])];
	_index = _ctrl lbAdd "MX 6.5mm Rifle";
	_ctrl lbSetData [_index, str(["arifle_MX_F","Weapon"])];*/
	_index = _ctrl lbAdd "Rahim 7.62mm";
	_ctrl lbSetData [_index, str(["srifle_DMR_01_F","Weapon"])];
	_index = _ctrl lbAdd "MK 18 ABR 7.62mm";
	_ctrl lbSetData [_index, str(["srifle_EBR_F","Weapon"])];
	_index = _ctrl lbAdd "Mk-I EMR 7.62mm khaki";
	_ctrl lbSetData [_index, str(["srifle_DMR_03_khaki_F","Weapon"])];
	_index = _ctrl lbAdd "Mk-I EMR 7.62mm multicam";
	_ctrl lbSetData [_index, str(["srifle_DMR_03_multicam_F","Weapon"])];
	_index = _ctrl lbAdd "Mk-I EMR 7.62mm tan";
	_ctrl lbSetData [_index, str(["srifle_DMR_03_tan_F","Weapon"])];
	_index = _ctrl lbAdd "Mk-I EMR 7.62mm woodland";
	_ctrl lbSetData [_index, str(["srifle_DMR_03_woodland_F","Weapon"])];
	_index = _ctrl lbAdd "Mk14 7.62mm";
	_ctrl lbSetData [_index, str(["srifle_DMR_06_olive_F","Weapon"])];
	_index = _ctrl lbAdd "Mk14 7.62mm camo";
	_ctrl lbSetData [_index, str(["srifle_DMR_06_camo_F","Weapon"])];
	_index = _ctrl lbAdd "Mk200 6.5mm LMG";
	_ctrl lbSetData [_index, str (["LMG_Mk200_F","Weapon"])];
	for "_i" from 0 to ((lbSize _ctrl) - 1) do {
		_ctrl lbSetPicture[_i,([(call compile (_ctrl lbData _i)) select 0] call life_fnc_fetchCfgDetails) select 2];
	};
};
fnc_addVehicles = {
	_ctrl = (findDisplay 2800) displayCtrl 44004;
	lbClear _ctrl;
	_index = _ctrl lbAdd "Sports Hatchback";
	_ctrl lbSetData [_index, str(["C_Hatchback_01_sport_F","Vehicle"])];
	_index = _ctrl lbAdd "Box Van";
	_ctrl lbSetData [_index, str(["C_Van_01_box_F","Vehicle"])];
	_index = _ctrl lbAdd "Zamak Transport";
	_ctrl lbSetData [_index, str(["I_Truck_02_transport_F","Vehicle"])];
	_index = _ctrl lbAdd "Zamak Covered";
	_ctrl lbSetData [_index, str(["I_Truck_02_covered_F","Vehicle"])];
	_index = _ctrl lbAdd "Transport HEMTT";
	_ctrl lbSetData [_index, str(["B_Truck_01_transport_F","Vehicle"])];
	_index = _ctrl lbAdd "Box HEMTT";
	_ctrl lbSetData [_index, str(["B_Truck_01_box_F","Vehicle"])];
	_index = _ctrl lbAdd "M2 .50Cal Offroad";
	_ctrl lbSetData [_index, str(["B_G_Offroad_01_armed_F","Vehicle"])];
	_index = _ctrl lbAdd "MH9 Hummingbird";
	_ctrl lbSetData [_index, str(["B_Heli_Light_01_F","Vehicle"])];
	_index = _ctrl lbAdd "M-900";
	_ctrl lbSetData [_index, str(["C_Heli_Light_01_civil_F","Vehicle"])];
	_index = _ctrl lbAdd "PO-30 Orca";
	_ctrl lbSetData [_index, str(["O_Heli_Light_02_unarmed_F","Vehicle"])];
	_index = _ctrl lbAdd "SUV";
	_ctrl lbSetData [_index, str(["C_SUV_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Offroad";
	_ctrl lbSetData [_index, str(["C_Offroad_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Hatchback";
	_ctrl lbSetData [_index, str(["C_Hatchback_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Quad Bike";
	_ctrl lbSetData [_index, str(["B_Quadbike_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Transport Van";
	_ctrl lbSetData [_index, str(["C_Van_01_transport_F","Vehicle"])];
	_index = _ctrl lbAdd "Rebel Offroad";
	_ctrl lbSetData [_index, str(["I_G_Offroad_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Ifrit";
	_ctrl lbSetData [_index, str(["O_MRAP_02_F","Vehicle"])];
	_index = _ctrl lbAdd "Mohawk";
	_ctrl lbSetData [_index, str(["I_Heli_Transport_02_F","Vehicle"])];
	_index = _ctrl lbAdd "SDV";
	_ctrl lbSetData [_index, str(["O_SDV_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Dinghy";
	_ctrl lbSetData [_index, str(["C_Rubberboat","Vehicle"])];
	_index = _ctrl lbAdd "Motorboat";
	_ctrl lbSetData [_index, str(["C_Boat_Civil_01_F","Vehicle"])];
	_index = _ctrl lbAdd "Rescue Motorboat";
	_ctrl lbSetData [_index, str(["C_Boat_Civil_01_rescue_F","Vehicle"])];
	for "_i" from 0 to ((lbSize _ctrl) - 1) do {
		_ctrl lbSetPicture[_i,([(call compile (_ctrl lbData _i)) select 0] call life_fnc_fetchCfgDetails) select 2];
	};
	[[801, player, format["Listed a %1 on the Exchange", _index]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
};
fnc_addResources = {
	_ctrl = (findDisplay 2800) displayCtrl 44004;
	lbClear _ctrl;
	_accepted =
	[
		"life_inv_barley",
		"life_inv_blindfold",
		"life_inv_boltCutter",
		"life_inv_copperr",
		"life_inv_copperore",
		"life_inv_corn",
		"life_inv_meth",
		"life_inv_demoCharge",
		"life_inv_diamond",
		"life_inv_diamondr",
		"life_inv_diamondf",
		"life_inv_drill",
		"life_inv_ephedrau",
		"life_inv_airalarm",
		"life_inv_hydro",
		"life_inv_ironr",
		"life_inv_ironore",
		"life_inv_lockpick",
		"life_inv_nitro",
		"life_inv_oilp",
		"life_inv_heroinu",
		"life_inv_phos",
		"life_inv_rubber",
		"life_inv_rye",
		"life_inv_salt",
		"life_inv_speedbomb",
		"life_inv_tracker",
		"life_inv_turtle",
		"life_inv_coke",
		"life_inv_vammo",
		"life_inv_caralarm",
		"life_inv_ziptie"
	];
	{
		_index = _ctrl lbAdd format["%1",[_x] call life_fnc_varToStr];
		_ctrl lbSetData[_index,str([_x,"Virtual"])];
		_ctrl lbSetPicture[_index,format["icons\%1.paa",[_x,1] call life_fnc_varHandle]];
	} forEach _accepted;
};
ctrlShow[2810,false];
ctrlShow[2811,false];