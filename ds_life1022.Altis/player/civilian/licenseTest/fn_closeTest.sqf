/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Closes the license test
*/

private["_index","_current","_pack","_display","_text","_units","_charge","_chargeStr"];

_index = 0;

switch(_this select 0)do
	{
	case 0:
		{
		_index = 17;
		};
	case 1:
		{
		_index = 18;
		};
	case 2:
		{
		_index = 19;
		};
	case 3:
		{
		_index = 13;
		};
	case 4:
		{
		_index = 20;
		};
	case 5:
		{
		_index = 20;
		};
	};

_current = DS_realEstateArray select _index;
_current = _current + 1;
DS_realEstateArray set [_index,_current];
DS_licenseIndex = 0;
hint "Because you closed the test this has counted as a fail (Lost License) meaning the next attempt will cost you more";
systemchat "Because you closed the test this has counted as a fail (Lost License) meaning the next attempt will cost you more";
7 enableChannel [true, false];
8 enableChannel [true, false];
9 enableChannel [true, false];