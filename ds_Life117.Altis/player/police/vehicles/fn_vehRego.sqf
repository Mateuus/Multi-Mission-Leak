/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks vehicles rego details (Owners)
*/
private ["_vehicle","_owners","_display","_temp"];

_vehicle = DS_cursorTarget;
_display = "";
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship"))then
	{
	_owners = _vehicle getVariable "vehicle_owners";
	if(isNil {_owners})exitwith{hint "This vehicle has no information attached to it"};
	DS_doingStuff = true;
	hint "Running vehicles plates......";
	sleep 4;
	DS_doingStuff = false;
	if((player distance _vehicle > 10)||(!alive player)||(!alive _vehicle))exitwith{hint "Check failed"};
	
	{
		_temp = format ["%1<br/>",(_x select 1)];
		_display = _display + _temp;
	}forEach _owners;
	
	if(_display == "any<br/>") then
		{
		_display = "No owners, impound it<br/>";
		};
	hint parseText format["<t color='#FF0000'><t size='2'>Vehicle Info</t></t><br/><t color='#FFD700'><t size='1.5'>Owners</t></t><br/> %1",_display];
	};

	
	















