[] spawn {
	disableSerialization;
	DS_really_loud_sounds = {[60,15] call fnc_usec_pitchWhine;for "_i" from 1 to 15 do {playSound format ["%1",_this select 0];};};
	//DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	DS_slap_them = {_randomnr = [2,-1] call BIS_fnc_selectRandom;(vehicle player) SetVelocity [_randomnr * random (4) * cos getdir (vehicle player), _randomnr * random (4) * cos getdir (vehicle player), random (4)];};
	
	fnc_usec_pitchWhine = 
	{
		_visual = _this select 0;
		_sound = _this select 1;
		//affect the player
		0 fadeSound 0;
		playMusic ["PitchWhine",0];
		if (!r_player_unconscious) then 
		{
			_visual call fnc_usec_bulletHit;
			_sound fadeSound 1;
		};
		r_pitchWhine = true;
		[] spawn 
		{
			uisleep 32;
			r_pitchWhine = false;
		};
	};
	
	while {true} do {
		waitUntil {uisleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then 
		{
			if (ctrlText ((findDisplay 63) displayCtrl 101) == "Side Channel") then 
			{
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						uisleep 90;
						disconnect_me = nil;
						warn_one = nil;
						warn_two = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};
				if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
				if (disconnect_me == 0) then {
					if (isNil "warn_one") then {
						warn_one = true;
						hintSilent parseText "<img size='5' color='#FFFFFF' image='core\textures\icons\nosidechat.paa'/><br/><br/><t size='1'>Bitte nicht im Sidechat reden. Dies ist die erste Verwarnung!</t>";
						[] spawn DS_slap_them;
						//["beat04"] spawn DS_really_loud_sounds;
						//[] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 1) then {
					if (isNil "warn_two") then {
						warn_two = true;
						hintSilent parseText "<img size='5' color='#FFFFFF' image='core\textures\icons\nosidechat.paa'/><br/><br/><t size='1'>Bitte nicht im Sidechat reden. Dies ist die Letzte Verwarnung!</t>";

						[] spawn DS_slap_them;
						//["beat04"] spawn DS_really_loud_sounds;
						//[] spawn DS_double_cut;
					};
				};
				if (disconnect_me >= 2) then {
					if (isNil "warn_last") then {
						warn_last = true;
						playMusic ["PitchWhine",0];
						[] spawn DS_slap_them;
						//["beat04"] spawn DS_really_loud_sounds;
						//[] spawn DS_double_cut;
						1 fademusic 10;
						1 fadesound 10;
						disableUserInput true;
						hintSilent parseText "<img size='5' color='#FFFFFF' image='core\textures\icons\nosidechat.paa'/><br/><br/><t size='1'>Sie wurden mehrmals gewarnt, auf wiedersehen!</t>";				
						uisleep 20;
						disableUserInput false;
						endMission "LOSER";
					};
				};
			};
		};
		uisleep 10;
	};
};