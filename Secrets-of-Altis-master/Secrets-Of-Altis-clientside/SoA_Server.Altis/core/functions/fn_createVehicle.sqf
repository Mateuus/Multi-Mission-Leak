private["_classname","_color","_text","_vehicleInfo","_vehicle"];
disableSerialization;

_classname = _this select 0;
_color = _this select 1;

10 cutRsc ["life_popup", "PLAIN", 0.5, false];
playsound "gegenstand";

_vehicleInfo = [_classname] call life_fnc_fetchVehInfo;
_colorVehicle = [(_vehicleInfo select 0),_color] call life_fnc_vehicleColorStr;
_text = format["(%1)",_colorVehicle];
if(_text == "()") then {_text = ""};

_ui = uiNameSpace getVariable "life_popup";
_name = _ui displayCtrl 6101;
_pic = _ui displayCtrl 6102;
_template = _ui displayCtrl 6103;
_name ctrlSetText format["%1 %2",(_vehicleInfo select 3),_text];
_pic ctrlSetText format["%1",(_vehicleInfo select 2)];
_template ctrlSetText "images\hud\gegenstanderhalten.paa";

VehCreated = false;
_vehicle = _classname createvehicle (getMarkerPos "temp");
WaitUntil{!IsNil "_vehicle"};
[_vehicle,_color] remoteExec ["life_fnc_colorVehicle",2];
_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
[(getPlayerUID player),playerSide,_vehicle,_color,player] remoteExecCall ["SOA_fnc_vehicleCreate",2];
WaitUntil{VehCreated};
[_vehicle,false,player,0,1] remoteExecCall ["SOA_fnc_vehicleStore",2];