/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Functions for the vehicle compensation menu
*/

DS_cmVehicleCategories = [
    ["Civilian Cars",0],
    ["Civilian Trucks",1],
    ["Civilian Air",2],
    ["Civilian Boats",3],
    ["Pods",103],
    ["Rebel Vehicles",61],
    ["Rebel Armed Vehicles",62],
    ["Police - Land",35],
    ["Police - Air",36],
    ["Police - Sea",127],
    ["Medic",95],
    ["Mechanic",96],
    ["Whitelist Civ Boats",148],
    ["Security Vehicles",120],
    ["Security Vehicles Level 3",123],
    ["Non-Shop Vehicles",["B_Plane_CAS_01_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_F","O_Boat_Armed_01_hmg_F","O_T_LSV_02_unarmed_F","B_T_LSV_01_unarmed_F","O_Truck_03_covered_F","O_APC_Wheeled_02_rcws_F"]]
];

DS_fnc_cmGetCategoryVehicles = {
    private ["_category","_categoryInfo","_shopId","_vehicles"];

    _category = _this select 0;

    _categoryInfo = DS_cmVehicleCategories select _category;
    _shopId = _categoryInfo select 1;
    _vehicles = [];

    if((typeName _shopId) == "SCALAR")then {_vehicles = [_shopId] call DS_fnc_vehShopConfig;};
    if((typeName _shopId) == "ARRAY")then {_vehicles = _shopId;};

    _vehicles
};

DS_fnc_cmUpdateVehicleList = {
    private ["_dialog","_combo1","_list1","_className","_name","_img"];

    disableSerialization;

    _dialog = findDisplay 666644;
    if(isNull _dialog)exitWith{};

    _combo1 = _dialog displayCtrl 2101;
    _list1 = _dialog displayCtrl 1500;

    lbClear _list1;

    {
        _className = _x;
        if((typeName _x) == "ARRAY")then {_className = _x select 0;};

        _name = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
        _img = getText (configFile >> "CfgVehicles" >> _className >> "picture");

    	_list1 lbAdd format["%1",_name];
    	_list1 lbSetPicture [(lbSize _list1)-1, _img];
    	_list1 lbSetData [(lbSize _list1)-1,_className];
    }forEach ([lbCurSel _combo1] call DS_fnc_cmGetCategoryVehicles);
};

DS_fnc_cmUpgradeByCheckBox = {
    private ["_controlIdc","_upgrade"];

    _controlIdc = _this select 0;

    _upgrade = "";
    switch(_controlIdc)do
        {
        case 2800: {_upgrade = "Insurance X1 Upgrade";};
        case 2801: {_upgrade = "Insurance X2 Upgrade";};
        case 2802: {_upgrade = "Capacity Upgrade";};
        case 2803: {_upgrade = "Super Capacity Upgrade";};
        case 2804: {_upgrade = "Fuel Upgrade";};
        case 2805: {_upgrade = "Super Fuel Upgrade";};
        case 2806: {_upgrade = "Security Upgrade";};
        case 2807: {_upgrade = "Super Security Upgrade";};
        case 2808: {_upgrade = "Animal Repellent Upgrade";};
        case 2809: {_upgrade = "Airbags Upgrade";};
        case 2810: {_upgrade = "Special Upgrade";};
        case 2811: {_upgrade = "Vehicle Ammo Upgrade";};
        case 2812: {_upgrade = "Thermal Upgrade";};
        case 2813: {_upgrade = "Bulletproof Upgrade";};
        case 2814: {_upgrade = "CCU Upgrade";};
        case 2815: {_upgrade = "GCU Upgrade";};
        };
    if(_upgrade == "")exitWith{hint "Error 564: Report to Luke if you see this error";};

    _upgrade
};

DS_fnc_cmGetSelectedUpgrades = {
    private ["_controlIdc","_upgrade"];

    disableSerialization;

    _checkBoxes = [2800,2801,2802,2803,2804,2805,2806,2807,2808,2809,2810,2811,2812,2813,2814,2815];
    _upgrades = [];

    {
        _control = _dialog displayCtrl _x;
        if(cbChecked _control)then {
            _upgrades pushBack ([_x] call DS_fnc_cmUpgradeByCheckBox);
        };
    }foreach _checkBoxes;

    _upgrades
};

DS_fnc_cmIsUpgradeSelected = {
    private ["_upgrade","_selected","_dialog"];

    disableSerialization;

    _upgrade = _this select 0;
    _selected = false;

    _dialog = findDisplay 666644;
    if(isNull _dialog)exitWith{_selected};

    switch(_upgrade)do
        {
        case "Insurance X1 Upgrade": {_selected = cbChecked (_dialog displayCtrl 2800);};
        case "Insurance X2 Upgrade": {_selected = cbChecked (_dialog displayCtrl 2801);};
        case "Capacity Upgrade": {_selected = cbChecked (_dialog displayCtrl 2802);};
        case "Super Capacity Upgrade": {_selected = cbChecked (_dialog displayCtrl 2803);};
        case "Fuel Upgrade": {_selected = cbChecked (_dialog displayCtrl 2804);};
        case "Super Fuel Upgrade": {_selected = cbChecked (_dialog displayCtrl 2805);};
        case "Security Upgrade": {_selected = cbChecked (_dialog displayCtrl 2806);};
        case "Super Security Upgrade": {_selected = cbChecked (_dialog displayCtrl 2807);};
        case "Animal Repellent Upgrade": {_selected = cbChecked (_dialog displayCtrl 2808);};
        case "Airbags Upgrade": {_selected = cbChecked (_dialog displayCtrl 2809);};
        case "Special Upgrade": {_selected = cbChecked (_dialog displayCtrl 2810);};
        case "Vehicle Ammo Upgrade": {_selected = cbChecked (_dialog displayCtrl 2811);};
        case "Thermal Upgrade": {_selected = cbChecked (_dialog displayCtrl 2812);};
        case "Bulletproof Upgrade": {_selected = cbChecked (_dialog displayCtrl 2813);};
        case "CCU Upgrade": {_selected = cbChecked (_dialog displayCtrl 2814);};
        case "GCU Upgrade": {_selected = cbChecked (_dialog displayCtrl 2815);};
        };

    _selected
};

DS_fnc_cmCheckBoxChanged = {
    private ["_dialog","_control","_state","_list1","_className","_upgrade"];

    disableSerialization;

    _dialog = findDisplay 666644;
    if(isNull _dialog)exitWith{};

    _control = _this select 0;
    _state = _this select 1;
    _list1 = _dialog displayCtrl 1500;

    if((lbCurSel _list1) isEqualTo 1)exitWith {
        _control cbSetChecked false;
        hint "You must select a vehicle before selecting upgrades";
    };

    if(_state == 0)exitWith{};

    _className = _list1 lbData (lbCurSel _list1);
    _upgrade = [ctrlIDC _control] call DS_fnc_cmUpgradeByCheckBox;

    switch(_upgrade)do {
        case "Insurance X1 Upgrade": {
            if(["Insurance X2 Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Insurance X2 Upgrade'";
            };
        };
        case "Insurance X2 Upgrade": {
            if(["Insurance X1 Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Insurance X1 Upgrade'";
            };
        };
        case "Capacity Upgrade": {
            if(["Super Capacity Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Super Capacity Upgrade'";
            };
        };
        case "Super Capacity Upgrade": {
            if(["Capacity Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Capacity Upgrade'";
            };
        };
        case "Fuel Upgrade": {
            if(["Super Fuel Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Super Fuel Upgrade'";
            };
        };
        case "Super Fuel Upgrade": {
            if(["Fuel Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Fuel Upgrade'";
            };
        };
        case "Security Upgrade": {
            if(["Super Security Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Super Security Upgrade'";
            };
        };
        case "Super Security Upgrade": {
            if(["Security Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {
                _control cbSetChecked false;
                hint "You can't have this upgrade in addition to 'Security Upgrade'";
            };
        };
        case "Animal Repellent Upgrade": {
            if(!(_className isKindOf "LandVehicle"))then {
                _control cbSetChecked false;
                hint "This upgrade can only be applied to land vehicles";
            };
        };
        case "Airbags Upgrade": {
            if(!(_className isKindOf "LandVehicle"))then {
                _control cbSetChecked false;
                hint "This upgrade can only be applied to land vehicles";
            };
        };
        case "Special Upgrade": {
            if(!(_className in ["C_Offroad_02_unarmed_F","B_Heli_Light_01_F","C_Heli_Light_01_civil_F","C_Offroad_01_F"]))then {
                _control cbSetChecked false;
                hint "This upgrade is not compatible with the selected vehicle";
            };
        };
        case "Vehicle Ammo": {
            if(!(_className in ["O_APC_Wheeled_02_rcws_F","O_T_LSV_02_armed_F","B_T_LSV_01_armed_F","I_APC_Wheeled_03_cannon_F","B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F","O_G_Offroad_01_armed_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","O_Heli_Attack_02_black_F"]))then {
                _control cbSetChecked false;
                hint "This upgrade is not compatible with the selected vehicle";
            };
        };
        case "Thermal Upgrade": {
            if(!(_className in ["I_MRAP_03_F","O_MRAP_02_hmg_F","I_Heli_light_03_unarmed_F"]))then {
                _control cbSetChecked false;
                hint "This upgrade is not compatible with the selected vehicle";
            };
        };
        case "Bulletproof Upgrade": {
            if(!(_className in ["C_SUV_01_F"]))then {
                _control cbSetChecked false;
                hint "This upgrade is not compatible with the selected vehicle";
            };
        };
        case "CCU Upgrade": {
            if(!(_className in ["O_Truck_03_covered_F"]))then {
                _control cbSetChecked false;
                hint "This upgrade is not compatible with the selected vehicle";
            };
        };
        case "GCU Upgrade": {
            if(!(_className in ["O_APC_Wheeled_02_rcws_F"]))then {
                _control cbSetChecked false;
                hint "This upgrade is not compatible with the selected vehicle";
            };
        };
    };
};

DS_fnc_cmVehiclesCompPlayer = {
    private ["_dialog","_list1","_selection","_action","_className","_vehName","_uid","_side","_type","_insurance","_capacity","_fuel","_security","_animalRepellent","_airbags","_special","_vehAmmo","_thermalBp","_ccuGcu"];

    if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};
    if((isNil "DS_cmUnit")||(isNull DS_cmUnit))exitWith{hint "The compensation target is no longer valid. Did they logout?";};

    disableSerialization;

    _dialog = findDisplay 666644;
    if(isNull _dialog)exitWith{};

    _list1 = _dialog displayCtrl 1500;

    _selection = lbCurSel _list1;
    if(_selection isEqualTo -1)exitWith{hint "You have not selected a vehicle to compensate";};

    _action = [
    		format ["Are you sure you want to compensate %1 with the selected vehicle?",(name DS_cmUnit)],
    		"Confirm Compensation",
    		"Yes",
    		"No"
    	] call BIS_fnc_guiMessage;
    if(!_action)exitWith{};

    _className = _list1 lbData _selection;
    _vehName = _list1 lbText _selection;
    _uid = getPlayerUID DS_cmUnit;

    _side = switch(ctrlText 2102)do {
        case "Cop": {"cop"};
        case "Civilian": {"civ"};
        case "WL Civilian": {"med"};
        default {"civ"};
    };

    _type = switch(true)do {
        case (_className isKindOf "Car"): {"Car"};
        case (_className isKindOf "Air"): {"Air"};
        case (_className isKindOf "Ship"): {"Ship"};
        default {"Car"};
    };

    _insurance = 0;
    _capacity = 0;
    _fuel = 0;
    _security = 0;
    _animalRepellent = 0;
    _airbags = 0;
    _special = 0;
    _vehAmmo = 0;
    _thermalBp = 0;
    _ccuGcu = 0;

    if(["Insurance X1 Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_insurance = 1;};
    if(["Insurance X2 Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_insurance = 2;};
    if(["Capacity Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_capacity = 1;};
    if(["Super Capacity Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_capacity = 2;};
    if(["Fuel Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_fuel = 1;};
    if(["Super Fuel Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_fuel = 2;};
    if(["Security Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_security = 1;};
    if(["Super Security Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_security = 2;};
    if(["Animal Repellent Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_animalRepellent = 1;};
    if(["Airbags Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_airbags = 1;};
    if(["Special Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_special = 1;};
    if(["Vehicle Ammo Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_vehAmmo = 1;};
    if(["Thermal Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_thermalBp = 1;};
    if(["Bulletproof Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_thermalBp = 2;};
    if(["CCU Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_ccuGcu = 1;};
    if(["GCU Upgrade"] call DS_fnc_cmIsUpgradeSelected)then {_ccuGcu = 2;};

    _upgrades = [_insurance,_capacity,_fuel,_security,_animalRepellent,_airbags,_special,_vehAmmo,_thermalBp,_ccuGcu];

    [_uid,_side,_type,_className,_upgrades] remoteExec ["HUNT_fnc_compVehicle",2];

    [[_vehName],{
        hint format ["An admin has compensated you a %1 into your garage",(_this select 0)];
        systemChat format ["An admin has compensated you a %1 into your garage.",(_this select 0)];
    }] remoteExec ["BIS_fnc_spawn",DS_cmUnit];

    hint format ["You have compensated %1 a %2 into their garage",name DS_cmUnit,_vehName];
    systemChat format ["You have compensated %1 a %2 into their garage.",name DS_cmUnit,_vehName];

    _note = format ["Compensated vehicle (%1)",_className];
    [(getPlayerUID DS_cmUnit),"4",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];

    closeDialog 0;
    DS_cmUnit = nil;
};

DS_cmVehiclesFncsLoaded = true;