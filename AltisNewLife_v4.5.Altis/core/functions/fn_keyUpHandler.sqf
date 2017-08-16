private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_owners","_index"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
if(life_action_inUse) exitWith {_handled};
switch (_code) do
{
	//BACK KEY
	case 31:
	{
		if(vehicle player != player && ((driver vehicle player) == player)) then
		{
			vehicle player setVariable["reverse",false,true];
		};
	};
};
if (_code in (actionKeys "NextAction") || _code in (actionKeys "PrevAction")) then {
	if (!life_show_actions) then
	{
		[] spawn life_fnc_enableActions;
	};
};
_handled;