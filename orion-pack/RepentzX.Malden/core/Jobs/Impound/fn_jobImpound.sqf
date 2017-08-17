//Fn_ImpoundJob.sqf
#include "..\..\script_macros.hpp"
_ImpoundObject = (getpos player) nearestObject "Car_F";
_JobVeh = getText(missionconfigfile >> "ADT_Jobs" >> "TowTruck" >> "JobVehicle");
systemChat format ["%1 ---- %2 ---- %3",typeof _ImpoundObject,player distance _ImpoundObject,count crew _ImpoundObject];
if(typeOf _ImpoundObject == _JobVeh)exitWith{["Error", ["Jobs", "You cant Impound your JobVehicle"]] call ADTN_fnc_TemplateNotification};
if(player distance _ImpoundObject > 10)exitWith{["Error", ["Jobs", "You are too far away from the vehicle"]] call ADTN_fnc_TemplateNotification};
if(count crew _ImpoundObject > 0)exitWith{["Error", ["Jobs", "There is someone in the vehicle you are trying to impound"]] call ADTN_fnc_TemplateNotification};
if(player getVariable ["ADT_TowTruckSleep",false])exitwith{["Error", ["Jobs", "You have recently impounded a vehicle."]] call ADTN_fnc_TemplateNotification};
if (_ImpoundObject getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};
player setVariable ["ADT_TowTruckSleep",true,true];
_ImpoundObjectData = _ImpoundObject getVariable ["vehicle_info_owners",[]];
if (_ImpoundObjectData isEqualTo 0) exitWith {deleteVehicle _ImpoundObject}; //Bad vehicle.
_ImpoundObjectName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _ImpoundObject),"displayName");
_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _ImpoundObject),"price");
[0,"Your vehicle is being impounded.",false,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
life_action_inUse = true;

_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep 0.09;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (player distance _ImpoundObject > 10) exitWith {};
    if (!alive player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];

if (player distance _ImpoundObject > 10) exitWith {[localize "STR_NOTF_ImpoundingCancelled",true,"slow"] call life_fnc_notificationSystem; life_action_inUse = false;};
if (!alive player) exitWith {life_action_inUse = false;};
if(!(count crew _ImpoundObject > 0))then{
    _displayName = getText(configFile >> "CfgVehicles" >> (typeof _ImpoundObject) >> "displayName");

    life_impound_inuse = true;
    [_ImpoundObject,true,player] remoteExec ["TON_fnc_vehicleStore",2];
    waitUntil {!life_impound_inuse};
        _price = getNumber(missionConfigFile >> "ADT_Jobs" >> "TowTruck" >> "ExtraPerJob");
        [0,"STR_NOTF_HasImpounded",true,[profileName,((_ImpoundObjectData select 0) select 1),_ImpoundObjectName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        if (_ImpoundObject in life_vehicles) then {
           hint format [localize "STR_NOTF_OwnImpounded",[_price] call life_fnc_numberText,_displayName];
            civRDMed = civRDMed - _price;
        } else {
            hint format [localize "STR_NOTF_Impounded",_displayName,[_price] call life_fnc_numberText];
            civRDMed = civRDMed + _price;
        };
        if (civRDMed < 0) then {civRDMed = 0;};
        [1] call SOCK_fnc_updatePartial;

} else {
    [localize "STR_NOTF_ImpoundingCancelled",true,"slow"] call life_fnc_notificationSystem;
};


/*
if (count crew _ImpoundObject isEqualTo 0) then {
    _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _ImpoundObject),"displayName");
    _type = getText(configFile >> "CfgVehicles" >> (typeof _ImpoundObject) >> "displayname");
    life_impound_inuse = true;

    if (life_HC_isActive) then {
        [_ImpoundObject,true,player] remoteExec ["HC_fnc_ImpoundObjectStore",HC_Life];
    } else {
        [_ImpoundObject,true,player] remoteExec ["TON_fnc_ImpoundObjectStore",RSERV];
    };

    waitUntil {!life_impound_inuse};
    	_price = getNumber(missionConfigFile >> "ADT_Jobs" >> "TowTruck" >> "ExtraPerJob");
        [0,"STR_NOTF_HasImpounded",true,[profileName,((_ImpoundObjectData select 0) select 1),_ImpoundObjectName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        if (_ImpoundObject in life_ImpoundObjects) then {
           hint format [localize "STR_NOTF_OwnImpounded",[_value] call life_fnc_numberText,_type];
            civRDMed = civRDMed - _value;
        } else {
           	hint format [localize "STR_NOTF_Impounded",_type,[_value] call life_fnc_numberText];
            civRDMed = civRDMed + _value;
        };
        if (civRDMed < 0) then {civRDMed = 0;};
        [1] call SOCK_fnc_updatePartial;

} else {
    [localize "STR_NOTF_ImpoundingCancelled",true,"slow"] call life_fnc_notificationSystem;
};


*/
life_action_inUse = false;
_timeBetween = getNumber(missionconfigfile >> "ADT_Jobs" >> "TowTruck" >> "TimeBetween");
sleep _timeBetween;
player setVariable ["ADT_TowTruckSleep",false,true];
