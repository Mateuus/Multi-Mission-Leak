/*
	Displays the house owner
*/
private["_house"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Das Haus gehört niemanden!"};

_ownerUid = ((_house getVariable "house_owner") select 0);
_ownerName = ((_house getVariable "house_owner") select 1);

if(!([_ownerUid] call DWEV_fnc_isUIDActive)) exitWith {hint "Der Besitzer dieses Hauses ist nicht Online!"};

if (([_ownerUid] call DWEV_fnc_getActiveUIDplayer) getVariable ["restrained",false]) then
{
	hint parseText format["<t color='#FF0000'><t size='2'>Hausbesitzer</t></t><br/>%1",(_house getVariable "house_owner") select 1];
}
else
{
	hint "Der Eigentümer dieses Hauses ist nicht festgenommen";
};

