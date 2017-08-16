/*

*/
private["_unit","_item"];
_unit = param [0,ObjNull,[ObjNull]];
_container = param [1,ObjNull,[ObjNull]];
_item = param [2,"",[""]];

if(isNull _unit || _item == "") exitWith {};
