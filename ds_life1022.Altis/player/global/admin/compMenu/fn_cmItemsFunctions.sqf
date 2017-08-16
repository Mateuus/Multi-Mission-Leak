/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Functions for the items compensation menu
*/

DS_cmLegalMinerals = ["oilu","diamondu","copperu","rocku","saltu","ironu","sandu","woodu","oilp","diamondp","copperp","rockp","saltp","ironp","sandp","woodp","relic"];
DS_cmIllegalDrugs = ["heroinu","cocaineu","weedu","heroinp","cocainep","weedp","illegalRelicu","illegalRelicp"];
DS_cmIllegalItems = ["hydro","sodium","hydroPack","sodiumPack","meth","goldBar","goldBarMedium","goldBarLarge","c4","spyDocs","ied","battery","cracker","safeCrackerAdv","jail10","jailBreak","steroids","noRecoil","quickCap","convoy","pawnee","plane","idChanger","armour","armourAdv","gunLynx","gunLynxAdv","ammoLynx","ammoLynxAdv","gunNavid","gunSpmg","gunCyrus","gun3gl","gunRpg","ammoRpg","ammoRpgAdv","ammoRpgHE","ammoRpgHEAdv","gunRpg7","ammoRpg7","ammoRpg7Adv"];
DS_cmFactoryItems = ["mattBronze","mattCrystalGlass","mattCircuitBoard","mattSmallBattery","mattCpu","mattSteel","mattTreatedLumber","packSteel","packBronze","packGlass","packCircuitBoard","packBattery","packCPU"];
DS_cmBlueprintItems = ["bpVehSecurity","bpVehWeight","bpVehFuel","bpGunLynx","bpAmmoLynx","bpAmmoRpg","bpVehNos","bpVehSUV","bpGunRpg","bpGun3gl","bpGunNavid","bpCyrus","bpWeaponsAir","bpWeaponsLand","bpAmmoRpgHE","bpGunRpg7","bpAirbags","bpInsurance","bpArmourAdv","bpGunSpmg","bpAmmoRpg7"];
DS_cmUpgradeItems = ["houseItemUpgrade","houseWeaponUpgrade","insurance","vehSecurity","vehWeight","vehFuel","vehSecurityAdv","vehWeightAdv","vehFuelAdv","airBags","vehAmmo","weaponsAir","weaponsLand"];
DS_cmMiscellaneousItems = ["water","pepsi","coffee","vodka","bourbon","doritos","burger","donut","tbacon","pie","chips","apple","peach","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","repairKit","refuelKit","lockpick","lighter","siphonKit","nitro","vehNos","vehNosAdv","goKart","mediKit","pickAxe","remains"];

DS_cmCategories = [
    ["Legal Minerals",DS_cmLegalMinerals],
    ["Illegal Drugs",DS_cmIllegalDrugs],
    ["Illegal Items",DS_cmIllegalItems],
    ["Factory Items",DS_cmFactoryItems],
    ["Blueprint Items",DS_cmBlueprintItems],
    ["Upgrade Items",DS_cmUpgradeItems],
    ["Miscellaneous Items",DS_cmMiscellaneousItems]
];

DS_cmNoImg = ["houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap",
"packCPU","packBattery","packCircuitBoard","packGlass","packBronze","packSteel","pawnee","convoy","armourAdv","insurance","airBags","remains"];

DS_fnc_cmGetCategoryItems = {
    private ["_category","_categoryInfo","_items"];

    _category = _this select 0;

    _categoryInfo = DS_cmCategories select _category;
    _items = _categoryInfo select 1;

    _items
};

DS_fnc_cmUpdateItemList = {
    private ["_dialog","_combo1","_list1","_categoryInfo","_string","_short","_img"];

    disableSerialization;

    _dialog = findDisplay 666642;
    if(isNull _dialog)exitWith{};

    _combo2 = _dialog displayCtrl 2102;
    _list1 = _dialog displayCtrl 1500;

    lbClear _list1;

    _categoryItems = [lbCurSel _combo2] call DS_fnc_cmGetCategoryItems;
    if(_categoryItems isEqualTo [])exitWith{};

    {
    	_string = [_x] call DS_fnc_itemStringConfig;
    	_img = format ["extras\icons\%1.jpg",_x];
    	if([_x,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg";};
    	if([_x,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg";};
    	if([_x,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg";};
    	if(_x in DS_cmNoImg)then{_img = "";};

    	_index = _list1 lbAdd format ["%1",_string];
    	_list1 lbSetData [_index,_x];
        if(!(_img isEqualTo ""))then{_list1 lbSetPicture [_index,_img];};
    } forEach _categoryItems;
};

DS_fnc_cmUpdateItemAmount = {
    private ["_dialog","_list2","_selection","_selectedItem","_amount","_string","_short","_img"];

    disableSerialization;

    _dialog = findDisplay 666642;
    if(isNull _dialog)exitWith{};

    _list2 = _dialog displayCtrl 1501;

    _selection = lbCurSel _list2;
    if(_selection isEqualTo -1)exitWith{};

    _selectedItem = _list2 lbData (lbCurSel _list2);
    _amount = parseNumber (ctrlText 1400);
    if(!([str(_amount)] call DS_fnc_isNumber))exitWith{hint "Invalid amount";};

    [] call DS_fnc_cmRemoveItem;

    _string = [_selectedItem] call DS_fnc_itemStringConfig;
    _img = format ["extras\icons\%1.jpg",_x];
    if([_x,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg";};
    if([_x,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg";};
    if([_x,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg";};
    if(_x in DS_cmNoImg)then{_img = "";};

    _index = _list2 lbAdd format ["%1x - %2",_amount,_string];
    _list2 lbSetData [_index,_selectedItem];
    if(!(_img isEqualTo ""))then{_list2 lbSetPicture [_index,_img];};

    [_selectedItem,_amount] call DS_fnc_cmUpdateItemsCompList;
};

DS_fnc_cmAddItem = {
    private ["_dialog","_list1","_list2","_selectedItem","_amount","_string","_short","_img"];

    disableSerialization;

    _dialog = findDisplay 666642;
    if(isNull _dialog)exitWith{};

    _list1 = _dialog displayCtrl 1500;
    _list2 = _dialog displayCtrl 1501;

    _selectedItem = _list1 lbData (lbCurSel _list1);
    _amount = parseNumber (ctrlText 1401);
    if(!([str(_amount)] call DS_fnc_isNumber))exitWith{hint "Invalid amount";};

    _string = [_selectedItem] call DS_fnc_itemStringConfig;
    _img = format ["extras\icons\%1.jpg",_selectedItem];
    if([_selectedItem,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg";};
    if([_selectedItem,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg";};
    if([_selectedItem,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg";};
    if(_selectedItem in DS_cmNoImg)then{_img = "";};

    _index = _list2 lbAdd format ["%1x - %2",_amount,_string];
    _list2 lbSetData [_index,_selectedItem];
    if(!(_img isEqualTo ""))then{_list2 lbSetPicture [_index,_img];};

    ctrlSetText [1401,"1"];

    [_selectedItem,_amount] call DS_fnc_cmUpdateItemsCompList;
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

DS_fnc_cmRemoveItem = {
    private ["_dialog","_list2","_selection","_item","_oldArray","_itemName","_newAmount","_index"];

    disableSerialization;

    _dialog = findDisplay 666642;
    if(isNull _dialog)exitWith{};

    _list2 = _dialog displayCtrl 1501;

    _selection = lbCurSel _list2;
    if(_selection isEqualTo -1)exitWith{};

    _item = _list2 lbData _selection;
    _oldArray = (DS_cmItemsToComp select {(_x select 0) isEqualTo _item}) select 0;
    if(isNil "_oldArray")exitWith{_list2 lbDelete _selection;};

    _itemName = _list2 lbText _selection;
    _newAmount = (_oldArray select 1) - ([_itemName] call DS_fnc_cmNumberFromString);

    _index = DS_cmItemsToComp find _oldArray;
    if(!(_index isEqualTo -1))then{DS_cmItemsToComp deleteAt _index;};

    DS_cmItemsToComp pushBack [_item,_newAmount];

    _list2 lbDelete _selection;
};

DS_fnc_cmUpdateItemsCompList = {
    private ["_item","_amount","_oldArray","_index"];

    _item = _this select 0;
    _amount = _this select 1;

    _oldArray = (DS_cmItemsToComp select {(_x select 0) isEqualTo _item}) select 0;
    if(!isNil "_oldArray")then {
        _amount = _amount + (_oldArray select 1);
        _index = DS_cmItemsToComp find _oldArray;
        DS_cmItemsToComp deleteAt _index;
    };

    DS_cmItemsToComp pushBack [_item,_amount];
};

DS_fnc_cmItemsCompPlayer = {
    private ["_action","_vehicle","_owners","_amount","_note"];

    if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

    _action = [
    		format ["Are you sure you want to compensate %1 with the selected items?",(name DS_cmUnit)],
    		"Confirm Compensation",
    		"Yes",
    		"No"
    	] call BIS_fnc_guiMessage;
    if(!_action)exitWith{};

    if((isNil "DS_cmUnit")||(isNull DS_cmUnit))exitWith{hint "The compensation target is no longer valid. Did they logout?";};

    _vehicle = "Box_NATO_Ammo_F" createVehicle [0,0,0];
    _overWater = if(surfaceIsWater (getPos DS_cmUnit))then{true}else{false};
    if(_overWater)then{_vehicle setPosASL (getPosASL DS_cmUnit);}else{_vehicle setPosATL (getPosATL DS_cmUnit);};

    _vehicle setVariable ["boot",[DS_cmItemsToComp,0],true];
    _vehicle setVariable ["boot_open",false,true];

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;

    _owners = [];
    _owners pushBack [getPlayerUID player,profileName,player];
    _owners pushBack [getPlayerUID (DS_cmUnit),(DS_cmUnit)];
    _vehicle setVariable["vehicle_owners",_owners,true];

    DS_keyRing pushBack _vehicle;
    [_vehicle,player] remoteExecCall ["DS_fnc_receiveKey",DS_cmUnit];

    {
        hint "An admin has spawned a compensation box on your position. It will automatically despawn in 15 minutes";
        systemChat "An admin has spawned a compensation box on your position. It will automatically despawn in 15 minutes.";
    } remoteExec ["BIS_fnc_spawn",DS_cmUnit];

    hint format ["You have spawned a compensation box on %1's position. It will automatically despawn in 15 minutes",name DS_cmUnit];
    systemChat format ["You have spawned a compensation box on %1's position. It will automatically despawn in 15 minutes.",name DS_cmUnit];

    _note = format ["Compensated items (%1)",DS_cmItemsToComp];
    [(getPlayerUID DS_cmUnit),"4",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];

    [_vehicle,900] remoteExec ["HUNT_fnc_clearVehicle",2];

    closeDialog 0;
    DS_cmUnit = nil;
};

DS_cmItemFncsLoaded = true;