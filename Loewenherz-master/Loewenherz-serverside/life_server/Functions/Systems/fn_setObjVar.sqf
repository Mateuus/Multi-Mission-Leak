/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Sets a variable on the given object from the server, 
 workaround for brokenness of ARMA 3, yes Brokenness is a word! 
*/ 
private["_obj","_varValue","_global","_varName"]; 
_obj = param [0,ObjNull,[ObjNull]]; 
_varName = param [1,"",[""]]; 
_varValue = _this select 2; 
_global = param [3,false,[true]]; 
 
if (isNull _obj || _varName isEqualTo "") exitWith {}; //Bad. 
_obj setVariable[_varName,_varValue,_global];