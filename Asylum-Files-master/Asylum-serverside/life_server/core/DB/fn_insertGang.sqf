 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_name", "_buildingID", "_query", "_sql", "_group"]; 
 
_name = [_this,0,"",[""]] call BIS_fnc_param; 
_house = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_unit = [_this,2,objNull,[objNull]] call BIS_fnc_param; 
 
_buildingID = [_house] call life_fnc_getBuildID; 
 
_safeName = [_name, "\", ""] call KRON_Replace; 
_safeName = [_safeName, "'", ""] call KRON_Replace; 
_safeName = [_safeName, """", ""] call KRON_Replace; 
 
_query = format["SELECT `id` FROM gangs WHERE `name`=""%1""", _safeName]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(!isNil {((_result select 0) select 0)}) exitWith { [[1,"There is already an existing gang using the name which you provided."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; }; 
 
life_server_gangs set [count life_server_gangs, [_buildingID,_safeName,[],2,2,0,1]]; 
 
_query = format["INSERT INTO `asylumlife%3`.`gangs` (`id`, `name`) VALUES ('%1', '%2') ON DUPLICATE KEY UPDATE `name`='%2'", _buildingID, _safeName, life_server_instance]; 
[_query] call DB_fnc_asyncQuery; 
 
_house setVariable ["gangHouse", _buildingID, true]; 
 
[[_buildingID, 1, _name, true],"life_fnc_addToGang",_unit,false] spawn life_fnc_MP;