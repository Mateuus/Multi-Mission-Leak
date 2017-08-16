/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks if an attachment can fit onto a weapon
*/
private ["_className","_type","_return","_optics","_config"];

_className = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
_config = configFile >> "CfgWeapons" >> _className;
_optics = [];

if((_className == "")||(_type == 0))exitwith{0};//Bad data passed in
_return = 0;
_className = toLower(_className);

//systemchat format ["Attach type = %1 || Class = %2 || Config %3",_type,_className,_config];

switch(_type)do
	{
	case 201:
		{
		if(handgunWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
				if(_className in _optics) then {_return = 3};
				};
			};
		if(secondaryWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
					if(_className in _optics)then{_return = 2};
				};
			};
		if(primaryWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
					if(_className in _optics)then{_return = 1};
				};
			};
		};
	case 301:
		{
		if(handgunWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
				if(_className in _optics) then {_return = 3};
				};
			};
		if(secondaryWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
					if(_className in _optics)then{_return = 2};
				};
			};
		if(primaryWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
					if(_className in _optics)then{_return = 1};
				};
			};
		};
	case 101:
		{
		if(handgunWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
			//systemchat format ["HG %1",_optics];
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
				if(_className in _optics) then {_return = 3};
				};
			};
		if(secondaryWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
			//systemchat format ["SG %1",_optics];
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
					if(_className in _optics)then{_return = 2};
				};
			};
		if(primaryWeapon player != "")then
			{
			_optics = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
			//systemchat format ["PG %1",_optics];
			if(count(_optics) != 0)then
				{
				for "_i" from 0 to (count _optics)-1 do
					{
					_optics set[_i,toLower(_optics select _i)];
					};
					if(_className in _optics)then{_return = 1};
				};
			};
		};
	};
	
_return;












