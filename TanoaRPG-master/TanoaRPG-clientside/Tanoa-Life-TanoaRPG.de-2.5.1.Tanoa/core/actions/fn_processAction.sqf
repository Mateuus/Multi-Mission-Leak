/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//GET OUT OF YOU FUCKING VEHICLE !!!!!
if(vehicle player != player) exitWith {hint "Beweg deinen Arsch aus dem Fahrzeug"};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,"Öl wird raffiniert"];};
	case "diamond": {["diamond","diamondc",1350,"Diamant wird geschliffen"]};
	case "heroin": {["heroinu","heroinp",2100,"Heroin wird abgepackt"]};
	case "copper": {["copperore","copper_r",750,"Kupfer wird geformt"]};
	case "iron": {["ironore","iron_r",1120,"Eisen wird gegossen"]};
	case "sand": {["sand","glass",650,"Sand wird verarbeitet"]};
	case "salt": {["salt","salt_r",450,"Salz wird ausgesiebt"]};
	case "cocaine": {["cocaine","cocainep",1500,"Kokain wird verfeinert"]};
	case "marijuana": {["cannabis","marijuana",500,"Marijuana wird gedreht"]};
	case "heroin": {["heroinu","heroinp",1720,"Heroin wird verfeinert"]};
	case "cement": {["rock","cement",350,"Zement wird gemixt"]};
	case "grapes": {["grapes","wine",250,"Trauben werden zu Wein gepresst"]};
	case "moonshine": {["yeast","moonshine",250,"Moonshining",true,"mash"]};//new
	case "meth": {["methu","methp",5000,"Meth wird gekocht"]};
	case "bottledshine": {["moonshine","bottledshine",500,"Bootle Moonshine",true,"bottles"]};//new
	case "whiskey": {["yeast","whiskey",1000,"Whiskey wird fermentiert",true,"rye"]};//new
	case "beer": {["yeast","beerp",1500,"Bier wird gebraut",true,"hops"]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Bier wird abgefüllt",true,"bottles"]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Whiskey wird abgefüllt",true,"bottles"]};//new
	case "mash": {["water","mash",100,"Maische wird getrennt",true,"cornmeal"]};//new
    case "uranlegal": {["uran","brennstab",5000,"Brennstab wird gebaut"]}; // Add this
	case "uranillegal": {["uran","sprengstoff",5000,"Sprengstoff wird angereichert"]}; // Add this
	case "ielem": {["inelement","stelement",25000,"Elemente werden stabilisiert"]};
	
	
	case "wood1": {["woodlog","woodplank",25000,"Holz wird gesägt..."]};
	case "wood2": {["woodplank","woodfurniture",25000,"Möbel werden hergestellt..."]};
	case "sugar": {["sugarraw","sugarprocessed",25000,"Zucker wird verarbeitet..."]};
	case "water1": {["waterspring","waterclean",25000,"Wasser wird mineralisiert und gereingt..."]};
	case "water2": {["waterclean","waterbottle",25000,"Wasser wird abgefüllt..."]};
	case "gold": {["goldore","goldcoins",25000,"Gold wird geschmolzen..."]};
	case "oilrefine": {["oilraw","oilrefined",25000,"Öl wird raffiniert..."]};
	case "oilheat": {["oilrefined","oilheat",25000,"Heizöl wird hergestellt..."]};
	case "oildiesel": {["oilrefined","oildiesel",25000,"Diesel wird hergestellt..."]};
	case "oilkerosin": {["oilrefined","oilkerosin",25000,"Kerosin wird hergestellt..."]};
	case "hmfirst": {["hmherbs","hmfiltrated",25000,"HunterMaster wird hergestellt..."]};
	case "hmbottle": {["hmfiltrated","hmbottled",25000,"HunterMaster wird hergestellt..."]};
	case "hmillegal": {["hmfiltrated","hmillegal",25000,"HunterMaster wird geschmuggelt..."]};
	case "coffee": {["coffeebeans","coffee1",25000,"Kaffee wird gemahlen..."]};
	case "energydrink": {["coffeebeans","energydrink",25000,"EnergyDrink hergestellt..."]};
	case "angelstrumpet": {["angelstrumpetu","angelstrumpetp",25000,"Engelstrompete wird verarbeitet..."]};
	case "crack": {["cocainep","crack",25000,"Crack wird hergestellt..."]};
	


	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(missionNamespace getVariable (([_type,0] call tanoarpg_fnc_licenseType) select 0)) then {
	_hasLicense = true;
} else {
	_hasLicense = false;
};

_itemName = [([_newItem,0] call tanoarpg_fnc_varHandle)] call tanoarpg_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call tanoarpg_fnc_varHandle);

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

//if(_hasLicense) then

if(true) then
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
	
	if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call tanoarpg_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["You have processed %1 into %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	/*
	
	if(life_cash < _cost) exitWith {hint format["You need $%1 to process without a license!",[_cost] call tanoarpg_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["You need $%1 to process  without a license!",[_cost] call tanoarpg_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call tanoarpg_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["You have processed %1 into %2 for $%3",_oldVal,_itemName,[_cost] call tanoarpg_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	*/
	
	life_is_processing = false;
};	