/*
	File: fn_processAction.sqf new
	Author: Bryan "Tonic" Boardwine
	
	edited by theInfinit (to process 2 Item to a combination)

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2","_data","_profName"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
_error1 = false;
_error2 = false;
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
 // used below check the comment there ;) 
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ...",processing 2Items?, (only for processing with 2) second Item.
_itemInfo = switch (_type) do
{
  	case "oil": {["oilu","oilp",1200,(localize "STR_Process_Oil"),false];};
	case "diamond": {["diamond","diamondc",1350,(localize "STR_Process_Diamond"),false];};
	case "heroin": {["heroinu","heroinp",2100,(localize "STR_Process_Heroin"),false];};
	case "copper": {["copperore","copper_r",750,(localize "STR_Process_Copper"),false];};
	case "iron": {["ironore","iron_r",1120,(localize "STR_Process_Iron"),false];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand"),false];};
	case "glassbottle":{["glass","bottles",650,(localize "STR_Process_Bottles"),false];};
	case "salt": {["salt","salt_r",450,(localize "STR_Process_Salt"),false];};
	case "cocaine": {["cocaine","cocainep",1500,(localize "STR_Process_Cocaine"),false];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana"),false];};
	case "cement": {["rock","cement",350,(localize "STR_Process_Cement"),false];};
	case "mash": {["water","mash",500,(localize "STR_Process_Mash"),true,"cornmeal"];};
	case "whiskey": {["yeast","whiskey",1500,(localize "STR_Process_Whiskey"),true,"rye"];};
	case "beer": {["yeast","beerp",1500,(localize "STR_Process_Beer"),true,"hops"];};
	case "moonshine": {["yeast","moonshine",1500,(localize "STR_Process_Moonshine"),true,"mash"];};
	case "bottledshine": {["moonshine","bottledshine",500,(localize "STR_Process_BotMoon"),true,"bottles"];};
	case "bottledbeer": {["beerp","bottledbeer",500,(localize "STR_Process_BotBeer"),true,"bottles"];};
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,(localize "STR_Process_BotWhiskey"),true,"bottles"];};
	case "joint": {["marijuana","joint",500,(localize "STR_Process_Joint"),false];};
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

if(_2var) then { _oldItem2 = _itemInfo select 5;};  

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);
//2vars
if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle); }; 

if(_2var) then { 
       if(_oldVal !=_oldVal2) then {
              _error1 = true;
       };
       if(_oldVal2 !=_oldVal) then {
              _error2 = true;			  
       };	   
};
if(_error1) exitWith{ hint format[localize "STR_MISC_NeedMoreToProc1",_oldItem2];};
if(_error2) exitWith{hint format[localize "STR_MISC_NeedMoreToProc1",_oldItem];};

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};
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

if(_hasLicense) then
{
	_time = 0.3;
	_cpUp = 0.01;
	_profName = [_type] call life_fnc_profType;
	_data = missionNamespace getVariable "_profName";
	
	if( _profName != "" ) then 
	{
		switch ( _data select 0 ) do
		{
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
		};
	};
	while{true} do
	{
		sleep _time;
		_cP = _cP + _cpUp;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};

	//2vars
	if(_2var) then 
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed1",_oldItem,_oldItem2,_itemName],"PLAIN"];
	}
	else
	{
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed",_oldItem,_itemName],"PLAIN"];
	};

	if( _profName != "" ) then
	{
		[_profName,40] call life_fnc_addExp;
	};
	
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
}
else
{
	if(life_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	_time = 0.9;
	_cpUp = 0.01;
	 
	_profName = [_type] call life_fnc_profType;
	_data = missionNamespace getVariable "_profName";
	if( _profName != "" ) then 
	{
		switch ( _data select 0) do
		{
			case 1: { _time = 0.9; _cpUp = 0.01; };
			case 2: { _time = 0.8; _cpUp = 0.01; };
			case 3: { _time = 0.7; _cpUp = 0.01; };
			case 4: { _time = 0.6; _cpUp = 0.01; };
			case 5: { _time = 0.5; _cpUp = 0.01; };
			case 6: { _time = 0.4; _cpUp = 0.01; };
			case 7: { _time = 0.3; _cpUp = 0.01; };
			case 8: { _time = 0.2; _cpUp = 0.01; };
			case 9: { _time = 0.2; _cpUp = 0.02; };
			case 10: { _time = 0.2; _cpUp = 0.03; };
		};
	};
	
	while{true} do
	{
		sleep  _time;
		_cP = _cP + _cpUp;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	if(life_cash < _cost) exitWith {hint format["You need $%1 to process  without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
			
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};

	//2vars
	if(_2var) then 
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed1a",_oldItem,_oldItem2,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	} else
	{
		5 cutText ["","PLAIN"];
		titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	};
	
	if( _profName != "" ) then
	{
		[_profName,20] call life_fnc_addExp;
	};
	
	life_cash = life_cash - _cost;
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};