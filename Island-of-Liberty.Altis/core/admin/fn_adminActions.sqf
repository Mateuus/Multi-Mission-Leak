#include "..\..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
private["_type"];
_type = [_this,0,false,[false]] call BIS_fnc_param;
if (_type) then {life_adminAction = false};

if(life_adminAction) then {
		[0,format["Admin %1 has disabled admin quick actions ",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];
		[4,[profileName]] remoteExec ["TON_fnc_logs",RSERV];

		hint "admin actions off";
		{player removeAction _x} forEach admin_actions;
		life_adminAction = false;
} else {
		if (_type == false) then {[0,format["Admin %1 has enabled admin quick actions ",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];};
		[4,[profileName,true]] remoteExec ["TON_fnc_logs",RSERV];
		hint "admin actions on";
		admin_actions = [player addAction["<t color='#FF0000'>Heal/Repair Target</t>",{cursorTarget setDamage 0;}]];
		admin_actions = admin_actions + [player addAction["<t color='#FF0000'>Impound Target</t>",{_vehicle = cursorTarget; [_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",RSERV];}]];
		admin_actions = admin_actions + [player addAction["<t color='#FF0000'>Get Keys Target</t>",{_vehicle = cursorTarget;life_vehicles pushBack _vehicle;}]];
		admin_actions = admin_actions + [player addAction["<t color='#FF0000'>Get Vehicle Owners</t>",{_vehicle = cursorTarget;[_vehicle] spawn life_fnc_searchVehAction;}]];
		admin_actions = admin_actions + [player addAction["<t color='#FF0000'>Refuel Target</t>",{_vehicle = cursorTarget; _vehicle setFuel 1;}]];
        admin_actions = admin_actions + [player addAction["<t color='#FF0000'>Get Target Name</t>",{hint format["%1", typeOf cursorTarget]}]];
		admin_actions = admin_actions + [player addAction["<t color='#FF0000'>Log my position</t>",{diag_log format["%2 POSITION: %1",getPos player,name player];hint format["Logged your position to the report log: %1",getPos player];}]];
		life_adminAction = true;
};