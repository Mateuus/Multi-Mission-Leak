private["_caller","_callerName"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_callerName = [_this,1,"Unknown Player",[""]] call BIS_fnc_param;
if(isNull _caller) exitWith {}; //Bad data
["MedicalRequestEmerg",[format["%1 demande une reanimation.",_callerName]]] call BIS_fnc_showNotification;