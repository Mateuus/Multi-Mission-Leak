/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total"];
_val = [_this,0,"",["",0]] call GTA_fnc_param;
_total = [_this,1,"",["",0]] call GTA_fnc_param;


//--- Perk: Dirty Cop
switch ( "dirty_cop" call GTA_fnc_perkRank ) do {

	case 1: { _val = round ( _val * 1.1 ); _total = round ( _total * 1.1 ); };
	case 2: { _val = round ( _val * 1.25 ); _total = round ( _total * 1.25 ); };
	case 3: { _val = round ( _val * 1.5 ); _total = round ( _total * 1.5 ); };

};

if ( _val == _total ) then {

	titleText [format [ localize "STR_Cop_BountyRecieve", [ _val ] call life_fnc_numberText ], "PLAIN" ];

} else {

	titleText [format [ localize "STR_Cop_BountyKill", [ _val ] call life_fnc_numberText, [ _total ] call life_fnc_numberText ], "PLAIN" ];

};

GTA_money_bank = GTA_money_bank + _val;