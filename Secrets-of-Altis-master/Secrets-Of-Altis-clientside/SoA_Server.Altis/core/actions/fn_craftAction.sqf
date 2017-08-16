/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Modification: G00golplexian

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_veh","_handle"];
disableSerialization;

//vehicle check
if(isNull player OR !alive player) exitWith {};
if!(isNull objectParent player) exitWith {hint "Du kannst im Fahrzeug nichts herstellen!"};


_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_mengentext = _dialog displayCtrl 665;
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_menge = parsenumber(ctrlText _mengentext);
_weight = 0;
_matsNeed = 0;
_checklong = [_item,1] call life_fnc_varHandle;
if(!([str(_menge)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_menge <= 0) exitWith {hint "Fehlerhafte Mengenangabe!"};

_feuernear = (player distance nearestobject[player,"Land_Campfire_F"]);

//Orte
if(_itemFilter == "archo" && (player distance (getmarkerPos "antik_3")) > 30) exitWith {hint "Du bist außerhalb des Institut's für Archäologie."};
if(_checklong in ["stahl","aluminium"] && _feuernear > 5) exitWith {hint "Du benötigst eine Feuerstelle zum Herstellen."};

if(life_crafting) exitWith {hint "Du stellst gerade etwas her!"};
life_crafting = true;

_config = [_itemFilter] call life_fnc_craftCfg;
{

	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

			_str = [_matsNeed select _i] call life_fnc_varToStr;
			_matsNum = _matsNeed select _i+1;

			if((missionNamespace getVariable (_matsNeed select _i)) < (_matsNum * _menge)) exitWith {_allMaterial = false;};

		};
	};
} foreach (_config);

if(!_allMaterial) exitWith {hint "Du besitzt nicht alle nötigen Rohstoffe um die gewünschte Menge herzustellen!"; life_crafting = false;};

playsound "printer";

//Some checks
if((count _matsNeed) == 0) exitWith {life_crafting = false;};

if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint localize "STR_CRAFT_AR_Backpack";
 		life_crafting = false;		
};

if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint localize "STR_CRAFT_AR_Uniform";
 		life_crafting = false;
};

if(_itemFilter in ["werkzeuge","materials","elektro","spezial","archo"]) then {
	
	_weight = ([_item] call life_fnc_itemWeight);
	if((life_carryWeight + _weight) > life_maxWeight) exitWith {
		hint localize "STR_NOTF_NoRoom";
		life_crafting = false;
	};
};

playsound "printer";
_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter in ["werkzeuge","materials","elektro","spezial","archo"]) then
{
	_itemName = [_newItem] call life_fnc_varToStr;
};

if(_itemFilter in ["uniform","backpack"]) then 
{
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

if(_itemFilter == "fahrzeuge") then
{
	_itemInfo = [_newItem] call life_fnc_fetchVehInfo;
	_itemName = _itemInfo select 3;
};

_removeItemSuccess = true;
_invSize = count _oldItem;

for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

	_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
	if(!([false,_handledItem,(_oldItem select _i+1) * _menge] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutFadeout 1; life_crafting = false; hint "Fehler bei Druckvorgang..."};

life_is_processing = true;

_upp = format["Stelle %2x %1 her...",_itemName,_menge];
_cP = 0.01;
_sleep = switch(true) do {
	case (_menge >= 5): {1};
	case (_menge >= 10): {1.5}; 
	case (_menge >= 20): {2}; 
	case (_menge >= 30): {2.5};
	case (_itemFilter == "fahrzeuge"): {1};
	default{0.5};
};

//Setup our progress bar.
_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_crafting = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_crafting = false;};

if(_itemFilter == "backpack") then{
	if(backpack player == "") then{
		player addBackpack _newItem;
		[] call life_fnc_updateClothing;
	}else{
		hint localize "STR_CRAFT_AR_Backpack";
		life_is_processing = false;
 		life_crafting = false;		
	};
};

if(_itemFilter == "uniform") then 
{
	if(uniform player == "") then {
		player forceaddUniform _newItem;
		[] call life_fnc_updateClothing;
	}else{
		hint localize "STR_CRAFT_AR_Uniform";
		life_is_processing = false;
	};
};

if(_itemFilter in ["werkzeuge","materials","elektro","spezial","archo"]) then
{
	_handledItem = [_newItem,1] call life_fnc_varHandle;
	[true,_handledItem,_menge] call life_fnc_handleInv;
};

if(_itemFilter == "fahrzeuge") then
{
	[_newItem,0] spawn life_fnc_createVehicle; 
};

["Yeah!",format["Du hast %1 (%2x) erhalten!",_itemName,_menge],"#ff1000","#ffffff",4] call life_fnc_texttiles;
life_is_processing = false;
life_crafting = false;
life_exp = life_exp + round(random(150));
[] spawn life_fnc_exptolevel;

//Erfolge
if(!erfolg_herstellung && _handledItem in ["storagesmall","storagebig"]) then {erfolg_herstellung = true; ["erfolg_herstellung"] spawn life_fnc_erfolgerhalten; sleep 5;};
if(!erfolg_schneider && _itemFilter in ["uniform","backpack"]) then {erfolg_schneider = true; ["erfolg_schneider"] spawn life_fnc_erfolgerhalten; sleep 5;};
if(!erfolg_ingenieur && _itemFilter == "fahrzeuge") then {erfolg_ingenieur = true; ["erfolg_ingenieur"] spawn life_fnc_erfolgerhalten; sleep 5;};
if(!erfolg_pirat && _handledItem == "momphred") then {erfolg_pirat = true; ["erfolg_pirat"] spawn life_fnc_erfolgerhalten; sleep 5;};