/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Functions for the gear compensation menu
*/

DS_cmWeaponCategories = [
    ["Civilian Guns",6],
    ["Civilian Guns Advanced",7],
    ["Hi Tech",5],
    ["Gang Weapons",64],
    ["Rebel Small Arms",57],
    ["Rebel Large Arms",59],
    ["KOS Rebel Weapons",60],
    ["Rebel Attachments",63],
    ["Special Attachments Shop",156],
    ["Security Weapons Level 2",121],
    ["Security Weapons Level 3",122],
    ["Token Weapons",158],
    ["Non-Shop Weapons",["arifle_MX_GL_F","optic_Nightstalker"]]
];

DS_cmClothingCategories = [
    ["Civilian Clothing",9],
    ["Civilian Hats",10],
    ["Civilian Glasses",11],
    ["Civilian Backpacks",12],
    ["Civilian Diving",13],
    ["Rebel Clothing",73],
    ["Rebel Hats",74],
    ["Rebel Glasses",75],
    ["Rebel Vests",76],
    ["Rebel Backpacks",77],
    ["Special Facegear",157],
    ["Mechanic & Medic Clothing",147],
    ["Security Clothing",124],
    ["Non-Shop Clothing",["H_CrewHelmetHeli_B","H_CrewHelmetHeli_I"]]
];

DS_fnc_cmGetCategoryGear = {
    private ["_category","_dialog","_combo1","_gear","_categoryInfo","_shopId"];

    _category = _this select 0;

    disableSerialization;

    _dialog = findDisplay 666643;
    if(isNull _dialog)exitWith{[]};

    _combo1 = _dialog displayCtrl 2101;
    _gear = [];

    switch(lbCurSel _combo1)do {
        case 0: {
            _categoryInfo = DS_cmWeaponCategories select _category;
            _shopId = _categoryInfo select 1;

            if(_shopId isEqualType 0)then{_gear = [_shopId] call DS_fnc_weaponShopConfig;};
            if(_shopId isEqualType [])then{_gear = _shopId;};
        };
        case 1: {
            _categoryInfo = DS_cmClothingCategories select _category;
            _shopId = _categoryInfo select 1;

            if(_shopId isEqualType 0)then{_gear = [_shopId] call DS_fnc_clothingShopConfig;};
            if(_shopId isEqualType [])then{_gear = _shopId;};
        };
    };

    _gear
};

DS_fnc_cmUpdateGearList = {
    private ["_dialog","_combo2","_list1","_categoryInfo","_className","_type","_name","_img"];

    disableSerialization;

    _dialog = findDisplay 666643;
    if(isNull _dialog)exitWith{};

    _combo2 = _dialog displayCtrl 2102;
    _list1 = _dialog displayCtrl 1500;

    lbClear _list1;

    _categoryGear = [lbCurSel _combo2] call DS_fnc_cmGetCategoryGear;
    if(_categoryGear isEqualTo [])exitWith{};

    {
        _className = _x;
        if(_x isEqualType [])then {_className = _x select 0;};

        switch(true)do {
            case (isClass (configFile >> "CfgMagazines" >> _className)): {_type = "CfgMagazines";};
            case (isClass (configFile >> "CfgWeapons" >> _className)): {_type = "CfgWeapons";};
            case (isClass (configFile >> "CfgGlasses" >> _className)): {_type = "CfgGlasses";};
            case (isClass (configFile >> "CfgVehicles" >> _className)): {_type = "CfgVehicles";};
        };

        if(isNil "_type")then {
            hint format ["Error with %1: Report to Luke if you see this error",_className];
        } else {
            _name = getText (configFile >> _type >> _className >> "displayName");
            _img = getText (configFile >> _type >> _className >> "picture");

        	_index = _list1 lbAdd format ["%1",_name];
        	_list1 lbSetPicture [_index,_img];
        	_list1 lbSetData [_index,_className];
        };
    }forEach _categoryGear;
};

DS_fnc_cmUpdateGearCompType = {
    private ["_dialog","_combo1","_combo2"];

    disableSerialization;

    _dialog = findDisplay 666643;
    if(isNull _dialog)exitWith{};

    _combo1 = _dialog displayCtrl 2101;
    _combo2 = _dialog displayCtrl 2102;
    lbClear _combo2;

    switch(lbCurSel _combo1)do {
        case 0: { //Weapons
            {
                _index = _combo2 lbAdd (_x select 0);
                _combo2 lbSetData [_index,str (_forEachIndex)];
            } forEach DS_cmWeaponCategories;
        };
        case 1: { //Clothing
            {
                _index = _combo2 lbAdd (_x select 0);
                _combo2 lbSetData [_index,str (_forEachIndex)];
            } forEach DS_cmClothingCategories;
        };
    };

    _combo2 lbSetCurSel 0;

    [] call DS_fnc_cmUpdateGearList;
};

DS_fnc_cmUpdateGearAmount = {
    private ["_dialog","_list2","_selection","_className","_amount","_type","_name","_img"];

    disableSerialization;

    _dialog = findDisplay 666643;
    if(isNull _dialog)exitWith{};

    _list2 = _dialog displayCtrl 1501;

    _selection = lbCurSel _list2;
    if(_selection isEqualTo -1)exitWith{};

    _className = _list2 lbData (lbCurSel _list2);
    _amount = parseNumber (ctrlText 1400);
    if(!([str(_amount)] call DS_fnc_isNumber))exitWith{hint "Invalid amount";};

    switch (true) do {
        case (isClass (configFile >> "CfgMagazines" >> _className)): {_type = "CfgMagazines";};
        case (isClass (configFile >> "CfgWeapons" >> _className)): {_type = "CfgWeapons";};
        case (isClass (configFile >> "CfgGlasses" >> _className)): {_type = "CfgGlasses";};
        case (isClass (configFile >> "CfgVehicles" >> _className)): {_type = "CfgVehicles";};
    };

    if(isNil "_type")then {
        hint format ["Error with %1: Report to Luke if you see this error",_className];
    } else {
        _name = getText (configFile >> _type >> _className >> "displayName");
        _img = getText (configFile >> _type >> _className >> "picture");

        [] call DS_fnc_cmRemoveGear;

        _index = _list2 lbAdd format ["%1x - %2",_amount,_name];
        _list2 lbSetPicture [_index,_img];
        _list2 lbSetData [_index,_className];

        [_className,_amount] call DS_fnc_cmUpdateGearCompList;
    };
};

DS_fnc_cmAddGear = {
    private ["_dialog","_list1","_list2","_className","_amount","_type","_name","_img"];

    disableSerialization;

    _dialog = findDisplay 666643;
    if(isNull _dialog)exitWith{};

    _list1 = _dialog displayCtrl 1500;
    _list2 = _dialog displayCtrl 1501;

    _className = _list1 lbData (lbCurSel _list1);
    _amount = parseNumber (ctrlText 1401);
    if(!([str(_amount)] call DS_fnc_isNumber))exitWith{hint "Invalid amount";};

    switch(true)do {
        case (isClass (configFile >> "CfgMagazines" >> _className)): {_type = "CfgMagazines";};
        case (isClass (configFile >> "CfgWeapons" >> _className)): {_type = "CfgWeapons";};
        case (isClass (configFile >> "CfgGlasses" >> _className)): {_type = "CfgGlasses";};
        case (isClass (configFile >> "CfgVehicles" >> _className)): {_type = "CfgVehicles";};
    };

    if(isNil "_type")then {
        hint format ["Error with %1: Report to Luke if you see this error",_className];
    } else {
        _name = getText (configFile >> _type >> _className >> "displayName");
        _img = getText (configFile >> _type >> _className >> "picture");

        [] call DS_fnc_cmRemoveGear;

        _index = _list2 lbAdd format ["%1x - %2",_amount,_name];
        _list2 lbSetPicture [_index,_img];
        _list2 lbSetData [_index,_className];

        ctrlSetText [1401,"1"];

        [_className,_amount] call DS_fnc_cmUpdateGearCompList;
    };
};

DS_fnc_cmNumberFromString = {
    private ["_string","_charArray","_numbersArray","_number"];

    _string = _this select 0;
    _charArray = [_string] call DS_fnc_strToArray;
    _numbersArray = [0,1,2,3,4,5,6,7,8,9];
    _number = "";

    {
        if(!((parseNumber(_x)) in _numbersArray))exitWith{};
        _number = _number + _x;
    }foreach _charArray;

    _number = parseNumber _number;
    _number
};

DS_fnc_cmRemoveGear = {
    private ["_dialog","_list2","_selection","_item","_oldArray","_itemName","_newAmount","_index"];

    disableSerialization;

    _dialog = findDisplay 666643;
    if(isNull _dialog)exitWith{};

    _list2 = _dialog displayCtrl 1501;

    _selection = lbCurSel _list2;
    if(_selection isEqualTo -1)exitWith{};

    _item = _list2 lbData _selection;
    _oldArray = DS_cmGearToComp select {(_x select 0) isEqualTo _item} select 0;
    if(isNil "_oldArray")exitWith{_list2 lbDelete _selection;};

    _itemName = _list2 lbText _selection;
    _newAmount = (_oldArray select 1) - ([_itemName] call DS_fnc_cmNumberFromString);

    _index = DS_cmGearToComp find _oldArray;
    if(!(_index isEqualTo -1))then{DS_cmGearToComp deleteAt _index;};

    DS_cmGearToComp pushBack [_item,_newAmount];

    _list2 lbDelete _selection;
};

DS_fnc_cmUpdateGearCompList = {
    private ["_item","_amount","_oldArray","_amount","_index"];

    _item = _this select 0;
    _amount = _this select 1;

    _oldArray = DS_cmGearToComp select {(_x select 0) isEqualTo _item} select 0;
    if(!isNil "_oldArray")then {
        _amount = _amount + (_oldArray select 1);
        _index = DS_cmGearToComp find _oldArray;
        DS_cmGearToComp deleteAt _index;
    };

    DS_cmGearToComp pushBack [_item,_amount];
};

DS_fnc_cmGearCompPlayer = {
    private ["_action","_vehicle","_item","_amount","_type","_note"];

    if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

    _action = [
    		format ["Are you sure you want to compensate %1 with the selected gear?",(name DS_cmUnit)],
    		"Confirm Compensation",
    		"Yes",
    		"No"
    	] call BIS_fnc_guiMessage;
    if(!_action)exitWith{};

    if((isNil "DS_cmUnit")||(isNull DS_cmUnit))exitWith{hint "The compensation target is no longer valid. Did they logout?";};

    _vehicle = "Box_NATO_Ammo_F" createVehicle [0,0,0];
    _overWater = if(surfaceIsWater (getPos DS_cmUnit))then{true}else{false};
    if(_overWater)then{_vehicle setPosASL (getPosASL DS_cmUnit);}else{_vehicle setPosATL (getPosATL DS_cmUnit);};

    _vehicle setVariable["boot_open",true,true];

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;

    {
        _item = _x select 0;
        _amount = _x select 1;
        _type = ([_item] call BIS_fnc_itemType) select 0;

    	switch (toUpper _type) do {
    		case "MAGAZINE": {_vehicle addMagazineCargoGlobal [_item,_amount];};
    		case "ITEM": {_vehicle addItemCargoGlobal [_item,_amount];};
    		case "WEAPON": {_vehicle addWeaponCargoGlobal [_item,_amount];};
    		case "EQUIPMENT": {
    			if(isClass(configFile >> "CfgVehicles" >> _item))then {
    				_vehicle addBackpackCargoGlobal [_item,_amount];
    			} else {
    				_vehicle addItemCargoGlobal [_item,_amount];
                };
    		};
    	};
    }foreach DS_cmGearToComp;

    DS_keyRing pushBack _vehicle;
    [_vehicle,player] remoteExecCall ["DS_fnc_receiveKey",DS_cmUnit];

    {
        hint "An admin has spawned a compensation box on your position. It will automatically despawn in 15 minutes.";
        systemChat "An admin has spawned a compensation box on your position. It will automatically despawn in 15 minutes.";
    } remoteExec ["BIS_fnc_spawn",DS_cmUnit];

    hint format ["You have spawned a compensation box on %1's position. It will automatically despawn in 15 minutes",name DS_cmUnit];
    systemChat format ["You have spawned a compensation box on %1's position. It will automatically despawn in 15 minutes.",name DS_cmUnit];

    _note = format ["Compensated gear (%1)",DS_cmGearToComp];
    [(getPlayerUID DS_cmUnit),"4",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];

    [_vehicle,900] remoteExec ["HUNT_fnc_clearVehicle",2];

    closeDialog 0;
    DS_cmUnit = nil;
};

DS_cmGearFncsLoaded = true;