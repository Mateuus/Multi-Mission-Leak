/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Alters server sell prices
*/
private["_type","_resource"];

_type = _this select 0;
_resource = _this select 1;

switch(_type)do
	{
	case 1:
		{
		legalItems set[_resource,1];
		};
	case 2:
		{
		illegalItems set[_resource,1];
		};
	};
publicVariable "legalItems";
publicVariable "illegalItems";
			