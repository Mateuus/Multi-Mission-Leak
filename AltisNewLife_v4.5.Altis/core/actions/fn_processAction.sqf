#include <macro.h>
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_licence","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
if(isNull _vendor OR _type == "" OR (player distance _vendor > 6)) exitWith {};
_error = false;
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",100,"Raffinage du pétrole",false];};
	case "diamond": {["diamond","diamondr",150,"Purification des diamants",false]};
	case "heroin": {["heroinu","heroinp",200,"Fabrication d'héroïne",false]};
	case "copper": {["copperore","copperr",50,"Fonte du cuivre",false]};
	case "iron": {["ironore","ironr",50,"Fonte du fer",false]};
	case "sand": {["sand","glass",50,"Traîtement du sable",false]};
	case "salt": {["salt","saltr",50,"Raffinage du Sel",false]};
	case "cocaine": {["coke","cokep",250,"Fabrication de cocaïne",false]};
    case "uranium1": {["uranium1","uranium2",500,"Nettoyage de l'Uranium",false]};
    case "uranium4": {["uranium4","uranium",500,"Sécher l'Uranium",false]};
	case "skull": {["skull","skullp",100,"Restauration d'une antiquité",false]};
	case "marijuana": {["cannabis","marijuana",150,"Fabrication de weed",false]};
	case "cement": {["rock","cement",50,"Mixage du ciment",false]};
	case "glass": {["glass","bottles",50,"Fabrication de bouteilles",false]};
    case "grapes": {["grapes","wine",50,"Fabrication de vin",false]};
	case "lingot": {["orr","lingotor",150,"Fonte de l'or",false]};
    case "tobacco": {["tobacco","cigarette",0,"Roulage de clope",false]};
	case "mash": {["water","mash",50,"Mixer les grains",true,"cornmeal",false]};
	case "whiskey": {["yeast","whiskey",100,"Fermentation du Whisky",true,"rye",false]};
	case "beer": {["yeast","beerp",100,"Brassage de la biere",true,"hops",false]};
	case "moonshine": {["yeast","moonshine",250,"Transformation en Moonshine",true,"mash"]};
	case "bottledshine": {["moonshine","bottledshine",250,"Bouteille de Moonshine",true,"bottles"]};
	case "bottledbeer": {["beerp","bottledbeer",250,"Bouteille de Biere",true,"bottles"]};
	case "bottledwhiskey": {["whiskey","bottledwhiskey",250,"Bouteille de Whisky",true,"bottles"]};
	case "platine": {["osmium","platinep",100,"Traitement de l'alliage",true,"palladium"]};
	case "uranium2": {["uranium2","uranium3",500,"Dissolution Uranium Militaire",true,"puranium"]};
	case "bijoux": {["lingotor","bijoux",1000,"Fabrication de bijoux de luxe",true,"diamondr"]};
	case "opium": {["fleur_opium","opium_Ndiluer",100,"Séparation de la bonne Sève",false]};
	case "opium2": {["opium_Ndiluer","opium",200,"Mélange des ingrédients",true,"eaudist"]};
	default {[]};
};
if(count _itemInfo == 0) exitWith {hint "Vous n'avez pas les objets necessaires !"};
_2var = _itemInfo select 4;
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
//2vars
if(_2var) then { _oldItem2 = _itemInfo select 5; };
switch (_type) do
{
    case "uranium1": {	if(liciv_uranium) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "uranium2": {	if(liciv_uranium) then { _hasLicense = true;} else { _hasLicense = false;};};	
    case "uranium4": {	if(liciv_uranium) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "mash": {	if(liciv_liquor) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "whiskey": {	if(liciv_stiller) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "beer": {	if(liciv_liquor) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "moonshine": {	if(liciv_liquor) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "bottledshine": {	if(liciv_bottler) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "bottledbeer": {	if(liciv_bottler) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "bottledwhiskey": {	if(liciv_bottler) then { _hasLicense = true;} else { _hasLicense = false;};};
	case "opium2": {	if(liciv_opium) then { _hasLicense = true;} else { _hasLicense = false;};};	
    case "tobacco": {_hasLicense = true;};
	default { _hasLicense = LICENSE_VALUE(_type,"civ"); };
};
_itemName = M_CONFIG(getText,"ANL_VItems",_newItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);

//2vars
if(_2var) then { 
_oldVal2 = ITEM_VALUE(_oldItem2);
};
if(_2var) then {
       if(_oldVal !=_oldVal2) then {
              _error = true;
       };
};
if(_error) exitWith{hint "Tu dois avoir le meme nombre de produits pour traiter"};
_cost = _cost * _oldVal;
if(_oldVal == 0) exitWith {};
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
		uiSleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Tu dois rester a 10 metres pour fabriquer."; 
	5 cutText ["","PLAIN"]; 
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	5 cutText ["","PLAIN"];
	if(_2var) then
		{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
		};
	titleText[format["Tu as fabriqué %1 %2",_oldVal,localize _itemName],"PLAIN"];
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
}
	else
{
	if(argent_liquide < _cost) exitWith {hint format["Tu as besoin de %1€ pour fabriquer sans licence !",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	while{true} do
	{
		uiSleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 6) exitWith {hint "Tu dois rester a moins de 6 metres pour fabriquer."};
	};
	if(player distance _vendor > 6) exitWith {hint "Tu dois rester a moins de 6 metres pour fabriquer."; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(argent_liquide < _cost) exitWith {hint format["Tu as besoin de %1€ pour fabriquer sans license !",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(_2var) then
	{
	([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
	};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	5 cutText ["","PLAIN"];
	titleText[format["Tu as fabriqué %1 en %2 pour la somme de %3€",_oldVal,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	argent_liquide = argent_liquide - _cost;
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};