#include <macro.h>
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
_itemInfo = switch (_type) do
{
    case "uranium3": {["uranium3","uranium4",10000,"Separation de l'Uranium militaire"]};
    default {[]};
};
if(count _itemInfo == 0) exitWith {};
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
//_hasLicense = GVAR_MNS (([_type,0] call life_fnc_licenseType) select 0);
//_hasLicense = LICENSE_VALUE(_type,"civ");
if(liciv_uranium) then { _hasLicense = true;} else { _hasLicense = false;};
_itemName = M_CONFIG(getText,"ANL_VItems",_newItem,"displayName");
_oldVal = 1;
_cost = _cost * _oldVal;
if(_oldVal == 0) exitWith {};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace GVAR "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
life_is_processing = true;
if(_hasLicense) then
{
    titleText["Il est difficile de traiter ce produit tu dois le faire un par un !","PLAIN"];
    while{true} do
    {
        uiSleep 0.05;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if(_cP >= 1) exitWith {};
        if(player distance _vendor > 10) exitWith {};
    };
    if(player distance _vendor > 10) exitWith {hint "Tu dois rester dans les 10 mètres."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
    5 cutText ["","PLAIN"];
    titleText[format["Tu as obtenu %1 %2",_oldVal,localize _itemName],"PLAIN"];
    life_is_processing = false;
}
    else
{
    hint "Tu ne peux pas traiter se produit sans license.";
    life_is_processing = false;
};    