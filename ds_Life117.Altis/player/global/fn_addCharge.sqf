/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Adds a charge to a player
*/

private ["_uid","_charge","_type","_bounty","_current","_arrayToEnter","_found","_fail","_tempArray"];

_uid = (getPlayerUID player);
_charge = _this select 0;
_current = 1;
_arrayToEnter = [];
_found = false;
_fail= false;

if(isNil {_charge})exitwith{};
if(player getVariable ["security",false])exitwith{};

switch(_charge) do
{
	case "701": {_type = ["Using Fake ID",5000]};
	case "187V": {_type = ["Vehicular Manslaughter",1000]};
	case "187": {_type = ["Manslaughter",2000]};
	case "901": {_type = ["Escaping Jail",20000]};
	case "261": {_type = ["Rape",66]}; 
	case "261A": {_type = ["Attempted Rape",66]};
	case "214": {_type = ["Gas Station Robbery",2000]};
	case "215": {_type = ["Attempted Auto Theft",250]};
	case "213": {_type = ["Use of illegal explosives",10000]};
	case "211": {_type = ["Robbery",500]};
	case "207": {_type = ["Kidnapping (Extortion)",11000]};
	case "207A": {_type = ["Attempted Kidnapping",250]};
	case "487": {_type = ["Grand Theft",900]};
	case "488": {_type = ["Petty Theft",66]};
	case "480": {_type = ["Hit and run",66]};
	case "481": {_type = ["Drug Possession",5000]};
	case "482": {_type = ["Intent to distribute",5000]};
	case "483": {_type = ["Drug Trafficking",4500]};
	case "459": {_type = ["Burglary",66]};
	case "500": {_type = ["Evading Police",1000]};
	case "501": {_type = ["Reckless Driving",800]};
	case "502": {_type = ["Possession of Illegal Weapon",800]};
	case "503": {_type = ["Possession of a contraband item",1300]};
	case "504": {_type = ["Abduction",3000]};
	case "505": {_type = ["Unsafe conduct",1250]};
	case "506": {_type = ["Attempted Murder",3000]};
	case "507": {_type = ["Vandalism",1000]};
	case "508": {_type = ["Theft",500]};
	case "509": {_type = ["Bank Robbery",15000]};
	case "510": {_type = ["Terrorism",30000]};
	case "511": {_type = ["Stealing Documents",6000]};
	case "512": {_type = ["Careless Flying",500]};
	case "513": {_type = ["Accessory To Crime",750]};
	case "514": {_type = ["Drunk Driving",450]};
	case "515": {_type = ["Bribery",300]};
	case "516": {_type = ["Breach of the peace",500]};
	case "517": {_type = ["Armed Robbery",2000]};
	case "518": {_type = ["Hospital Robbery",3000]};
	case "519": {_type = ["Illegal Weapons Dealer",5000]};
	case "520": {_type = ["Selling Stolen Goods",400]};
	case "521": {_type = ["Arson",400]};
	case "522": {_type = ["Murder",4000]};
	case "523": {_type = ["Fort Knox Robbery",20000]};
	case "524": {_type = ["Armed Occupation",11000]};
	case "525": {_type = ["Hit and Run",700]};
	case "526": {_type = ["Trespassing",600]};
	case "527": {_type = ["Using Chopshop",2500]};
	case "528": {_type = ["Possession",3000]};
};

//Add bounty amount to first index of array
_bounty = (DS_wanted_stats select 0) + (_type select 1);

//Check if player already has a charge
{
	if(_forEachIndex > 0)then
		{
		if((_type select 0) == (_x select 0))then
			{
			if((_type select 0) == "Terrorism")exitwith{_fail = true};
			if((_type select 0) == "Attempted Murder")exitwith{_fail = true};
			_found = true;
			_current = (_x select 1) + 1;
			_arrayToEnter = _x;
			_arrayTOEnter set [1,_current];
			DS_wanted_stats set [_forEachIndex,_arrayToEnter];
			};
		};
}forEach DS_wanted_stats;

if(_fail)exitwith{};//Don't add terrorism twice

//Add charge if it isn't already there
if(!_found)then
	{
	_arrayToEnter set[0,(_type select 0)];
	_arrayToEnter set[1,1];
	DS_wanted_stats pushBack _arrayToEnter;
	};
DS_wanted_stats set[0,_bounty];
player setVariable["bounty",_bounty,true];
/*
if(((DS_questLog select 4) == 18)&&((DS_wanted_stats select 0) > 50000))then
			{
			[0,0,2] spawn life_fnc_questCompleted;
			};
*/
//Add name to server wanted list?
if((count DS_wanted_stats) > 1)then
	{
	//Double check they aren't already there for some reason
	_tempArray = [];
	_tempArray set [0,_uid];
	_tempArray set [1,(name player)];
	if(_tempArray in DS_wantedList)exitwith{};
	DS_wantedList pushBack _tempArray;
	publicVariable "DS_wantedList";
	};
