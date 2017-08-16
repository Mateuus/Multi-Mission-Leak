/*
	File: fn_charge.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Prompts to add a charge to a player
*/

life_charged = cursorTarget;
if (isNull life_charged || !isPlayer life_charged || !alive life_charged) exitWith {};
if (!isNull (findDisplay 5520)) exitWith {}; //Already at the menu, block for abuse?

createDialog "life_charge_diag";
disableSerialization;
waitUntil {!isNull (findDisplay 5520)};
_display = findDisplay 5520;
_control = _display displayCtrl 5521;

_charges = [
	["141","Aiding escape from custody"],
	["215","Attempted Auto Theft"],
	["2113A","Attempted Bank Robbery"],
	["214","Attempted Manslaughter"],
	["lowair","Aviation altitude violation"],
	["dwc","Discharge Within City"],
	["order","Disobeying an Order from an Officer"],
	["div","Driving an Illegal Vehicle"],
	["evade","Evading Arrest"],
	["1090","Explosives Terrorism"],
	["fth","Failure to Headlight"],
	["fts","Failure to Stop"],
	["487","Grand Theft"],
	["har","Harassment"],
	["id","Identity Fraud"],
	["isr","Illegal Street Racing"],
	["207","Kidnapping"],
	["488","Petty Theft"],
	["check","Police Checkpoint Gates"],
	["coc","Possession of Cocaine"],
	["her","Possession of Heroin"],
	["pcp","Possession of PCP"],
	["pif","Possession of Illegal Firearm"],
	["pil","Possession of Illegal Liquor"],
	["pdm","Money Laundering"],
	["dt","Drug Trafficking"]
];
if (!(life_configuration select 2)) then { _charges pushBack ["mar","Possession of Marijuana"]; };
_charges = _charges + [
	["met","Possession of Meth"],
	["poseq","Possession of Police Equipment"],
	["gold","Possession of Reserve Gold"],
	["tur","Possession of Turtle Meat"],
	["pi","Public Intoxication"],
	["261","Rape"],
	["rdr","Reckless Driving"],
	["duv","Driving Unregistered Vehicle"],
	["211","Robbery"],
	["spd","Speeding"],
	["terror","Terrorism"],
	["threat","Threatening an Officer"],
	["trw","Trafficking Weapons (3+)"],
	["park","Unauthorized Parking"]
];

// Load up charges
{
	
	_control lbAdd (_x select 1);
	_control lbSetData [(lbSize _control)-1,(_x select 0)];
} foreach _charges;

lbSetCurSel [5521,0];