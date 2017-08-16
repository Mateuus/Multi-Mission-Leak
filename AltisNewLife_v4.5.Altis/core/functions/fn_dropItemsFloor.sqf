#include <macro.h>
private["_obj","_unit","_item","_itemName","_value","_data","_total","_weight","_var"];
_unit = _this select 0;
_data = "";
_value = "";

	_data = lbData[2005,(lbCurSel 2005)];
	if (_data == "") exitWith {hint "Vous devez choisir un objet."};
	_data2 = [_data];
	if((time - life_action_delay) < 3) exitWith {hint "Vous ne pouvez pas lacher des objets aussi rapidement !"};
	life_action_delay = time;
	if(life_is_processing) exitWith {hint "Vous êtes en train de process petit malin.";};
	if(player != vehicle player) exitWith {titleText["Vous ne pouvez pas jeter un objet lorsque vous êtes dans un véhicule.","PLAIN"];};
	if(side player != west) then {
	if(EQUAL(ITEM_ILLEGAL(_data),1) && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {titleText["C'est un objet illégal et les gendarmes sont à proximité, vous ne pouvez jetez pas cette preuve","PLAIN"];};
	};
{
		_item = _x;
		_itemName = ITEM_VARNAME(_item);
		_total = ITEM_VALUE(_item);
		_value = ctrlText 2010;
		if(parseNumber(_value) <= 0) exitWith {hint "Merci de preciser la quantité que vous souhaitez lacher."};
		if(!([false,_item,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Vous ne pouvez pas en lacher autant !";};
		_value = parseNumber _value;

	_weight = M_CONFIG(getNumber,"ANL_VItems",_item,"weight") * _value;
	switch(_item) do
	{
		case "water":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "bottles":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "bottledbeer":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "bottledwhiskey":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "bottledbshine":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "defib":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Defibrillator_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "lockpick":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Screwdriver_V1_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "bloodbag":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BloodBag_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "painkillers":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_PainKillers_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "tbacon":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "redgull":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "fuelE":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "fuelF":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "coffee":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "sprite":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "couteau":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_File_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "cb":
		{
			SVAR_MNS[_itemName,(_total - _value)];
		};
		case "sacpatate":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Bucket_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "boltCutters":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Pliers_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "demoCharge":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_MultiMeter_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "tente1":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Sleeping_bag_folded_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "tente2":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Sleeping_bag_folded_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "speedbomb":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Bomb" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "redBurger":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "cokep":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_PowderedMilk_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "heroinp":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_PowderedMilk_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "meth97":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_PowderedMilk_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "scalpel":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanOpener_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "multipass":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanOpener_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "pickaxe":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Shovel_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
				SVAR_MNS[_itemName,(_total - _value)];
			};
		};
		case "argent_liquide":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj SVAR["item",["money",_value],true];
				_obj setPos _pos;
				["cash","set",(_total - _value)] call life_fnc_updateCash;
			};
		};
		default
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Suitcase_F" createVehicle _pos;
				_obj setPos _pos;
				_obj SVAR["item",[_item,_value],true];
			};
		};
	};
	if (_value > 0) then {_obj SVAR["idleTime",time,true];};
} foreach (_data2);
[] call life_fnc_p_updateMenu;