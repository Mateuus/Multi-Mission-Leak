/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys a weapon
*/
disableSerialization;
private["_className","_price","_type","_config"];

_className = DS_className;
_price = DS_price;

//Will add error checks here
//_price = (parseNumber _price);
if([_price,false] call DS_fnc_checkMoney)exitwith{};//WTF
if(_price < 0)exitwith{};//Heh
//Sort out colours etc
[_price,false,false] call DS_fnc_handleMoney;

//Filter? To make sure player has room....

_type = if(isNil "_nothing")then
	{
	switch (true) do
		{
		case (isClass (configFile >> "CfgMagazines" >> _className)) : {"CfgMagazines";};
		case (isClass (configFile >> "CfgWeapons" >> _className)) : {"CfgWeapons";};
		case (isClass (configFile >> "CfgGlasses" >> _className)) : {"CfgGlasses";};
		case (isClass (configFile >> "CfgVehicles" >> _className)) : {"CfgVehicles";};
		};
	};
	switch (_type) do
		{
		case "CfgMagazines":
			{
			_config = configFile >> "CfgMagazines" >> _className;
			};
		case "CfgWeapons":
			{
			_config = configFile >> "CfgWeapons" >> _className;
			};
		case "CfgGlasses":
			{
			_config = configFile >> "CfgGlasses" >> _className;
			};
		case "CfgVehicles":
			{
			_config = configFile >> "CfgVehicles" >> _className;
			};
		};
_type = getText(_config >> "displayName");

hint format ["You have bought a %1 for $%2",_type,[_price] call DS_fnc_numberText];
[_className,false,false,false,false] call DS_fnc_equipItem;
if((playerside == west)||(player getVariable ["security",false]))then{[] spawn DS_fnc_copUniform};

















