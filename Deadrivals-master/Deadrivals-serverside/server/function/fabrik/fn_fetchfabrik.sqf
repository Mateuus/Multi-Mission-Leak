private["_mode","_query","_fabrikdata","_ownerID"]; 
_mode = [_this,0,-1,[0]] call BIS_fnc_param; 
_ownerID = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,2,"",[""]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
_fabrikdata = format["SELECT inventory, inventory_weight, owned FROM fabrik WHERE playerid = '%1'",_uid]; 
_fabrikdata = [_fabrikdata,2] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_FABRIK = _fabrikdata; 
_ownerID publicVariableClient "NOCRIS_FABRIK";