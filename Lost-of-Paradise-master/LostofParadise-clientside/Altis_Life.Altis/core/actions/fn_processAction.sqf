/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_2var","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if ( vehicle player != player ) exitWith {hint "Du musst aussteigen."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

_error = false; // used below check the comment there ;)
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,"Verarbeite Öl",false]};
	case "silber": {["silberu","silberp",1200,"Verarbeite Silber",false]};
	case "kerosin": {["oilp","kerosin",1200,"Verarbeite Öl zu Kerosin",false]};
	case "diamond": {["diamond","diamondc",1350,"Verarbeite Diamanten",false]};
	case "heroin": {["heroinu","heroinp",2100,"Verarbeite Heroin",false]};
	case "bleiglas": {["bleiu","bleigp",1500,"Verarbeite Blei",false]};
	case "legierung": {["bleiu","bleilp",1500,"Verarbeite Blei",false]};
	case "radioaktiv": {["radioaktivu","radioaktivp",1500,"Radioaktive Stoffe werden versiegelt",false]};
	case "copper": {["copperore","copper_r",750,"Verarbeite Kupfer",false]};
	case "iron": {["ironore","iron_r",1120,"Verarbeite Eisen",false]};
	case "sand": {["sand","glass",650,"Verarbeite Sand",false]};
	case "salt": {["salt","salt_r",450,"Verarbeite Salz",false]};
	case "cocaine": {["cocaine","cocainep",1500,"Verarbeite Kokain",false]};
	case "marijuana": {["cannabis","marijuana",500,"Verarbeite Gras",false]};
	case "heroin": {["heroinu","heroinp",1720,"Verarbeite Heroin",false]};
	case "meth": {["methu","methp",5000,"Koche Meth",false]};
	case "frog": {["frogu","frogp",5000,"Verarbeite Froesche",false]};
	case "gold": {["goldu","goldp",3000,"Schmelze Gold",false]};
	case "cement": {["rock","cement",350,"Mische Zement",false]};
	case "muschel": {["muschelu","muschelp",1500,"Öffne Muscheln",false]};
	case "pils": {["pilsu","pilsp",1500,"Bier brauen",false]};
	case "uran": {["brennstabu","brennstabp",2500,"Verarbeite Brennstäbe",false]};
	case "krokodile": {["cocainep","krokodile",3000,"Verarbeite Krokodile",true,"heroinp"]}; // of processing with 2 Items param 5 = name of the secound Item
	case "atomwaffe": {["brennstabp","atomwaffe",3000,"Uran Munition herstellen",true,"iron_r"]}; // of processing with 2 Items param 5 = name of the secound Item
	case "schmuck": {["diamondc","schmuck",3000,"Verarbeite Schmuck",true,"goldp"]}; // of processing with 2 Items param 5 = name of the secound Item
	case "badcocaine": {["cocainep","badcocaine",3000,"Strecke Kokain",true,"salt_r"]}; // of processing with 2 Items param 5 = name of the secound Item
	default {[];};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_2var = _itemInfo select 4;  // true if process action is with 2 Items and false if processing with 1 Item.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

//2vars
if(_2var) then { _oldItem2 = _itemInfo select 5; }; //set Itemname if (processing with 2 Items = true) 

_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

//2vars
if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle); }; //calculate the amount of the second Item (for example Iron)

if(_2var) then { 
       if(_oldVal !=_oldVal2) then {
              _error = true; // True if amount of Item1 =! amount of Item 2 to prevent processing 20 FuelF with 20x oilp  and 1x iron_r)
       };
};
if(_error) exitWith{hint "Benutze die gleichen Mengen"};

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
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
		if(player distance _vendor > 10) exitWith {hint "Du musst innerhalb von 10m stehen um zu Verarbeiten."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
//2vars
if(_2var) then 
{
([false,_oldItem2,_oldVal2] call life_fnc_handleInv); //delete the second items (for example Iron)
};
if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
5 cutText ["","PLAIN"];
titleText[format["Du hast %1 %2 hergestellt.",_oldVal,_itemName],"PLAIN"];
life_is_processing = false;
}
	else
{
	if(life_6cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	//2vars
	if(_2var) then 
	{
	([false,_oldItem2,_oldVal2] call life_fnc_handleInv); //delete the second items (for example Iron)
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_6cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_6cash = life_6cash - _cost;
	life_is_processing = false;
};
//add this at bottom of this file
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];