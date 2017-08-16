/*
	File: fn_dropItems.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
	Needs redone very badly, when I'm not too lazy.
*/
if (life_corruptData) exitWith { hint "YOUR PLAYER DATA IS DAMAGED. You must log out to the lobby and rejoin. Your progress will not save until you do this. Most likely caused by a script-kiddie." };
private["_obj","_unit","_item","_value","_data","_death","_total","_weight","_holstered","_itemShort"];
_unit = _this select 0;
_death = _this select 1;
_data = "";
_value = "";

if (_death && playerSide == west) exitWith {};

if (_death) then {
	_data = life_inv_items;
} else {
	_data = lbData[2005,(lbCurSel 2005)];
	if (_data == "") exitWith{hint "You need to select an item to drop."};
	_data = [_data,0] call life_fnc_varHandle;
	_data = [_data];
};
if (count _data < 1) exitWith{};

if (life_is_processing && life_action_in_use) exitWith {hint "You cannot drop items while processing.";};
_exit = false;
if (!_death) then
{
	if ((getPosASL _unit) select 2 < 0) exitWith { _exit = true; hint "You cannot drop items while under water."; };
	if ((time - life_last_transfer) < 3 && life_createVehicle) exitWith{ _exit = true; hint "You can only drop items once per 3 seconds. Try dropping more at a time.";};
	if (vehicle _unit != _unit && !(vehicle _unit isKindOf "Ship")) exitWith{ _exit = true; hint "You cannot drop items from inside a vehicle!"};
};
if (_exit) exitWith {};
life_last_transfer = time;

{
	_item = _x;
	_total = missionNamespace getVariable _item;
	if (_death) then {
		_value = missionNamespace getVariable _item;
	} else {
		_value = ctrlText 2010;
		if(!([_value] call life_fnc_isnumber)) exitWith {hint"You need to set a number of items to drop.";};
		_value = parseNumber _value;
		if (_value > (missionNameSpace getVariable _item)) then { _value = missionNamespace getVariable _item; };
	};
	_itemShort = [_item,1] call life_fnc_varHandle;
	_weight = ([_itemShort] call life_fnc_itemWeight) * _value;
	
	_model = switch(_item) do
	{
		case "life_inv_saltwater";
		case "life_inv_water": { "Land_BottlePlastic_V1_F" };
		case "life_inv_defib": { "Land_Defibrillator_F"	};
		case "life_inv_lockpick": { "Land_Screwdriver_V1_F" };
		case "life_inv_bloodbag": { "Land_BloodBag_F" };
		case "life_inv_painkillers": { "Land_PainKillers_F" };
		case "life_inv_splint": { "Land_DuctTape_F" };
		case "life_inv_tbacon": { "Land_TacticalBacon_F" };
		case "life_inv_redgull": { "Land_Can_V3_F" };
		case "life_inv_fuelE": { "Land_CanisterFuel_F" };
		case "life_inv_fuelF": { "Land_CanisterFuel_F" };
		case "life_inv_towRope": { "Land_ExtensionCord_F" };
		case "life_inv_coffee": { "Land_Can_V3_F" };
		case "life_inv_oilp": { "Land_CanisterOil_F" };
		case "life_inv_rubber": { "Skeet_Clay_NoPop_F" };
		case "life_inv_soda": { "Land_Can_V3_F" };
		case "life_inv_beer": { "Land_Can_Rusty_F" };
		case "life_inv_protest": { "Land_Poster_04_F" };
		case "life_inv_timber": { "Land_WoodenLog_F" };
		case "life_inv_woodaxe": { "Land_Axe_F" };
		case "life_inv_ducttape": { "Land_DuctTape_F" };
		case "life_inv_shank";
		case "life_inv_skinningknife": { "Land_File_F" };
		case "life_inv_blindfold": { "Land_Bucket_F" };
		case "life_inv_drill": { "Land_DrillAku_F" };
		case "life_inv_boltCutters": { "Land_Pliers_F" };
		case "life_inv_demoCharge": { "Land_MultiMeter_F" };
		case "life_inv_tent1";
		case "life_inv_tent2": { "Land_Sleeping_bag_folded_F" };
		case "life_inv_speedbomb": { "Bomb" };
		case "life_inv_redBurger": { "Land_Can_V3_F" };
		case "life_inv_scotch_0";
		case "life_inv_scotch_1";
		case "life_inv_scotch_2";
		case "life_inv_scotch_3";
		case "life_inv_gingerale_0";
		case "life_inv_gingerale_1";
		case "life_inv_gingerale_2";
		case "life_inv_gingerale_3";
		case "life_inv_rum_0";
		case "life_inv_rum_1";
		case "life_inv_rum_2";
		case "life_inv_rum_3";
		case "life_inv_whiskeyc_0";
		case "life_inv_whiskeyc_1";
		case "life_inv_whiskeyc_2";
		case "life_inv_whiskeyc_3";
		case "life_inv_whiskeyr_0";
		case "life_inv_whiskeyr_1";
		case "life_inv_whiskeyr_2";
		case "life_inv_whiskeyr_3";
		case "life_inv_moonshine": { "Land_Canteen_F" };
		case "life_inv_yeast": { "Land_PowderedMilk_F" };
		case "life_inv_corn";
		case "life_inv_rye";
		case "life_inv_barley": { "Land_BakedBeans_F" };
		case "life_inv_dirty_money": { "Land_Money_F" };
		default { "Land_Suitcase_F" };
	};
	
	if (_item == "life_inv_dirty_money" && life_inv_dirty_money > 0) then { [[223, _unit, format["Dropped Dirty Money: $%1 ", _value ]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP; };
	
	if ((_value > 0) && !(_item in ["life_inv_debitcard","life_money"])) then
	{
		_var = [_item,1] call life_fnc_varHandle;
		//_pos = _unit modelToWorld [0,3,0]; //ASLToAGL (getPosASL _unit);
		_pos = if (vehicle _unit == _unit) then {getPosATL _unit} else {(vehicle _unit) modeltoWorld [0,-8,0]};
		if(vehicle _unit isKindOf "Air") then {_pos set[2,1]};
		if(life_createVehicle || _death) then {
			_obj = createVehicle [_model, _pos, [], 1, "CAN_COLLIDE"];
			_obj setVariable["item",[_var,_value],true];
			_obj setVariable["idleTime",time,true];
			_obj spawn { sleep 3; [[_this],"life_fnc_simDisable",false,false] spawn life_fnc_MP; _this enableSimulation false; };
		};
		missionNamespace setVariable[_x,(_total - _value)];
		life_carryWeight = life_carryWeight - _weight;
	};
	
} foreach _data;

if (life_money > 0 && _death && (playerSide != west)) then
{
	_pos = if(isNull objectParent player) then {getPosATL _unit} else {vehicle _unit modeltoWorld [0,-5,0]};
	if(vehicle _unit isKindOf "Air") then {_pos set[2,1]};
	[[222, player, format["Dropped Money: $%1 ", life_money ]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	_obj = createVehicle ["Land_Money_F", _pos, [], 1, "CAN_COLLIDE"];
	_obj setVariable["item",["money",life_money],true];
	_obj setVariable["idleTime",time,true];
	["cash","set",0] call life_fnc_uC;
	_obj spawn { sleep 3; [[_this],"life_fnc_simDisable",false,false] spawn life_fnc_MP; _this enableSimulation false; };
};


if (life_carryWeight < 0) then { life_carryWeight = 0 };

if (!_death) then
{
	if (!isNull (findDisplay 602)) then
	{
		[false] call life_fnc_inventory;
	};
	[] spawn life_fnc_sessionUpdate;
};

if (!isNull life_object_inhand)  then { deleteVehicle life_object_inhand };