/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	// Automatically Added Crimes
	case "120S": {_type = ["Speeding Over Limit",1000]};
	case "120H": {_type = ["Habitual Speeding",5000]};
	case "120WL": {_type = ["Driving W/O License",7500]};
	case "120FS": {_type = ["Felony Speeding AOS",10000]};
	case "187V": {_type = ["Vehicular Manslaughter",25000]};
	case "187": {_type = ["Manslaughter",50000]};
	case "901": {_type = ["Escaping Jail",15000]};
	case "261": {_type = ["Rape",5000]};
	case "261A": {_type = ["Attempted Rape",3000]};
	case "215": {_type = ["Attempted Auto Theft",3000]};
	case "213": {_type = ["Use of Illegal Explosives",10000]};
	case "211": {_type = ["Robbery",10000]};
	case "212": {_type = ["Armed Robbery",20000]};
	case "207": {_type = ["Kidnapping",12500]};
	case "207A": {_type = ["Attempted Kidnapping",6000]};
	case "390": {_type = ["Public Intoxication",5000]};
	case "487": {_type = ["Grand Theft",8000]};
	case "488": {_type = ["Petty Theft",1500]};
	case "480": {_type = ["Hit and Run",5000]};
	case "481": {_type = ["Drug Possession",10000]};
	case "482": {_type = ["Intent to Distribute",15000]};
	case "483": {_type = ["Drug Trafficking",30000]};
	case "459": {_type = ["Bank Robbery",45000]};
	case "461": {_type = ["Break and Enter",15000]};
	case "490": {_type = ["Chopping Vehicle",10000]};
	case "919": {_type = ["Organ Dealing",20000]};
	
	//Wanted+ Crimes that are Manually Added
	case "1": {_type = ["Driving Without Lights",1000]};
	case "2": {_type = ["Running Stop Sign",1500]};
	case "3": {_type = ["Drunk Driving",7500]};
	case "4": {_type = ["Wreckless Driving",5000]};
	case "5": {_type = ["Vandalism",2500]};
	case "6": {_type = ["Resisting Arrest",3000]};
	case "7": {_type = ["Fleeing From Police",8000]};
	case "8": {_type = ["Theft of Police Vehicle",10000]};
	case "9": {_type = ["Landing No-Fly Zone",10000]};
	case "10": {_type = ["Driving Illegal Vehicle",12500]};
	case "11": {_type = ["Hit and Run",15000]};
	case "12": {_type = ["Civil Disorder",5000]};
	case "13": {_type = ["Indecent Exposure",7500]};
	case "14": {_type = ["Assault",9000]};
	case "15": {_type = ["Assault w/ Deadly Weapon",14000]};
	case "16": {_type = ["Harassment",2500]};
	case "17": {_type = ["Trespassing",5000]};
	case "18": {_type = ["Killing Police Officer",75000]};
	case "19": {_type = ["Known Gang Member",30000]};
	case "20": {_type = ["Possession of Firearm",10000]};
	case "21": {_type = ["Possession of Prohibited Weapon",15000]};
	case "22": {_type = ["Discharging of Firearm",10000]};
	case "23": {_type = ["Kidnapping",20000]};
	case "24": {_type = ["Bank Robbery",45000]};
	case "25": {_type = ["Illegal Arms Dealing",30000]};
	case "26": {_type = ["Drug Dealing",15000]};
	case "27": {_type = ["Drug Trafficking",30000]};
	case "28": {_type = ["Terrorism",100000]};
	case "29": {_type = ["Failing To Stop",5000]};
	case "30": {_type = ["Aiding a Felon",50000]};
	case "31": {_type = ["Suicide Threat",10000]};
	case "32": {_type = ["No Taxi License",10000]};
	case "33": {_type = ["Street Racing",15000]};
	case "34": {_type = ["Attempted Murder",25000]};
	case "35": {_type = ["Killing Police Dog",25000]};
	case "36": {_type = ["Possession Stolen Vehicle",10000]};
	case "37": {_type = ["Driving Under Influence",12500]};
	case "38": {_type = ["Arson",15000]};
	case "39": {_type = ["No Personal ID",2500]};
	case "40": {_type = ["No Insurance",5000]};
	case "41": {_type = ["Failure Turn Signal",1500]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
	[[_name,_uid,_crimes,(_type select 1) + _val],_uid] spawn TON_fnc_saveBounties;
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
	[[_name,_uid,[(_type select 0)],(_type select 1)],_uid] spawn TON_fnc_saveBounties;
}; 
