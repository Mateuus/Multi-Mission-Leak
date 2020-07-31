/*
File: fn_breakout.sqf
koils a dick head
*/
private["_sum","_veh"];

titleText["Trying to dig a hole..","PLAIN"];
titleFadeOut 3;
uiSleep 3;
titleText["This will take a while.","PLAIN"];
titleFadeOut 240;
_cme = 1;
_myposy = getPos player;
if(!life_action_inUse) then {
	while {true} do {
		life_action_inUse = true;
		uiSleep 9;
		if( player distance _myposy > 1.8 ) exitwith { 
			titleText["You moved to far.","PLAIN"];
			life_action_inUse = false;
		};
		_cme = _cme + 1;

		if(_cme > 30) exitwith {
			life_action_inUse = false;
			_chance = round (random 1000);
			if(_chance < 960) then {
				titleText["You failed to break out.","PLAIN"];
			} else {
				life_breakouton = 1;
				player setPos (getMarkerPos "jail_breakout");
				playSound3D ["cg_sndimg\sounds\siren_long.ogg", player, false, getPosASL player, 22, 0.3, 425]; 
				titleText["Shit, your GPS bracer is going off! RUN FOR IT!","PLAIN"];
			};
		};
	};
	life_action_inUse = false;
};