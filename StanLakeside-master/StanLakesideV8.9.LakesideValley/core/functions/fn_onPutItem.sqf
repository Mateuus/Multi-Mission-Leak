/*
	
	
	Description:
	Syncs changes to containers in houses?
*/
private["_unit","_item","_house","_container"];
_unit = param [0,ObjNull,[ObjNull]];
_container = param [1,ObjNull,[ObjNull]];
_item = param [2,"",[""]];

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?