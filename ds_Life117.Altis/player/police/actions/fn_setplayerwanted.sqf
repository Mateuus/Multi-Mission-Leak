/*
	File: fn_setwanted.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	sets a player wanted, depending on what button the cop clicked
*/
private["_display","_text","_units","_charge","_chargeStr"];

_charge = [_this,0,ObjNull,[""]] call BIS_fnc_param;
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1",_unit];

if(!isServer)then
	{
	if((side _unit) == west)exitwith{Hint "You can not set an officer wanted";};
	};
if(isNil "_unit")exitwith{hint "You did not select a player"};
switch (_charge) do
	{
	case "fakeId":
		{
		[["701"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Using a fake ID";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "evade":
		{
		[["500"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Evading Police";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "reckless":
		{
		[["501"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Reckless Driving";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "illegalweapon":
		{
		[["502"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Possession of Illegal Weapon";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "illegalitem":
		{
		[["503"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Possession of a contraband item";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "abduction":
		{
		[["504"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Abduction";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "unsafe":
		{
		[["505"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Unsafe conduct";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "amurder":
		{
		[["506"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Attempted Murder";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "vandalism":
		{
		[["507"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Vandalism";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "thieft":
		{
		[["508"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Theft";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "brob":
		{
		[["509"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Bank Robbery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "terrorism":
		{
		[["510"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Terrorism";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "spythieft":
		{
		[["511"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Stealing Secret Documents";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "cflying":
		{
		[["512"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Careless Flying";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "acces":
		{
		[["513"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Accessory To Crime";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "ddriving":
		{
		[["514"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Drunk Driving";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "bribe":
		{
		[["515"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Bribery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "bpeace":
		{
		[["516"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Breach of the peace";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "armrob":
		{
		[["517"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Armed Robbery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "murder":
		{
		[["522"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Murder";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "fortknox":
		{
		[["523"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Fort Knox Robbery";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "gta":
		{
		[["487"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Grand Theft Auto";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "armedocc":
		{
		[["524"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Armed Occupation";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "hitandrun":
		{
		[["525"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Hit and Run";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "trespass":
		{
		[["526"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Trespassing";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "drug":
		{
		[["528"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Possession";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	case "manslaughter":
		{
		[["187"],"DS_fnc_addCharge",_unit,false] spawn DS_fnc_MP;
		_chargeStr = "Man Slaughter";
		hint format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		systemchat format ["You have set %1 wanted for %2",name _unit,_chargeStr];
		};
	};
