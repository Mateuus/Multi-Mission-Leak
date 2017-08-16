#include "..\..\script_macros.hpp"
/*
    File: fn_adminInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Output information received to admin menu.
*/
private["_ret","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_steamName","_secondary"];
_ret = _this;
disableSerialization;

_unit = _ret select 3;
_prim = if (!(primaryWeapon _unit isEqualTo "")) then { FETCH_CONFIG2(getText,"CfgWeapons",primaryWeapon _unit,"displayName")} else {"None"};
_sec = if (!(handgunWeapon _unit isEqualTo "")) then { FETCH_CONFIG2(getText,"CfgWeapons",handgunWeapon _unit,"displayName")} else {"None"};
_vest = if (!(vest _unit isEqualTo "")) then { FETCH_CONFIG2(getText,"CfgWeapons",vest _unit,"displayName")} else {"None"};
_uni = if (!(uniform _unit isEqualTo "")) then { FETCH_CONFIG2(getText,"CfgWeapons",uniform _unit,"displayName")} else {"None"};
_bp = if (!(backpack _unit isEqualTo "")) then {FETCH_CONFIG2(getText,"CfgVehicles",backpack _unit,"displayName")} else {"None"};

_attach = [];
_secondary = [];
if (!(primaryWeapon _unit isEqualTo "")) then {
    {
        if (!(_x isEqualTo "")) then {
            _attach pushBack (FETCH_CONFIG2(getText,"CfgWeapons",_x,"displayName"));
        };
    } forEach (primaryWeaponItems _unit);
};

if (!(handgunItems _unit isEqualTo "")) then {
    {
        if (!(_x isEqualTo "")) then {
            _secondary pushBack (FETCH_CONFIG2(getText,"CfgWeapons",_x,"displayName"));
        };
    } forEach (handgunItems _unit);
};

_steamName = _ret select 4;
if (!((_ret select 4) isEqualType "")) then {
    _steamName = "Not a Steam User!";
};

if (count _attach isEqualTo 0) then {_attach = "None"};
if (count _secondary isEqualTo 0) then {_secondary = "None"};
_launcher = if (!(secondaryWeapon _unit isEqualTo "")) then { FETCH_CONFIG2(getText,"CfgWeapons",secondaryWeapon _unit,"displayName")} else {"None"};

if (side _unit == west) then {
CONTROL(2900,2903) ctrlSetStructuredText parseText format["<t size='.7'>Name: %1<br/>Steam Name: %10<br/>Player UID: %11<br/>Player Side: %12<br/>Cop Rank: %15 | Swat Rank: %16 | Army Rank: %17<br/><br/>Bank: %2<br/>Money: %3<br/><br/>Uniform: %4<br/>Vest: %5<br/>Backpack: %6<br/><br/>Primary: %7<br/><t align='center'>Primary Attachments</t><br/>%9<br/><br/>Launcher: %14<br/><br/>Handgun: %8<br/><t align='center'>Secondary Attachments</t><br/>%13<br/></t>",
_unit getVariable ["realname",name _unit],[(_ret select 0)] call life_fnc_numberText,[(_ret select 1)] call life_fnc_numberText, _uni,_vest,_bp,_prim,_sec,_attach,_steamName,(_ret select 5),(_ret select 6),_secondary,_launcher,_unit getVariable "rank",_unit getVariable "swatrank",_unit getVariable "dearank"];
};

if (side _unit == independent) then {
CONTROL(2900,2903) ctrlSetStructuredText parseText format["<t size='.7'>Name: %1<br/>Steam Name: %10<br/>Player UID: %11<br/>Player Side: %12<br/>Medic Rank: %15<br/><br/>Bank: %2<br/>Money: %3<br/><br/>Uniform: %4<br/>Vest: %5<br/>Backpack: %6<br/><br/>Primary: %7<br/><t align='center'>Primary Attachments</t><br/>%9<br/><br/>Launcher: %14<br/><br/>Handgun: %8<br/><t align='center'>Secondary Attachments</t><br/>%13<br/></t>",
_unit getVariable ["realname",name _unit],[(_ret select 0)] call life_fnc_numberText,[(_ret select 1)] call life_fnc_numberText, _uni,_vest,_bp,_prim,_sec,_attach,_steamName,(_ret select 5),(_ret select 6),_secondary,_launcher,_unit getVariable "medicrank"];
};

if (side _unit == civilian) then {
CONTROL(2900,2903) ctrlSetStructuredText parseText format["<t size='.7'>Name: %1<br/>Steam Name: %10<br/>Player UID: %11<br/>Player Side: %12<br/><br/>Bank: %2<br/>Money: %3<br/><br/>Uniform: %4<br/>Vest: %5<br/>Backpack: %6<br/><br/>Primary: %7<br/><t align='center'>Primary Attachments</t><br/>%9<br/><br/>Launcher: %14<br/><br/>Handgun: %8<br/><t align='center'>Secondary Attachments</t><br/>%13<br/></t>",
_unit getVariable ["realname",name _unit],[(_ret select 0)] call life_fnc_numberText,[(_ret select 1)] call life_fnc_numberText, _uni,_vest,_bp,_prim,_sec,_attach,_steamName,(_ret select 5),(_ret select 6),_secondary,_launcher];
};