/*

DS_lastPostPlaying = false;
publicVariable "DS_lastPostPlaying";

*/

if(DS_donorLevel isEqualTo 0)exitwith {
	hint "Only donators can do this";
};

if(DS_lastPostPlaying)exitwith {
	hint "This feature is currently in cooldown, please try again soon";
};

[] remoteExec ["HUNT_fnc_lastPostTimer",2];

DS_lastPostPlaying = true;
publicVariable "DS_lastPostPlaying";

{
	if(_x distance theLastPost < 3000)then {
		[theLastPost,"theLastPost",true] remoteExec ["DS_fnc_playSounds",_x];
	};
}forEach playableUnits;