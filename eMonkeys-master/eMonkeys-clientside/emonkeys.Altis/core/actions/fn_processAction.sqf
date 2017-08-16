/*
File: fn_processAction.sqf
Author: Bryan "Tonic" Boardwine
edited by theInfinit (to process 2 Item to a combination)
Description:
Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_newItemNr","_cost","_upp","_hasLicense","_itemName1","_itemName2","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error","_ran","_fail"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

_error = false; // used below check the comment there ;) 
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ...",processing 2Items?, (only for processing with 2) second Item.
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","",1200,"raffiniere Erdöl","oilp","",1];};
	case "diamond": {["diamond","",1350,"schleife Diamanten","diamondc","",1]};
	case "heroin": {["heroinu","",2100,"veredle Heroin","heroinp","",1]};
	case "copper": {["copperore","",750,"veredle Kupfer","copper_r","",1]};
	case "iron": {["ironore","",1120,"veredle Eisen","iron_r","",1]};
	case "sand": {["sand","",650,"siebe Sand","glass","",1]};
	case "glassbottle":{["glass","",650,"fülle Flaschen","bottles","",1]};
	case "salt": {["salt","",450,"siebe Salz","salt_r","",1]};
	case "cocaine": {["cocaine","",1500,"veredle Kokain","cocainep","",1]};
	case "marijuana": {["cannabis","",500,"veredle Marijuana","marijuana","",1]};
	case "heroin": {["heroinu","",1720,"veredle Heroin","heroinp","",1]};
	case "cement": {["rock","",350,"mische Zement","cement","",1]};
	case "mash": {["water","cornmeal",100,"produziere Wermut","mash","",1]};
	case "whiskey": {["yeast","rye",1000,"gäre Whiskey","whiskey","",1]};
	case "silver": {["silver","",1050,"schmelze Silber","silverr","",1]};
	case "beer": {["yeast","hops",1500,"braue Bier","beerp","",1]};
	case "moonshine": {["yeast","mash",250,"brenne Absinth","moonshine","",1]};
	case "bottledshine": {["moonshine","bottles",500,"fülle Absinth ab","bottledshine","",1]};
	case "bottledbeer": {["beerp","bottles",500,"fülle Bier ab","bottledbeer","",1]};
	case "bottledwhiskey": {["whiskey","bottles",500,"fülle Whiskey ab","bottledwhiskey","",1]};
	case "bretter": {["holz","",750,"Verarbeite Holz","bretter","",1];};
	case "unv_leder": {["felle","",750,"Verarbeite Felle","unv_leder","",1];};
	case "faser": {["baumwolle","",750,"Verarbeite baumwolle","faser","",1];};
	case "titaneisen": {["titanore","ironore",1500,"Verarbeite Titanerz","titaneisen","",1];};
	case "tobacco": {["tabak","",1500,"Verarbeite Tabak","feinschnitt","",1];};
	case "diesel_gs": {["seawater","oilp",1500,"raffiniere zu gestreckten Diesel","diesel_gestreckt","",2];};
	case "diesel": {["oilp","",1500,"raffiniere zu Diesel","diesel","",1];};
	case "rape": {["raps","",1500,"Verarbeite Raps","biodiesel","",1];};
	case "super": {["oilp","",1500,"raffiniere zu Super","super","",1];};
	case "rape2": {["raps","oilp",1500,"raffiniere zu Superplus","superplus","",2];};
	
	//Edelstein System
	case "edelstein1": {["beryll","bernstein",1500,"Verarbeite Beryll und Bernstein","aquamarin","koenigsbernstein",1];};
	case "edelstein2": {["nephrit","opal",1500,"Verarbeite Nephrit und Opal","jade","zwielichtopal",1];};
	case "edelstein3": {["peridot","zirkon",1500,"Verarbeite Peridot und Zirkon","tiefenperidot","fuerstenzirkon",1];};
	case "edelstein4": {["saphir","smaragd",1500,"Verarbeite Saphir und Smaragd","himmelssaphir","traumsmaragd",1];};
	case "edelstein5": {["blutstein","",1500,"Verarbeite Blutstein","blutdiamant","",1];};
	case "edelstein6": {["fossilgestein","craftingtool_01",1500,"Verarbeite Fossilgestein","rfossilgestein","",1];};
	case "edelstein7": {["quarz","craftingtool_01",1500,"Verarbeite Quarz","rquarz","",1];};
	default {[]};
};
_noliz = ["holz","felle","baumwolle","titanore","tabak","seawater","raps","oilp","beryll","nephrit","peridot","saphir","blutstein","fossilgestein","quarz"];

//Error checking
if(count _itemInfo == 0) exitWith {};

_oldItem1 = _itemInfo select 0;
_oldItem2 = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_newItem1 = _itemInfo select 4;
_newItem2 = _itemInfo select 5;
_newItemNr = _itemInfo select 6;
_fail = false;

//Lizenz checking
if (!(_oldItem1 in _noliz)) then
{
	_hasLicense = missionNamespace getVariable (([_type,0] call EMonkeys_fnc_licenseType) select 0);
}
else
{
	_hasLicense = true;
};

_itemName1 = [([_newItem1,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;
_oldVal1 = missionNamespace getVariable ([_oldItem1,0] call EMonkeys_fnc_varHandle);
if(_oldItem2 != "") then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call EMonkeys_fnc_varHandle); };
if(_newItem2 != "") then { _itemName2 = [([_newItem2,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr; };

if(_oldItem2 != "") then { 
       if(_oldVal1 !=_oldVal2) then {
              _error = true; // True if amount of Item1 =! amount of Item 2 to prevent processing 20 FuelF with 20x oilp  and 1x iron_r)
       };
};
if(_error) exitWith{hint "Benutze bitte gleiche Mengen."};

_cost = _cost * _oldVal1;
//Some more checks
if(_oldVal1 == 0 || _itemName1 == "") exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

eM_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		uisleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Du musst in einem Radius von 10 Metern bleiben."; 5 cutText ["","PLAIN"]; eM_is_processing = false;};

	if(_oldItem2 != "") then 
	{
		([false,_oldItem2,_oldVal2] call EMonkeys_fnc_handleInv); //delete the second items (for example Iron)
	};
	if(!([false,_oldItem1,_oldVal1] call EMonkeys_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; eM_is_processing = false;};
	if(_newItem2 != "") then
	{
		if((!([true,_newItem1,(_oldVal1 * _newItemNr)] call EMonkeys_fnc_handleInv)) && (!([true,_newItem2,(_oldVal2 * _newItemNr)] call EMonkeys_fnc_handleInv))) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal1] call EMonkeys_fnc_handleInv; [true,_oldItem2,_oldVal2] call EMonkeys_fnc_handleInv; eM_is_processing = false;};
	}else{
		if(_newItem1 == "rquarz") then
		{
			_ran = random 2;
			switch (ceil _ran) do
			{
				case 0:{if(!([true,"obsidian",(_oldVal1 * _newItemNr)] call Emonkeys_fnc_handleInv)) then {_fail = true}; _itemName1 = [(["obsidian",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;};
				case 1:{if(!([true,"rubin",(_oldVal1 * _newItemNr)] call Emonkeys_fnc_handleInv)) then {_fail = true}; _itemName1 = [(["rubin",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;};
				case 2:{if(!([true,"tigerauge",(_oldVal1 * _newItemNr)] call Emonkeys_fnc_handleInv)) then {_fail = true}; _itemName1 = [(["tigerauge",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;};
			};
		};
		if(_newItem1 == "rfossilgestein") then
		{
			_ran = random 2;
			switch (ceil _ran) do
			{
				case 0:{if(!([true,"achat",(_oldVal1 * _newItemNr)] call Emonkeys_fnc_handleInv)) then {_fail = true}; _itemName1 = [(["achat",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;};
				case 1:{if(!([true,"amethyst",(_oldVal1 * _newItemNr)] call Emonkeys_fnc_handleInv)) then {_fail = true}; _itemName1 = [(["amethyst",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;};
				case 2:{if(!([true,"malachit",(_oldVal1 * _newItemNr)] call Emonkeys_fnc_handleInv)) then {_fail = true}; _itemName1 = [(["malachit",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;};
			};
		};
		if(!(_newItem1 in ["rquarz","rfossilgestein"])) then
		{
			if(!([true,_newItem1,(_oldVal1 * _newItemNr)] call EMonkeys_fnc_handleInv)) then {_fail = true};
		};
	};
	if(_fail) exitWith
	{
		5 cutText ["","PLAIN"];
		[true,_oldItem1,_oldVal1] call EMonkeys_fnc_handleInv;
		eM_is_processing = false;
	};
	
	5 cutText ["","PLAIN"];
	if(_newItem2 != "") then
	{
		titleText[format["Du hast %1 %2 & %3 %4 hergestellt.",(_oldVal1 * _newItemNr),_itemName1,(_oldVal2 * _newItemNr),_itemName2],"PLAIN"];
	}else{
		titleText[format["Du hast %1 %2 hergestellt.",(_newItemNr * _oldVal1),_itemName1],"PLAIN"];
	};
	//eM_leveladd = [_newItem,"veredelt"];
	eM_is_processing = false;
}
else
{
	if(EMonkeys_c164 < _cost) exitWith {hint format["Du brauchst %1€ um zu veredeln. Kaufe dir eine Lizenz.",[_cost] call EMonkeys_fnc_numberText]; 5 cutText ["","PLAIN"]; eM_is_processing = false;};

	while{true} do
	{
		uisleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Du musst in einem Radius von 10 Metern bleiben."; 5 cutText ["","PLAIN"]; eM_is_processing = false;};

	if(EMonkeys_c164 < _cost) exitWith {hint format["Du brauchst %1€ um zu veredeln. Kaufe dir eine Lizenz!",[_cost] call EMonkeys_fnc_numberText]; 5 cutText ["","PLAIN"]; eM_is_processing = false;};

	if(_oldItem2 != "") then 
	{
		([false,_oldItem2,_oldVal2] call EMonkeys_fnc_handleInv); //delete the second items (for example Iron)
	};
	if(!([false,_oldItem1,_oldVal1] call EMonkeys_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; eM_is_processing = false;};
	if(_newItem2 != "") then
	{
		if((!([true,_newItem1,(_oldVal1 * _newItemNr)] call EMonkeys_fnc_handleInv)) && (!([true,_newItem2,(_oldVal2 * _newItemNr)] call EMonkeys_fnc_handleInv))) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal1] call EMonkeys_fnc_handleInv; [true,_oldItem2,_oldVal2] call EMonkeys_fnc_handleInv; eM_is_processing = false;};
	}else{
		if(!([true,_newItem1,(_oldVal1 * _newItemNr)] call EMonkeys_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal1] call EMonkeys_fnc_handleInv;  eM_is_processing = false;};
	};
	5 cutText ["","PLAIN"];
	titleText[format["Du hast %1 in %2 für %3€",(_oldVal1 * _newItemNr),_itemName1,[_cost] call EMonkeys_fnc_numberText],"PLAIN"];
	//eM_leveladd = [_itemName,"veredelt"];
	EMonkeys_c164 = EMonkeys_c164 - _cost;
	eM_is_processing = false;
};