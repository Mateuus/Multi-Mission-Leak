/*
	Displays the house owner
*/
private["_house"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {[localize "STR_House_Raid_NoOwner", false] spawn domsg;};
hint parseText format["<t color='#FF0000'><t size='2'>" +(localize "STR_House_Raid_Owner")+ "</t></t><br/>%1",(_house getVariable "house_owner") select 1];