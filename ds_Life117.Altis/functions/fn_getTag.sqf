/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Returns a tag of a vehicles driver
*/
private ["_nameString"];
_nameString = format ["<t size='0.7' color='#01DF01'>%1%2</t>",(_this select 1),(_this select 0),(_this select 2)];
[_nameString,0.5,0.4,3,0,0,3] spawn bis_fnc_dynamicText;			
