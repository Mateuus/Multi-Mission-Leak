/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets a player wanted, depending on what button the cop clicked
*/

private["_display","_text","_units","_charge","_chargeStr"];

_charge = [_this,0,objNull,[""]] call BIS_fnc_param;
_unit = lbData [2902,lbCurSel 2902];
_unit = missionNamespace getVariable _unit;

if(!isServer)then
	{
	if((side _unit) isEqualTo west)exitwith{Hint "You can not set an officer wanted";};
	};
if(isNil "_unit")exitwith{hint "You did not select a player"};
switch (_charge) do
	{
	case "fakeId":
		{
		["701"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Using a fake ID";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "evade":
		{
		["500"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Evading Police";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "reckless":
		{
		["501"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Reckless Driving";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "illegalweapon":
		{
		["502"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Possession of Illegal Weapon";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "illegalitem":
		{
		["503"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Possession of a contraband item";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "abduction":
		{
		["504"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Abduction";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "unsafe":
		{
		["505"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Unsafe conduct";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "amurder":
		{
		["506"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Attempted Murder";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "vandalism":
		{
		["507"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Vandalism";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "thieft":
		{
		["508"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Theft";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "brob":
		{
		["509"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Bank Robbery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "terrorism":
		{
		["510"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Terrorism";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "spythieft":
		{
		["511"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Stealing Secret Documents";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "cflying":
		{
		["512"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Careless Flying";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "acces":
		{
		["513"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Accessory To Crime";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "ddriving":
		{
		["514"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Drunk Driving";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "bribe":
		{
		["515"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Bribery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "bpeace":
		{
		["516"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Breach of the peace";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "armrob":
		{
		["517"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Armed Robbery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "murder":
		{
		["522"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Murder";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "fortknox":
		{
		["523"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Fort Knox/Research Facility Robbery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "gta":
		{
		["487"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Grand Theft Auto";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "armedocc":
		{
		["524"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Armed Occupation";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "hitandrun":
		{
		["525"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Hit and Run";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "trespass":
		{
		["526"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Trespassing";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "drug":
		{
		["528"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Possession";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "manslaughter":
		{
		["187"] remoteExecCall ["DS_fnc_addCharge",_unit];
		_chargeStr = "Man Slaughter";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	};