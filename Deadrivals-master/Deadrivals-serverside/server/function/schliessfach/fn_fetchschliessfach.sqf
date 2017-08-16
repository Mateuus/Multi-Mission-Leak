private["_mode","_query","_schliessfachdata"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_ownerID = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerID = owner _ownerID; 
 
_schliessfachdata = format["SELECT inventory, inventory_weight, inventory_maxweight, upgrade_safe, owned FROM schliessfach WHERE playerid = '%1'",_uid]; 
_schliessfachdata = [_schliessfachdata,2] call SERVERDATABASE_fnc_asyncCall; 
 
if(count _schliessfachdata == 0) exitWith { 
NOCRIS_SCHLIESSFACH_CFG = "keinecfg"; 
_ownerID publicVariableClient "NOCRIS_SCHLIESSFACH_CFG"; 
}; 
 
NOCRIS_SCHLIESSFACH_CFG = _schliessfachdata; 
_ownerID publicVariableClient "NOCRIS_SCHLIESSFACH_CFG"; 
 
 
