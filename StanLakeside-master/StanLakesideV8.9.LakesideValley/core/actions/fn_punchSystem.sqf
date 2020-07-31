/*
	fn_punchSystem.sqf
*/
if(currentWeapon player != "") exitwith {};
if(life_action_inuse) exitWith {};
if(life_istazed) exitWith {};
if((animationState player) == "Incapacitated") exitWith {};

life_action_inUse = true;
_koilsucks = round (random 2);
_curHit = cursortarget;

switch (true) do
{
	case (_koilsucks == 0): { 
		player playaction "MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct";
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 2 ) then
		{
			["Remove",0.07] remoteExecCall ["fnc_doHealth",_curHit];
			[player,"punch1"] spawn life_fnc_nearestSound;
		};
	};
	case (_koilsucks == 1): { 
		player playaction "MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Left_Direct";
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 2 ) then
		{
			["Remove",0.1] remoteExecCall ["fnc_doHealth",_curHit];
			[player,"punch2"] spawn life_fnc_nearestSound;

			_chance = (floor random 10);
			if(_chance > 7) then {
				[cursortarget,"grunt"] spawn life_fnc_nearestSound;
				cursortarget playmovenow "DeadState";
			};

		};
	};
	case (_koilsucks == 2): { 
		player playaction "MOCAP_Man_Act_Idle_Stay_CivPace_Non_Push_Kick_LeftLeg";
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 2 ) then
		{
			["Remove",0.04] remoteExecCall ["fnc_doHealth",_curHit];
			[player,"punch3"] spawn life_fnc_nearestSound;
		};
	};
	default { 
		player playaction "MOCAP_Man_Act_Non_CivPace_Non_Punch_Hand_Right_Direct";
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 2 ) then
		{
			["Remove",0.05] remoteExecCall ["fnc_doHealth",_curHit];
			[player,"punch4"] spawn life_fnc_nearestSound;
		};
	};
};

uiSleep 2;

life_action_inuse = false;


