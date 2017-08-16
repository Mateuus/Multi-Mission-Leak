private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight"];

disableSerialization;

_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_craftingstation = life_trunk_vehicle;

_matsNeed = 0;

_config = [_itemFilter] call PG_fnc_craftCfg;
{

	if(_item == _x select 0) exitWith
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		/*
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

			_matsNum = _matsNeed select _i+1;

			if((missionNamespace getVariable format ["life_inv_%1",_matsNeed select _i]) < _matsNum) exitWith {_allMaterial = false;};

		};
		*/
		
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			
			_index = [_matsNeed select _i,((_craftingstation getVariable "Trunk") select 0)] call TON_fnc_index;
			_data = (_craftingstation getVariable "Trunk") select 0;
			if(_index == -1) exitWith {_allMaterial = false};
			_value = _data select _index select 1;
			if((_matsNeed select (_i+1)) > _value) exitWith {_allMaterial = false};
		};
	};
} foreach (_config);

if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};

//Some checks
if((count _matsNeed) == 0) exitWith {};

for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
		_num = (_matsNeed select (_i+1));
		_index = [_matsNeed select _i,((_craftingstation getVariable "Trunk") select 0)] call TON_fnc_index;
		_data = (_craftingstation getVariable "Trunk") select 0;
		
		_old = _craftingstation getVariable "Trunk";
		_value = _data select _index select 1;
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[(_matsNeed select _i),(_value - _num)]];
		};
		_weight = ([_item] call life_fnc_itemWeight);
		_craftingstation setVariable["Trunk",[_data,(_old select 1) - _weight],true];
};


/*
if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint localize "STR_CRAFT_AR_Backpack";
};

if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint localize "STR_CRAFT_AR_Uniform";
};

if(_itemFilter == "item") then {
	_weight = ([_item] call life_fnc_itemWeight);
};
if(_itemFilter == "item" && (life_carryWeight + _weight) > life_maxWeight) exitWith {
	hint localize "STR_NOTF_NoRoom";
};

if(_itemFilter == "weapon" && !(player canAdd _newItem) || currentWeapon player != "") exitWith {
	hint localize "STR_NOTF_NoRoom";
};
*/

//_oldItem = _matsNeed;
_newItem = _item;

/*
if(_itemFilter == "item") then{
	_itemName = [_newItem] call life_fnc_varToStr;
} else {
*/
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
//};

_upp = format["Crafting %1",_itemName];
closeDialog 0;

//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

/*
_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

	_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
	if(!([false,_handledItem,_oldItem select _i+1] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
[] call life_fnc_p_updateMenu;

life_is_processing = true;
*/

while{true} do
{
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};

if(_itemFilter == "backpack") then{
	_craftingstation addBackpackCargoGlobal [_newItem,1];
};
/*
if(_itemFilter == "item") then{
	_handledItem = [_newItem,1] call life_fnc_varHandle;
	[true,_handledItem,1] call life_fnc_handleInv;
};
*/
if(_itemFilter == "uniform") then{
	_craftingstation addItemCargoGlobal [_newItem,1];
};
if(_itemFilter == "Westen") then{
	_craftingstation addItemCargoGlobal [_newItem,1];
};

if(_itemFilter == "Ammo") then{
	_craftingstation addMagazineCargoGlobal [_newItem,1];
};


if(_itemFilter == "weapon") then{
	_craftingstation addWeaponCargoGlobal [_newItem,1];
};




5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
//life_is_processing = false;