/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Vehicular Manslaughter",6500]};
	case "187": {_type = ["Manslaughter",20000]};
	case "901": {_type = ["Escaping Jail",4500]};
	case "261": {_type = ["Rape",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Attempted Rape",3000]};
	case "215": {_type = ["Attempted Auto Theft",2000]};
	case "213": {_type = ["Use of illegal explosives",10000]};
	case "211": {_type = ["Robbery",1000]};
	case "207": {_type = ["Kidnapping",3500]};
	case "207A": {_type = ["Attempted Kidnapping",2000]};
	case "487": {_type = ["Grand Theft",1500]};
	case "488": {_type = ["Petty Theft",700]};
	case "480": {_type = ["Hit and run",1300]};
	case "481": {_type = ["Drug Possession",1000]};
	case "482": {_type = ["Intent to distribute",5000]};
	case "483": {_type = ["Drug Trafficking",9500]};
	case "459": {_type = ["Burglary",6500]};
	case "666": {_type = ["Tax Evasion",2000]};
	case "667": {_type = ["Terrorism",20000]};
	case "668": {_type = ["Unlicensed Hunting",2000]}
	
	case "1": {_type = ["Driving without Lights",1500]};
    case "2": {_type = ["Driving without License",3500]};
    case "3": {_type = ["Driving over the Speed",5000]};
    case "4": {_type = ["Reckless Driving",3050]};
    case "5": {_type = ["Driving Stolen Vehicle",3500]};
    case "6": {_type = ["Hit and Run",7500]};
    case "7": {_type = ["Attempted Murder",9500]};
    case "8": {_type = ["Theft of NATO vehicle",20000]};
    case "9": {_type = ["Landing in a no-fly zone",2500]};
    case "10": {_type = ["Driving illegal vehicles",10000]};
    case "11": {_type = ["Arson",5000]};
    case "12": {_type = ["Evasion from TSF/NATO",7500]};
    case "13": {_type = ["Theft of TSF vehicle",1500]};
    case "14": {_type = ["Illegal roadblocks",5000]};
    case "15": {_type = ["Trolling and Baiting",5000]};
    case "16": {_type = ["Drug running",25000]};
    case "17": {_type = ["Illegal weapons",2500]};
    case "18": {_type = ["Illegal Items",8000]};
    case "19": {_type = ["Entering a restricted zone",5000]};
    case "20": {_type = ["Brandishing firearmsr",25000]};
    case "21": {_type = ["Firing at TSF/NATO Vehicles",15000]};
    case "22": {_type = ["Destruction of property",15000]};
    case "23": {_type = ["Illegal Contraband",12000]};
    case "24": {_type = ["Possession of firearms without a license",5000]};
    case "25": {_type = ["Attempted suicide attack",2500]};
    case "26": {_type = ["Declaring War",100000]};
    case "27": {_type = ["Taking over NATO checkpoints",10000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_result = format["wantedGetCrimes:%1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = _queryResult select 1;
	_pastCrimes pushBack (_type select 0);
	_query = format["wantedUpdateCrimes:%1:%2:%3",_pastCrimes,_val,_uid];
} else {
	_crimes = [(_type select 0)];
	_query = format["wantedInsertCrimes:%1:%2:%3:%4:1",_uid,_name,_crimes,_val];
};

if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
};