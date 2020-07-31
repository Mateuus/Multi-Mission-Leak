/*
	File: fn_processAction.sqf
	
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = param [0,ObjNull,[ObjNull]];
_type = param [3,"",[""]];
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",12,(localize "STR_Process_Oil")];};
	case "diamond": {["diamond","diamondc",13,(localize "STR_Process_Diamond")];};
	case "heroin": {["heroinu","heroinp",17,(localize "STR_Process_Heroin")];};
	case "copper": {["copperore","copper_r",7,(localize "STR_Process_Copper")];};
	case "iron": {["ironore","iron_r",11,(localize "STR_Process_Iron")];};
	case "sand": {["sand","glass",6,(localize "STR_Process_Sand")];};
	case "salt": {["salt","salt_r",4,(localize "STR_Process_Salt")];};
	case "marijuana": {["cannabis","marijuana",5,(localize "STR_Process_Marijuana")];};
	case "cement": {["rock","cement",3,(localize "STR_Process_Cement")];};
	case "meth": {["methu","methp",50,"Packaging Meth"];};
	case "MDMA": {["MDMAu","MDMAp",50,"Pill Pressing MDMA"];};
	case "coke": {["cokeu","cokep",50,"Packaging Cocaine"];};
	default {[];};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);
_weight = ([_oldItem] call life_fnc_itemWeight) * _oldVal;
_cost = round(_cost * _oldVal);
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_cP = 0.01;

if (life_karma < 0 && _type in ["heroin","marijuana","meth","MDMA","coke"]) then {
	_cP = 0.4;	
};
_progress progressSetPosition _cp;
life_is_processing = true;

if(_hasLicense) then
{
	_delay = (1/150)*_weight;
	while{true} do
	{
		uiSleep _delay;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {[localize "STR_Process_Stay", false] spawn domsg; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	[format[localize "STR_Process_Processed",_oldVal,_itemName], false] spawn domsg;
	life_is_processing = false;
}
else
{
	if(cash_in_hand < _cost) exitWith {[format[localize "STR_Process_License",[_cost] call life_fnc_numberText], false] spawn domsg; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	_delay = (1/75)*_weight;
	while{true} do
	{
		uiSleep _delay;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {[localize "STR_Process_Stay", false] spawn domsg; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(cash_in_hand < _cost) exitWith {[format[localize "STR_Process_License",[_cost] call life_fnc_numberText], false] spawn domsg; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText], false] spawn domsg;
	["cash","take",_cost] call life_fnc_handleCash;
	life_is_processing = false;
};	