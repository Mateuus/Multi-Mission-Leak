 
 
 
 
 
 
 
private["_obj","_varValue","_global","_varName"]; 
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_varName = [_this,1,"",[""]] call BIS_fnc_param; 
_varValue = _this select 2; 
_global = [_this,3,false,[true]] call BIS_fnc_param; 
 
if(isNull _obj OR _varName == "") exitWith {};  
_obj setVariable[_varName,_varValue,_global];