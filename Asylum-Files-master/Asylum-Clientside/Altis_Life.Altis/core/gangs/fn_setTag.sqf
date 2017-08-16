/*
fn_setTag.sqf
Kevin Webb
Function for the gang leader to choose his own gang tag
*/
scopeName "Main";
switch(_this select 0) do {
	case 1: {
		_index = [group player, life_group_list] call life_fnc_index;
		if(_index != -1) exitWith {hint "You can't do this while in a temporary group, get back into your proper gang"};
		createDialog "life_ticket_give";
		
		_button = findDisplay 2650 displayCtrl 1337;
		_button ctrlSetText "Set Tag"; 
		ctrlSetText[2651,format["Set tag for %1",life_gang_name]];
		hint "Here you can choose a tag, up to 4 characters, which will be displayed overhead and in kill messages.";
	};
	case 2: {
		_tag = ctrlText 2652;
		_len = [_tag] call KRON_StrLen;
		if(_len > 4) exitWith {hint "This tag is too long and must be 4 characters or less"};
		//_gangArray = toArray life_gang_name;
		//{if(!(_x in _gangArray)) exitWith {hint "It appears you've used a character which isn't actually in your gang name"; breakTo "Main"}} forEach toArray _tag;
		if(_tag in ["APD"]) exitWith {hint "This tag is not allowed"};
		group player setVariable["gangTag",_tag,true];
		[[3,life_gang,_tag],"life_fnc_setTag",false,false] call life_fnc_MP;
		closeDialog 0;
		hint format["You have chosen your gang tag as [%1]",_tag];
	};
	case 3: {

		profileNameSpace setVariable[format["tag%1",_this select 1],_this select 2];
	};
	case 4: {

		(_this select 1) setVariable[
			"gangTag",
			profileNameSpace getVariable[format["tag%1",_this select 2],""],
			true
		];
	};
};