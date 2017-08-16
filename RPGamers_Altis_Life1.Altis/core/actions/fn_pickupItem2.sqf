#include "..\..\script_macros.hpp"
#define INUSE(ENTITY) ENTITY setVariable ["inUse",false,true]
/*
    File: fn_pickupItem.sqf
    
    
    Description:
    Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff","_duped"];

if ((time - life_action_delay) < 2) exitWith {[localize "STR_NOTF_ActionDelay",5,"gray"] call RPG_Fnc_Msg; INUSE(_this);};

if (isNull (findDisplay 1520)) then { 
    _obj = life_cursorTarget; 
}
else
{
    _obj = objNull;
    if ((lbCurSel 1521) > -1) then
    {
        _obj = life_pickup_item_array select (lbCurSel 1521);
    };
};

if(isNil "_obj" OR isNull _obj OR isPlayer _obj) exitWith {};
_itemInfo = _obj getVariable ["item",[]];

if((_itemInfo select 0) isEqualTo "money") exitWith { 
    [_obj,player,true] remoteExecCall ["TON_fnc_pickupAction",RSERV]; 
};

_lockedGold = false;
if((_itemInfo select 0) isEqualTo "goldbar") then
{
    _safe = nearestObject [_obj, "Land_Research_house_V1_F"];
    if(isNull _safe) then { 
        _safe = nearestObject [_obj, "Land_Research_HQ_F"]; 
    };
    if(!isNull _safe) then
    {
        if((_obj distance _safe) < 15 && (_safe getVariable["life_locked",1]) isEqualTo 1) then { 
            _lockedGold = true; 
        };
    };
};
if (_lockedGold_lockedGold) exitWith {
    ["This gold bar belongs to a safe which is still locked!",5,"gray"] call RPG_Fnc_Msg;
};

_itemInfo = _obj getVariable ["item",[]]; if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _obj;};
_illegal = ITEM_ILLEGAL(_itemInfo select 0);
_itemName = ITEM_NAME(_itemInfo select 0);
if (isLocalized _itemName) then {
    _itemName = (localize _itemName);
};

if(playerSide isEqualTo west && _illegal != -1) exitWith
{
    [format [localize "STR_NOTF_PickedEvidence",_itemName],5,"blue"] call RPG_Fnc_Msg;
    [format [localize "STR_NOTF_PickedEvidence1",[round(ITEM_SELLPRICE(_itemInfo select 0) / 2)] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
    BANK = BANK + round(ITEM_SELLPRICE(_itemInfo select 0) / 2);
    deleteVehicle _obj;
    life_action_delay = time;
};
life_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {
    {[localize "STR_NOTF_InvFull",5,"gray"] call RPG_Fnc_Msg; INUSE(_obj);};
};
if(_diff != _itemInfo select 1) then
{
    if(([true,_itemInfo select 0,_diff] call life_fnc_handleInv)) then
    {
        player playmove "AinvPknlMstpSlayWrflDnon";
        uiSleep 0.5;
        _obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
        [format ["Picked %1 %2",_diff,_itemName],5,"blue"] call RPG_Fnc_Msg;
        INUSE(_obj);
    } else {
        INUSE(_obj);
    };
}
else
{
    if(([true,_itemInfo select 0,_itemInfo select 1] call life_fnc_handleInv)) then
    {
        deleteVehicle _obj;
        player playmove "AinvPknlMstpSlayWrflDnon";
        [format ["Picked %1 %2",_diff,_itemName],5,"blue"] call RPG_Fnc_Msg;
    } else {
        INUSE(_obj);
    };
};