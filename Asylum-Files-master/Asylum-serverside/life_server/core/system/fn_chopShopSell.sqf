 
 
 
 
 
 
 
private["_unit","_vehicle","_price","_player"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_price = [_this,2,500,[0]] call BIS_fnc_param; 
 
 
if (isNull _vehicle OR isNull _unit) exitWith {}; 
if (_vehicle getVariable ["CHOPPED", false]) exitWith {}; 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 
_player = _unit; 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo > 0) then { 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
_side = _dbInfo select 4; 
 
_vehicle setVariable ["insured", false, true]; 
[_plate,_uid] call DB_fnc_deleteVehicle; 
}; 
if (count _dbInfo == 0) exitWith {}; 
 
if ((typeOf _vehicle) in life_chopVehicle) then { _price = _price * 1.1 }; 
 
_vehicle setVariable ["CHOPPED", true]; 
deleteVehicle _vehicle; 
[["cash","add",_price],"life_fnc_uC",_unit,false] spawn life_fnc_MP; 
_message = if ((typeOf _vehicle) in life_chopVehicle) then 
{ 
format["You have chopped a %1 for $%2, having received a 10% bonus for being a sought after vehicle.",_displayName,[_price] call life_fnc_numberText] 
} 
else { 
format["You have chopped a %1 for $%2",_displayName,[_price] call life_fnc_numberText] 
}; 
 
[[2,_message],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
 
[109, _player, format["%1 chopped %2 for %3", name _player, typeOf _vehicle, _price]] spawn ASY_fnc_logIt;