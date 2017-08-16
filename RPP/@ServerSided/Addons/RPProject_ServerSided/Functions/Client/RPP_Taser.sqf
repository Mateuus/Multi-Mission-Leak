/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Taser.sqf

Description:
Tase client
*/
["RPP_Tased", {
	private ['_unit','_causedby','_id'];

	_unit = _this select 0;
	_causedby = _this select 3;
	_id = getPlayerUID _causedby;
	if (getPlayerUID _causedby == getPlayerUID _unit) exitWith {}; 

	if (currentWeapon _causedby isEqualTo 'RPP_X26Taser_F') then { 
		[[], 'RPP_Tase_Player', _unit] call BIS_FNC_MP;
	};
}] call RPP_Function;
publicVariable 'RPP_Tased';

["RPP_Tase_Player", {
	[_this select 0] spawn {
		private ['_msg','_color'];
		if (player getVariable 'RPP_Tased') exitWith {};
		if (player getVariable 'RPP_Revivie') exitWith {};
		player setVariable ['RPP_Tased',true,true];
		[] call RPP_Taser_Effects;
		if (vehicle player != player) exitWith {
			_msg = 'You have been Tased!';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			disableUserInput true;
			sleep 8;
			disableUserInput false;
			[] call RPP_Taser_RemoveEffects;
		};

		[[player], 'RPP_TaserSound', true] call BIS_FNC_MP;
		_msg = 'You have been tased!';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		disableUserInput true;
		sleep 4;
		disableUserInput false;
		player setVariable ['RPP_Tased',false,true];
		[] call RPP_Taser_RemoveEffects;
	};
}] call RPP_Function;
publicVariable 'RPP_Tase_Player';

["RPP_Taser_Effects", {
[] spawn {
	while {player getVariable 'RPP_Tased'} do {
		if (!(player getVariable 'RPP_Tased')) exitWith {
			[] call RPP_Taser_RemoveEffects;
		};
		'colorCorrections' ppEffectEnable true; 'chromAberration' ppEffectEnable true; 
		'radialBlur' ppEffectEnable true;
		'colorCorrections' ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [5,3.5,-5,-0.5], [-3,5,-5,-0.5]]; 
		'colorCorrections' ppEffectCommit 1;
		'chromAberration' ppEffectAdjust [0.01,0.01,true]; 
		'chromAberration' ppEffectCommit 1;
		'radialBlur' ppEffectAdjust [0.02,0.02,0.15,0.15]; 
		'radialBlur' ppEffectCommit 1;
		if (!(player getVariable 'RPP_Tased')) exitWith {
			[] call RPP_Taser_RemoveEffects;
		};
		sleep 0.5;
		'colorCorrections' ppEffectEnable true; 'filmGrain' ppEffectEnable true;
		'filmGrain' ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  'filmGrain' ppEffectCommit 1; 
 		'colorCorrections' ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 'colorCorrections' ppEffectCommit 1;
 		'colorCorrections' ppEffectEnable true; 'chromAberration' ppEffectEnable true; 'radialBlur' ppEffectEnable true;
 		if (!(player getVariable 'RPP_Tased')) exitWith {
			[] call RPP_Taser_RemoveEffects;
		};
 		sleep 2.6;
		'colorCorrections' ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [5,3.5,-5,-0.5], [-3,5,-5,-0.5]]; 'colorCorrections' ppEffectCommit 1;
		'chromAberration' ppEffectAdjust [0.01,0.01,true]; 'chromAberration' ppEffectCommit 1;
		'radialBlur' ppEffectAdjust [0.02,0.02,0.15,0.15]; 'radialBlur' ppEffectCommit 1;
		sleep 2.3;
 		if (!(player getVariable 'RPP_Tased')) exitWith {
			[] call RPP_Taser_RemoveEffects;
		};
	};
};
}] call RPP_Function;
publicVariable 'RPP_Taser_Effects';

["RPP_Taser_RemoveEffects", {
	'colorCorrections' ppEffectEnable false; 
	'filmGrain' ppEffectEnable false;
	'colorCorrections' ppEffectEnable false;
	'chromAberration' ppEffectEnable false;
	'radialBlur' ppEffectEnable false;	
}] call RPP_Function;
publicVariable 'RPP_Taser_RemoveEffects';

["RPP_TaserSound", {
	private ['_Tased'];
	_tased = _this select 0;
	_tased say3d 'RPP_Taser';
}] call RPP_Function;
publicVariable 'RPP_TaserSound';