/*
	File: fn_dropItems.sqf
	Pennyworth
*/

params ["_unit", ["_dropCash", true, [true]], "_obj", "_item", "_value", ["_dropped", []], ["_items", []]];

_item_find = 
{
	_item = _this select 0;
	if(_item in ["life_inv_panicbutton"]) exitWith 
	{
		"Land_Battery_F"
	};
	if(_item in ["life_inv_medkit"]) exitWith
	{
		"Land_Defibrillator_F"
	};
	if(_item in ["life_inv_nos","life_inv_spikeStrip","life_inv_RoadConeStripB","life_inv_RoadConeB","life_inv_RoadConeStrip","life_inv_RoadCone","life_inv_RoadBlockWood","life_inv_RoadBlockConc","life_inv_RoadBlockRebel",
	"life_inv_BarGate"]) exitWith
	{
		"Land_SatellitePhone_F"
	};
	if(_item in ["life_inv_water"]) exitWith
	{
		"Land_BottlePlastic_V1_F"
	};
	if(_item in ["life_inv_mobilephone"]) exitWith
	{
		"Land_MobilePhone_smart_F"
	};
	if(_item in ["life_inv_tbacon"]) exitWith
	{
		"Land_TacticalBacon_F"
	};
	if(_item in ["life_inv_redgull","life_inv_coffee"]) exitWith
	{
		"Land_Can_V3_F"
	};
	if(_item in ["life_inv_fuelE","life_inv_fuelF"]) exitWith
	{
		"Land_CanisterFuel_F"
	};
	if(_item in ["cash_in_hand"]) exitWith
	{
		"cg_money_stack_1"
	};
	if(_item in ["life_inv_MDMAu"]) exitWith
	{
		"Land_ButaneCanister_F"
	};
	if(_item in ["life_inv_MDMAp"]) exitWith
	{
		"Land_Antibiotic_F"
	};
	if(_item in ["life_inv_methp"]) exitWith
	{
		"Land_VitaminBottle_F"
	};
	if(_item in ["life_inv_methu"]) exitWith
	{
		"Land_DisinfectantSpray_F"
	};
	if(_item in ["life_inv_bandage"]) exitWith
	{
		"Land_Bandage_F"
	};
	if(_item in ["life_inv_zoobeer","life_inv_zoobeer2","life_inv_jackdaniels","life_inv_vodka","life_inv_jagerbomb","life_inv_absinthe","life_inv_redwine","life_inv_whitewhine","life_inv_whiterussian",
	"life_inv_sexonthebeach","life_inv_tequila","life_inv_jackdanielsandcoke","life_inv_raxsrum"]) exitWith
	{
		"plp_bo_BottleBitters"
	};
	"Land_Pillow_grey_F";
};

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	if(_value > 0) then
	{
		_items pushBack [_x,[_item,1] call life_fnc_varHandle,_value];
	};
} foreach (life_inv_items + ["cash_in_hand"]);

if(!deadPlayer) then {

	{
		_veh = [_x select 0] call _item_find;
		_pos = _unit modelToWorld[random(4)-2,random(4)-2,0];
		_pos = [_pos select 0, _pos select 1, 0];
		_obj = _veh createVehicle _pos;
		_dropped pushBack _obj;
		_obj setPos _pos;
		_obj setVariable["item",[_x select 1,_x select 2],true];
		missionNamespace setVariable[_x select 0,0];
	} foreach _items;

	if(count _dropped > 0) then
	{
		[_dropped] remoteExec ["TON_fnc_simDisableGlobal",2];
	};
	
};