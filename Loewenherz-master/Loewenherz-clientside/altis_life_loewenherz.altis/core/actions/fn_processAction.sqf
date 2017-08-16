/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
	(LHM Alcohol)
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_cpUp","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2","_addExpAmount","_time","_profName","_data"];
_vendor = param [0,ObjNull,[ObjNull]];
_type = param [3,"",[""]];
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
_error1 = false; // used below check the comment there ;)
_error2 = false;
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ...",processing 2Items?, (only for processing with 2) second Item.
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,(localize "STR_Process_Oil")];};
	case "diamond": {["diamond","diamondc",1350,(localize "STR_Process_Diamond")];};
	case "heroin": {["heroinu","heroinp",1750,(localize "STR_Process_Heroin")];};
	case "copper": {["copperore","copper_r",750,(localize "STR_Process_Copper")];};
	case "iron": {["ironore","iron_r",1120,(localize "STR_Process_Iron")];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand")];};
	case "salt": {["salt","salt_r",450,(localize "STR_Process_Salt")];};
	case "cocaine": {["cocaine","cocainep",1500,(localize "STR_Process_Cocaine")];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana")];};
	case "cement": {["rock","cement",350,(localize "STR_Process_Cement")];};
// LHM Alcohol	Start
	case "glassbottle":{["glass","bottles",650,"Making Bottles",false]};//new
	case "mash": {["water","mash",100,"Mixing Grain Mash",true,"cornmeal"]};//new
	case "whiskey": {["yeast","whiskey",1000,"Fermenting Whiskey",true,"rye"]};//new
	case "beer": {["yeast","beerp",1500,"Brewing Beer",true,"hops"]};//new
	case "moonshine": {["yeast","moonshine",250,"Moonshining",true,"mash"]};//new
	case "bottledshine": {["moonshine","bottledshine",500,"Bootle Moonshine",true,"bottles"]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Bottle Beer",true,"bottles"]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Bottle Whiskey",true,"bottles"]};//new
	case "uran": {["uranwaste","uran",1200,"Processing Uran"];}; // neu
	case "zigarette": {["tabak","zigarette",900,"Processing Tabak"];}; // neu
	case "wood": {["woodu","woodp",900,"Verarbeite Holz"];}; // neu
// LHM Alcohol End
    default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.  // true if process action is with 2 Items and false if processing with 1 Item.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_2var = _itemInfo select 4;

if(isNil "_2var") then {_2var = false;};
if(_2var) then { _oldItem2 = _itemInfo select 5;};

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call lhm_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call lhm_fnc_varHandle)] call lhm_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call lhm_fnc_varHandle);
_addExpAmount = 5;
//2vars
if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call lhm_fnc_varHandle); };

if(_2var) then {
       if(_oldVal !=_oldVal2) then {
			if(_oldVal > _oldVal2) then {_error1 = true;};
			if(_oldVal2 > _oldVal) then {_error2 = true;};
       };
};
if(_error1) exitWith{hint format["Du hast zuviel %1, du brauchst gleich viele",_oldItem];};
if(_error2) exitWith{hint format["Du hast zuviel %1, du brauchst gleich viele",_oldItem2];};

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};
//Setup our progress bar.
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

lhm_is_processing = true;

if(_hasLicense) then
{
//SkillSystem
	_time = 0.3;
	_cpUp = 0.01;
	_profName = [_type] call lhm_fnc_profType;
	_data = missionNamespace getVariable (_profName);
	if( _profName != "" ) then
	{
			if((_data select 0) > 0) then {
					_addExpAmount = _addExpAmount + round(2.5 * (_data select 0));
			};

		switch ( _data select 0 ) do
		{
				case 0: { _time = 0.5; _cpUp = 0.009; };
				case 1: { _time = 0.4; _cpUp = 0.01; };
				case 2: { _time = 0.35; _cpUp = 0.01; };
				case 3: { _time = 0.3; _cpUp = 0.01; };
				case 4: { _time = 0.25; _cpUp = 0.01; };
				case 5: { _time = 0.2; _cpUp = 0.01; };
				case 6: { _time = 0.2; _cpUp = 0.02; };
				case 7: { _time = 0.2; _cpUp = 0.03; };
				case 8: { _time = 0.2; _cpUp = 0.04; };
				case 9: { _time = 0.15; _cpUp = 0.05; };
				case 10: { _time = 0.1; _cpUp = 0.07; };
				case 11: { _time = 0.1; _cpUp = 0.08; };
				case 12: { _time = 0.1; _cpUp = 0.09; };
				case 13: { _time = 0.09; _cpUp = 0.09; };
				case 14: { _time = 0.09; _cpUp = 0.09; };
				case 15: { _time = 0.09; _cpUp = 0.10; };
				case 16: { _time = 0.08; _cpUp = 0.11; };
				case 17: { _time = 0.08; _cpUp = 0.12; };
				case 18: { _time = 0.07; _cpUp = 0.12; };
				case 19: { _time = 0.06; _cpUp = 0.13; };
				case 20: { _time = 0.05; _cpUp = 0.14; };
		};
	};
	
	// Animation Fix Test
	if((weaponState player select 4) > 0) then {
		player action ["SwitchWeapon", player, player, 100];
	};
	waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};
	
//SkillSystem
	For "_i" from 0 to 1 step 0 do
	{
		if((_data select 0) <= 3) then {
			// Animation Fix Test
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				 player action ["SwitchWeapon", player, player, 100];
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				 player playActionNow "stop";
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				 player playActionNow "stop";
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			 };
			 // Animation Fix Test
		};
		sleep _time;
		_cP = _cP + _cpUp;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};

	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; lhm_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call lhm_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; lhm_is_processing = false;};
	if(!([true,_newItem,_oldVal] call lhm_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call lhm_fnc_handleInv; lhm_is_processing = false;};
	//2vars
	if(_2var) then
	{

		([false,_oldItem2,_oldVal2] call lhm_fnc_handleInv);
		5 cutText ["","PLAIN"];
		titleText[format["Du hast %1 und %2 in %3 verarbeitet.",_oldItem,_oldItem2,_itemName],"PLAIN"];
	} else
	{

		5 cutText ["","PLAIN"];
		titleText[format["Du hast %1 in %2 verarbeitet.",_oldItem,_itemName],"PLAIN"];
	};
// papabears-persistent-proficiency-system //
	if( _profName != "" ) then
	{
		[_profName,_addExpAmount] call lhm_fnc_addExp;
	};
// papabears-persistent-proficiency-system //
	lhm_is_processing = false;
}
else
{
	if(lhm_cash < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizenz zu verarbeiten!",[_cost] call lhm_fnc_numberText]; 5 cutText ["","PLAIN"]; lhm_is_processing = false;};
// papabears-persistent-proficiency-system //
	_time = 0.9;
	_cpUp = 0.01;

	_profName = [_type] call lhm_fnc_profType;
	_data  = missionNamespace getVariable (_profName);
	if( _profName != "" ) then {

		if((_data select 0) > 0) then {
				_addExpAmount = _addExpAmount + round(2.5 * (_data select 0));
		};
		switch ( _data select 0) do {
				case 0: { _time = 0.99; _cpUp = 0.009; };
				case 1: { _time = 0.9; _cpUp = 0.01; };
				case 2: { _time = 0.8; _cpUp = 0.01; };
				case 3: { _time = 0.7; _cpUp = 0.01; };
				case 4: { _time = 0.6; _cpUp = 0.01; };
				case 5: { _time = 0.5; _cpUp = 0.01; };
				case 6: { _time = 0.4; _cpUp = 0.01; };
				case 7: { _time = 0.3; _cpUp = 0.01; };
				case 8: { _time = 0.2; _cpUp = 0.01; };
				case 9: { _time = 0.2; _cpUp = 0.02; };
				case 10: { _time = 0.15; _cpUp = 0.021; };
				case 11: { _time = 0.14; _cpUp = 0.022; };
				case 12: { _time = 0.13; _cpUp = 0.023; };
				case 13: { _time = 0.12; _cpUp = 0.024; };
				case 14: { _time = 0.11; _cpUp = 0.025; };
				case 15: { _time = 0.1; _cpUp = 0.026; };
				case 16: { _time = 0.09; _cpUp = 0.027; };
				case 17: { _time = 0.08; _cpUp = 0.028; };
				case 18: { _time = 0.07; _cpUp = 0.029; };
				case 19: { _time = 0.06; _cpUp = 0.030; };
				case 20: { _time = 0.05; _cpUp = 0.031; };
			};

	};
// papabears-persistent-proficiency-system //
	For "_i" from 0 to 1 step 0 do {
		if((_data select 0) <= 3) then {
				if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
						player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
						player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				};
		};
		sleep _time;
		_cP = _cP + _cpUp;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Du musst in einem Radius von 10m bleiben."; 5 cutText ["","PLAIN"]; lhm_is_processing = false;};
	if(lhm_cash < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizenz zu verarbeiten!",[_cost] call lhm_fnc_numberText]; 5 cutText ["","PLAIN"]; lhm_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call lhm_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; lhm_is_processing = false;};
	if(!([true,_newItem,_oldVal] call lhm_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call lhm_fnc_handleInv; lhm_is_processing = false;};
	//2vars
	if(_2var) then
	{

		([false,_oldItem2,_oldVal2] call lhm_fnc_handleInv);
		5 cutText ["","PLAIN"];
		titleText[format["Du hast %1 und %2 in %3 verarbeitet zum Preis von %4.",_oldItem,_oldItem2,_itemName,[_cost] call lhm_fnc_numberText],"PLAIN"];
	} else
	{

		5 cutText ["","PLAIN"];
		titleText[format["Du hast %1 in %2 verarbeitet zum Preis von %3.",_oldVal,_itemName,[_cost] call lhm_fnc_numberText],"PLAIN"];
	};
	lhm_cash = lhm_cash - _cost;
// papabears-persistent-proficiency-system //
	if( _profName != "" ) then
	{
		[_profName,_addExpAmount] call lhm_fnc_addExp;
	};
// papabears-persistent-proficiency-system //
	lhm_is_processing = false;
};