#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
private["_id","_ret"];
_id = _this select 0;
_ret = _this select 1;
_id = owner _id;
_ret = owner _ret;

[_id] remoteExecCall ["ES_fnc_adminid",_ret];