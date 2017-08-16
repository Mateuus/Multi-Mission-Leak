/*
	File: fn_processAction.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_vals","_delayInt"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 6)) exitWith {};
if ((vehicle player) != player) exitWith { titleText["This action cannot be performed from within a vehicle.","PLAIN"]; };
if (side player == west) exitWith {titleText["You cannot preform this action as an officer.","PLAIN"];};

if ((_type == "cement") && !(50 in life_talents)) exitWith { hint "You must have the talent Cement Mixer to process cement."; };

//unprocessed item,processed item, cost if no license,Text to display, capture index (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {[["oilb"],"oilp",10,"Processing Oil",2];};
	case "diamond": {[["diamond"],"diamondc",15,"Processing Diamond",0]};
	case "copper": {[["copperore"],"copper_r",7,"Processing Copper",0]};
	case "iron": {[["ironore"],"iron_r",11,"Processing Iron",0]};
	case "sand": {[["sand"],"glass",6,"Processing Sand",0]};
	case "salt": {[["salt"],"salt_r",4,"Processing Salt",0]};
	case "purecocaine": {[["cocapaste"],"cocainepure",0,"Processing Pure Cocaine",1]};
	case "cocaine": {[["cocaine"],"cocainep",0,"Processing Cocaine",1]};
	case "marijuana": {[["cannabis"],"marijuana",0,"Processing Marijuana",1]};
	case "marijuanam": {[["cannabis"],"marijuanam",0,"Processing Medicinal Marijuana",0]};
	case "sugar": {[["sugarcane"],"sugar",0,"Refining Sugar",0]};
	case "timber": {[["timber"],"plank",0,"Processing Timber",0]};
	case "heroin": {[["heroinu"],"heroinp",0,"Processing Heroin",1]};
	case "cement": {[["rock"],"cement",3,"Mixing Cement",0]};
	case "ephedra" : {[["ephedrau","phos","hydro"],"ephedra",0,"Mixing Ingredients",0]};
	case "moonshine" : {[["water","yeast","corn"],"moonshine",0,"Distilling Spirits",0]};
	case "moonshinesalt" : {[["saltwater","yeast","corn"],"moonshine",0,"Distilling Spirits",0]};
	case "scotch" : {[["water","yeast","barley"],"scotch_0",0,"Distilling Spirits",0]};
	case "scotchsalt" : {[["saltwater","yeast","barley"],"scotch_0",0,"Distilling Spirits",0]};
	case "whiskeyc" : {[["water","yeast","barley","corn"],"whiskeyc_0",0,"Distilling Spirits",0]};
	case "whiskeycsalt" : {[["saltwater","yeast","barley","corn"],"whiskeyc_0",0,"Distilling Spirits",0]};
	case "rum" : {[["water","yeast","sugar"],"rum_0",0,"Distilling Spirits",0]};
	case "rumsalt" : {[["saltwater","yeast","sugar"],"rum_0",0,"Distilling Spirits",0]};
	case "gingerale" : {[["water","yeast","ginger"],"gingerale_0",0,"Distilling Spirits",0]};
	case "gingeralesalt" : {[["saltwater","yeast","ginger"],"gingerale_0",0,"Distilling Spirits",0]};
	case "whiskeyr" : {[["water","yeast","barley","rye"],"whiskeyr_0",0,"Distilling Spirits",0]};
	case "whiskeyrsalt" : {[["saltwater","yeast","barley","rye"],"whiskeyr_0",0,"Distilling Spirits",0]};
	case "meth" : {[["ephedra"],"meth",0,"Cooking Meth",1]};
	case "plate" : {[["plateMetal"],"plate",0,"Pressing Plate",0]};
	case "rock" : {[["rock"],"rock",0,"Examining Stone",0]};
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {hint "You don't have the items necessary"};

//Setup vars.
_oldItem = [];
_vals = [];
{_oldItem = _oldItem + [_x];} foreach (_itemInfo select 0);
if(count _oldItem == 0) exitWith {hint "You don't have the items necessary"};
{_vals = _vals + [missionNamespace getVariable ([_x,0] call life_fnc_varHandle)];} foreach _oldItem;
_oldVal = _vals select 0;
{if (_x < _oldVal) then {_oldVal = _x};} foreach _vals;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_hasLicense = true;
if (_type in ["oil","diamond","copper","iron","sand","salt","cement"]) then { _hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0); };
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if(_oldVal == 0) exitWith {};
_cost = _cost * _oldVal;
_capture = false;
if ((_itemInfo select 4) > 0) then { _capture = true; };

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;
life_action_in_use = true;
if((!_hasLicense)&&(life_money < _cost)&&(!_capture)) exitWith {
	hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText];
	5 cutText ["","PLAIN"]; life_is_processing = false; life_action_in_use = false;
};
_delayInt = _oldVal * 0.03;
while{true} do {
	sleep _delayInt;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vendor > 10) exitWith {};
	if (!life_action_in_use) exitWith {};
};
if (!life_action_in_use) exitWith {hint "Action cancelled. Aborted processing!"; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_in_use = false;};
if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_in_use = false;};
if((!_hasLicense)&&(!_capture)&&(life_money < _cost)) exitWith {hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_in_use = false;};
if(!(alive player)) exitWith {hint "You need to be alive to process."; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_in_use = false;};
life_action_in_use = false;
//Removes the old items
{
	if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; life_is_processing = false; life_action_in_use = false;
	};
} foreach _oldItem;

// Reduce amount if not talented
_reduce = false;
if ((_type in ["marijuana","marijuanam"]) && !(24 in life_talents)) then { _reduce = true; };
if ((_type == "heroin") && !(25 in life_talents)) then { _reduce = true; };
if ((_type == "cocaine") && !(26 in life_talents)) then { _reduce = true; };
if ((_type == "meth") && !(27 in life_talents)) then { _reduce = true; };
if (_reduce) then
{
	_oldVal = floor(_oldVal * 0.75);
};
if (_type == "timber") then { _oldVal = floor(_oldVal / 3); };

//Reduce amount if capturable
_oldOldVal = _oldVal;
if (_capture) then
{
	_point = life_capture_list select (_itemInfo select 4);
	if (((_point select 1) != life_gang) || (_point select 2) < 1) then
	{
		_oldVal = switch (true) do
		{
			case (_newItem in ["ephedra","meth"]): { floor(_oldVal * 0.85) };
			case (_type == "oil"): { _oldVal };
			default { floor(_oldVal * 0.80) };
		};
	};	
};

//Adds the new item
if (_type != "plate" && _type != "rock") then
{
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) then
	{
		{[true,_x,_oldVal] call life_fnc_handleInv;} foreach _oldItem;
		life_is_processing = false; life_action_in_use = false;
	}
	else
	{
		switch (_type) do
		{
			case "oil":
			{
				life_experience = life_experience + (_oldVal * 3);
				_rubbers = ceil (random 3);
				if (105 in life_talents) then { _rubbers = _rubbers + 1 };
				[true,"rubber",_rubbers] call life_fnc_handleInv;
				if (_rubbers > 0) then { hint format["You've received %1 units of rubber while processing oil.", _rubbers]};
			};
			case "diamond": {life_experience = life_experience + (_oldVal * 3)};
			case "cocaine": {life_experience = life_experience + (_oldVal * 3)};
			case "cocainepure": {life_experience = life_experience + (_oldVal * 5)};
			case "meth": {life_experience = life_experience + (_oldVal * 3)};
			case "heroin": {life_experience = life_experience + (_oldVal * 2)};
			default {life_experience = life_experience + (_oldVal + 2);};
		};
	};
}
else
{
	_oldBail = life_bail_amount;
	life_bail_amount = life_bail_amount - (350 * _oldVal);
	life_experience = life_experience + _oldVal;
	if (life_bail_amount < 1500) then { life_bail_amount = 1500; };
	titleText[format["Your bail price has been reduced by $%1.",[floor(_oldBail - life_bail_amount)] call life_fnc_numberText],"PLAIN"];
	life_is_processing = false;
};

5 cutText ["","PLAIN"];
if (!life_is_processing) exitWith {};

if (_capture) then
{
	_point = life_capture_list select (_itemInfo select 4);
	if (((_point select 1) == life_gang) && (_point select 2) == 1) then
	{
		titleText[format["You have processed your goods into %1. As owner of %2, you retain the entire amount.",_itemName,_point select 0],"PLAIN"];
	}
	else
	{
		if ((_itemInfo select 4) == 2) then
		{
			titleText[format["You have processed your goods into %2 %1.",_itemName,_oldVal],"PLAIN"];
		}
		else
		{
			titleText[format["You have processed your goods into %1. You retain %2 after the owners of %3 took a cut of %4 %1.",_itemName,_oldVal,_point select 0,_oldOldVal - _oldVal],"PLAIN"];
		};
		if ((_point select 1) != "0" && (_point select 2) == 1) then
		{
			_newAmount = if ((_itemInfo select 4) == 2) then { 1 } else { _oldOldVal - _oldVal };
			_container = call compile format["capture_container_%1", (_itemInfo select 4) + 1];
			_var = _container getVariable ["gangContainer", []];
			if (count _var > 0) then
			{
				if ((_point select 5) == "life_inv_dirty_money") then
				{
					_index = -1;
					{ if (_newItem == (_x select 0)) then { _index = _forEachIndex;} } forEach buy_array;
					_price = (buy_array select _index) select 1;
					_qty = _newItem call life_fnc_getQuantity;
					_price = ([_newItem,_price,_qty,false] call life_fnc_calcPrice) * 0.75;
					_newAmount = floor (_price * (_newAmount * 2.5));
				};
				_newAmount = (_var select 1) + _newAmount;
				_max = if (_type == "oil") then { 40 } else { 100000 };
				if (_newAmount > _max) then { _newAmount = _max; };
				_var set [1, _newAmount];
				_container setVariable ["gangContainer", _var, true];
				life_capture_changed = +life_capture_list;
				publicVariableServer "life_capture_changed";
			};
		};
	};
}
else
{
	if (_hasLicense) then {
		titleText[format["You have processed your goods into %1",_itemName],"PLAIN"];
	} else {
		titleText[format["You have processed your goods into %1 for $%2",_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
		["cash","take",_cost] call life_fnc_uC;
	};
};

life_is_processing = false;
//[[36, player, format["Processed %1 into %2", _oldVal, _itemName]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;