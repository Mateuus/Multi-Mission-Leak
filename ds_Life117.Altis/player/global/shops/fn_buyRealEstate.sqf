/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Buys selected real estate
*/
disableSerialization;

ctrlShow[66654,false];

private ["_type","_action","_houseStr","_value","_rent","_tempAmount","_stringArray","_tempNum","_totalOwned","_index","_max"];
_type = DS_className;
_max = 4;
if((DS_infoArray select 13) > 31)then{_max = 6};

switch (_type select 1) do
	{
	case 300000:	
		{
		_houseStr = "Single Apartment Room";
		_value = 300000;
		_rent = 600;
		_index = 29;
		};
	case 500000:	
		{
		_houseStr = "Small House";
		_value = 500000;
		_rent = 800;
		_index = 30;
		};
	case 700000:	
		{
		_houseStr = "Small Two Storied House";
		_value = 700000;
		_rent = 1100;
		_index = 31;
		};
	case 1500000:	
		{
		_houseStr = "Apartment Floor";
		_value = 1500000;
		_rent = 2500;
		_index = 32;
		};
	case 2000000:	
		{
		_houseStr = "Large House";
		_value = 2000000;
		_rent = 3200;
		_index = 33;
		};
	case 2500000:	
		{
		_houseStr = "Large Two Storied House";
		_value = 2500000;
		_rent = 4000;
		_index = 34;
		};
	case 4000000:	
		{
		_houseStr = "Apartment Block";
		_value = 4000000;
		_rent = 6500;
		_index = 35;
		};
	case 5500000:	
		{
		_houseStr = "SubDivision";
		_value = 5500000;
		_rent = 9000;
		_index = 36;
		};
	case 7000000:	
		{
		_houseStr = "Private Island";
		_value = 7000000;
		_rent = 11200;
		_index = 37;
		};
	};
	
_totalOwned = ((DS_realEstateArray select 29)+(DS_realEstateArray select 30)+(DS_realEstateArray select 31)+(DS_realEstateArray select 32)+(DS_realEstateArray select 33)+(DS_realEstateArray select 34)+(DS_realEstateArray select 35)+(DS_realEstateArray select 36)+(DS_realEstateArray select 37));
//if((player_questLog select 2) > 30)then{_totalOwned = _totalOwned - 2};
if(_totalOwned > (_max - 1))exitWith{hint format ["You may only own %1 properties at a time",_max];};
//Low Max, might increase for donators later.	
if((DS_realEstateArray select _index) > 1) exitwith {hint "Purchase Cancelled, You can only buy up to 2 of this property type";};

_action = [
	"Warning! This is not a house you can enter, spawn at or store items. This is virtual real estate that increases your paychecks",
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;

if(!_action)exitwith {hint "Purchase cancelled, to buy an actual house just walk up to and press the windows key on the door or inside the building!"};

_action = [
	format ["Are you sure you want to buy a %1 for $%2?",_houseStr,[_value] call DS_fnc_numberText],
	"Buy Real Estate",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(!_action)exitwith {hint "Purchase cancelled, come back any time!"};

if([_value,true] call DS_fnc_checkMoney)exitwith{hint format ["You can not afford this house, you are lacking $%1 in your bank",[(_value - DS_atmcoin)] call DS_fnc_numberText];};

hint format ["Placing order for a %1 at a price of $%2...........",_houseStr,[_value] call DS_fnc_numberText];

_action = [
	format ["Sign on the dotted line to buy a %1 for $%2?",_houseStr,[_value] call DS_fnc_numberText],
	"Buy Real Estate",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(!_action)exitwith {hint "Purchase cancelled, come back any time!"};

if([_value,true] call DS_fnc_checkMoney)exitwith{hint format ["You can not afford this house, you are lacking $%1 in your bank",[(_value - DS_atmPaper)] call DS_fnc_numberText];};

diag_log format["House bought by %1 for $%2: Error Code = %3",(name player),_value,_type];

player say3D "success";
[_value,true,false] call DS_fnc_handleMoney;

hint format ["Congratulation! You are now the proud owner of a %1.\n\nThe buy price of $%2 was removed from your bank account.\n\nYou will receive $%3 rent for this property every 10 minutes",_houseStr,[_value] call DS_fnc_numberText,[_rent] call DS_fnc_numberText];

_temp = (DS_realEstateArray select _index)+1;
DS_realEstateArray set [_index, _temp];
[] call DS_fnc_compileData;
