if (Tower2 getVariable "ALRPG_terror") exitWith {Tower2 setVariable ["ALRPG_terror", false, true];};

if((call life_coplevel) < 5) exitWith {closeDialog 0; ["You need to be a captain to use this function.",false,"slow"] call life_fnc_notificationSystem;};

Tower2 setVariable ["ALRPG_terror", true, true];

_repeat = 1;
_length = 145;
for "_i" from 1 to _repeat do {
	// Check if the lockdown was cancelled
	"Kavala Lockdown Declared - Get into your homes or leave the city. Law enforcement will be patroling the city and arresting anyone who does not comply with these orders, civilians carrying a weapon unholstered may be shot." remoteExecCall ["hint",0];
	if !(Tower2 getVariable "ALRPG_terror") exitWith {};

	[[Tower1,Tower2,Tower3,Tower4,Tower5],"purge",[2500,2500,2500,2500,2500]] remoteExecCall ["life_fnc_playSound", 0, false];
	sleep _length;
};
