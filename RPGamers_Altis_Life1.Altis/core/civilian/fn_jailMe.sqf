#include "..\..\script_macros.hpp"
/*
 Author Bryan "Tonic" Boardwine
 Description:
 Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown"];
params [
 ["_ret",[],[[]]],
 ["_bad",false,[false]],
 ["_time",15,[0]]
];
_time = time + (_time * 60);

[] call life_fnc_playerSkins;

if (count _ret > 0) then { life_bail_amount = (_ret select 2); } else { life_bail_amount = 10000;};

_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn {
	life_bail_amount = life_bail_amount * 5;
	if(life_bail_amount <= 100000) then
	{		
		life_canpay_bail = true;
	}
	else
	{
		life_canpay_bail = false;
	};
	if(_this select 0) then {
		sleep ( (_this select 1) * 0.5 );
	} else {
		sleep ( (_this select 1) * 0.2 );
 	};
 	//life_canpay_bail = nil;
};


("JAILTIME" call BIS_fnc_rscLayer) cutRsc ["jail_timer","PLAIN"]; //show

for "_i" from 0 to 1 step 0 do {
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;

		_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#327aad' align='center' size='1.3'>%1 Time Remaining</t>",_countDown];
		((uiNamespace getVariable "jailtimer") displayCtrl 1100) ctrlSetStructuredText _sexytext;

		_bsexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#ffffff' align='center' size='0.9'>%1</t>",[life_bail_amount] call life_fnc_numberText];
		((uiNamespace getVariable "jailtimer") displayCtrl 1101) ctrlSetStructuredText _bsexytext;

		//hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if (life_canpay_bail) then {"Yes"} else {"No"}];
	};

	if(player distance (getMarkerPos "jail_marker") > 75) exitWith	
	{		
		_esc = true;	
	};		
	if(life_bail_paid) exitWith	
	{		
		_bail = true;	
	};		
	if((round(_time - time)) < 1) exitWith {hint ""};	
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};	
    sleep 0.1;
};
switch (true) do {
	case (_bail): {
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "";
		[localize "STR_Jail_Paid",5,"blue"] call RPG_Fnc_Msg;
		("JAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
        if (life_HC_isActive) then {
            [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
        } else {
            [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        };
		player addUniform RPG_Fnc_OldUniform;
		//player addUniform RPG_Fnc_OldVest;
		player addUniform RPG_Fnc_OldBackpack;

		[5] call SOCK_fnc_updatePartial;
		call life_fnc_saveGear;
	};

	case (_esc): {
		 life_is_arrested = false;
		 [localize "STR_Jail_EscapeSelf",5,"blue"] call RPG_Fnc_Msg;
		("JAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",civilian];
		[0,"STR_Jail_EscapeDispatch",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
		[1,"STR_Jail_EscapeDispatch",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
	    if (life_HC_isActive) then {
	        [getPlayerUID player,profileName,"901"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	    } else {
	        [getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	    };
	    [5] call SOCK_fnc_updatePartial;
		call life_fnc_saveGear;
	};

	case (alive player && !_esc && !_bail): {
		life_is_arrested = false;
		[localize "STR_Jail_Released",5,"blue"] call RPG_Fnc_Msg;
		("JAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
        if (life_HC_isActive) then {
            [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
        } else {
            [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        };
        player setPos (getMarkerPos "jail_release");
	 	player addUniform RPG_Fnc_OldUniform;
		//player addUniform RPG_Fnc_OldVest;
		player addUniform RPG_Fnc_OldBackpack;

		[5] call SOCK_fnc_updatePartial;
		call life_fnc_saveGear;
 	};
};