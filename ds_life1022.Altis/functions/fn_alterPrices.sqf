/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Alters server sell prices
*/

params ["_type","_resource"];

switch(_type)do {
	case 1: {
		legalItems set [_resource,true];
		publicVariable "legalItems";
	};
	case 2: {
		illegalItems set [_resource,true];
		publicVariable "illegalItems";
	};
};