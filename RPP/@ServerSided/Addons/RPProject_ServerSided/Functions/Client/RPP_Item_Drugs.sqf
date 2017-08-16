/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Item_Drugs.sqf

Description:
using drugs
*/
["RPP_Item_Drugs_Use", {
	_Type = _this select 0;
	_effect = 0;
	_call = "";
	{
		if (_Type == _x select 0) exitWith {
			_effect = _x select 1;
			_call = _x select 2;
			_time = _x select 3;
		};
	} count RPP_Drug_Effect;

	_Count = for '_i' from 1 to RPP_UseItemAmount do {
		_effect = _effect + _effect;
		_time = _time + _time;
	};
	
	call compile format ["[_effect,_time] call %1",_call];
	[player,"RPP_SmokeWeed"] call RPP_PlaySound_Global_Player;
}] call RPP_Function;
publicVariable "RPP_Item_Drugs_Use";

["RPP_Item_Drugs_LSD_Time", {
	[_this select 0] spawn {
		_Timer = _this select 0;

		while {player getVariable "RPP_LSD"} do {
	 	 	sleep 1;
	  		_Timer = _Timer - 1;

	  		if (!(player getVariable 'RPP_LSD')) exitWith {
				[] call RPP_Item_Drugs_LSD_RemoveEffects;
			};

	  		if (_Timer <= 0) exitWith {
	  			player setVariable ["RPP_LSD",false,true];
	  			player setVariable ["RPP_LSD_Amount",0,true];
	  			[] call RPP_Item_Drugs_LSD_RemoveEffects;
	  		};
		};
	};

	[] spawn {
		while {player getVariable "RPP_LSD"} do {
			LSD_Smoke = "SmokeShellBlue" createVehicle (position player);
			LSD_Smoke attachto [vehicle player, [0,0,0]];
			sleep 55;
			LSD_Smoke = "SmokeShellGreen" createVehicle (position player);
			LSD_Smoke attachto [vehicle player, [0,0,0]];
			sleep 55;
		};
	};
	sleep 1;
	[] spawn {
		while {player getVariable "RPP_LSD"} do {
		 	if (vehicle player != player) then {
		 		LSD_Smoke attachto [vehicle player, [-0.5,-0.5,-0.5]];
		 	} else {
		 		LSD_Smoke attachto [vehicle player, [0,0,0]];
		 	};
		 	sleep 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Item_Drugs_LSD_Time";

["RPP_Item_Drugs_LSD_Effects", {
[_this select 0,_this select 1] spawn {
	_amount = _this select 0;
	_time = _this select 1;

	[_time] call RPP_Item_Drugs_LSD_Time;
	_msg = "ahhhhhhhh Drugssss";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	player setVariable ["RPP_LSD",true,true];
	player setVariable ["RPP_LSD_Amount",_amount,true];
	while {player getVariable 'RPP_LSD'} do {
		if (!(player getVariable 'RPP_LSD')) exitWith {
			[] call RPP_Item_Drugs_LSD_RemoveEffects;
		};
		'colorCorrections' ppEffectEnable true; 'filmGrain' ppEffectEnable true;
 		'colorCorrections' ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 'colorCorrections' ppEffectCommit 1;
 		'colorCorrections' ppEffectEnable true; 'chromAberration' ppEffectEnable true; 'radialBlur' ppEffectEnable true;
 		if (!(player getVariable 'RPP_LSD')) exitWith {
			[] call RPP_Item_Drugs_LSD_RemoveEffects;
		};
		sleep 1;
	};
};
}] call RPP_Function;
publicVariable 'RPP_Item_Drugs_LSD_Effects';

["RPP_Item_Drugs_LSD_RemoveEffects", {
	'colorCorrections' ppEffectEnable false; 
	'filmGrain' ppEffectEnable false;
	'colorCorrections' ppEffectEnable false;
	'chromAberration' ppEffectEnable false;
	'radialBlur' ppEffectEnable false;	
}] call RPP_Function;
publicVariable 'RPP_Item_Drugs_LSD_RemoveEffects';