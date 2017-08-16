/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
private["_value","_unit","_med"];
_value = param [0,5,[0]];
_unit = param [1,ObjNull,[ObjNull]];
_med = param [2,ObjNull,[ObjNull]];
if(isNull _unit OR {_unit != DWEV_ticketme_unit}) exitWith {}; //NO
if(isNull _med OR {_med != player}) exitWith {}; //Double NO

dwf_atmcash = dwf_atmcash + _value;