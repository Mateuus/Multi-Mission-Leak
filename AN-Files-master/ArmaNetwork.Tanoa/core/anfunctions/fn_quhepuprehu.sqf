/*
	author: [midgetgrimm]
	description: this is so I can call a dialog script via serverside
	has 5 minute runonce protection since it queries the db
*/

closeDialog 0;
if(isNil "life_listView_inUse") then {life_listView_inUse = time-601;};
if(life_listView_inUse+(600) >= time) exitWith {closeDialog 0; systemChat format["You have already viewed the most wanted list, you can only use this feature again in %1 minute(s) and %2 seconds",9 - floor ((time - life_listView_inUse) / 60),59 - round (time - life_listView_inUse - (floor ((time - life_listView_inUse) / 60)) * 60)];};
[player] remoteExecCall ["life_fnc_wantedDisplay",2];
life_listView_inUse = time;