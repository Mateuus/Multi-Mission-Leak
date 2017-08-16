/*
    File: fn_processActionDual.sqf
    Author: Bryan "Tonic" Boardwine
    Script by Tonic Edit by Nark0t1k
    Description:
    Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem1","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal1","_oldval2","_ui","_progress","_pgText","_cP","_speed"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
_speed = "medium";
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
if ((_type == "uranium2") && (life_inv_puranium == 0)) exitWith {hint "Sie haben kein Produkt um das Uran zu lösen.";};

//GET OUT OF YOU FUCKING VEHICLE !!!!!
if(vehicle player != player) exitWith {hint "Beweg deinen Arsch aus dem Fahrzeug"};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing (percent) ..."
_itemInfo = switch (_type) do
{
    //case "uranium2": {["uranium2","puranium","uranium3",6000,"Aufgelöstes Legales Uran"];};
    //case "uranium2b": {["uranium2","ipuranium","uranium3",6000,"Aufgelöstes Illegales Uran"];};
    default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem1 = _itemInfo select 0;
_oldItem2 = _itemInfo select 1;
_newItem = _itemInfo select 2;
_cost = _itemInfo select 3;
_upp = _itemInfo select 4;
_hasLicense = missionNamespace getVariable (([_type,0] call tanoarpg_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call tanoarpg_fnc_varHandle)] call tanoarpg_fnc_varToStr;
_oldVal1 = missionNamespace getVariable ([_oldItem1,0] call tanoarpg_fnc_varHandle);
_oldVal2 = missionNamespace getVariable ([_oldItem2,0] call tanoarpg_fnc_varHandle);

if(_oldVal1 <= _oldVal2) then
{
_oldVal = _oldVal1;
}
else
{
_oldVal = _oldVal2;
};

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
        sleep 0.25;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if(_cP >= 1) exitWith {};
        if(player distance _vendor > 10) exitWith {};
    };
    if(player distance _vendor > 10) exitWith {hint "Du mussst mindesten 10 Meter daneben stehen."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([false,_oldItem1,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([false,_oldItem2,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([true,_newItem,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal] call tanoarpg_fnc_handleInv; [true,_oldItem2,_oldVal] call tanoarpg_fnc_handleInv; life_is_processing = false;};
    5 cutText ["","PLAIN"];
    titleText[format["Sie haben %1 %2",_oldVal,_itemName],"PLAIN"];
    life_is_processing = false;
}
    else
{

    if(life_cash < _cost) exitWith {hint format["Du benötigst $%1 für eine Lizenz",[_cost] call tanoarpg_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    
    while{true} do
    {
        sleep 0.5;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if(_cP >= 1) exitWith {};
        if(player distance _vendor > 10) exitWith {};
    };
    if(player distance _vendor > 10) exitWith {hint "Du mussst mindesten 10 Meter daneben stehen."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(life_cash < _cost) exitWith {hint format["Du benötigst $%1 für eine Lizenz",[_cost] call tanoarpg_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([false,_oldItem1,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([false,_oldItem2,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([true,_newItem,_oldVal] call tanoarpg_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal] call tanoarpg_fnc_handleInv; [true,_oldItem2,_oldVal] call tanoarpg_fnc_handleInv; life_is_processing = false;};
    5 cutText ["","PLAIN"];
    titleText[format["Du hast %1 zu %2 umgewandelt und erhälst $%3",_oldVal,_itemName,[_cost] call tanoarpg_fnc_numberText],"PLAIN"];
    life_cash = life_cash - _cost;
    life_is_processing = false;
}; 