/*
	File: fn_mouseUpHandler.sqf
	Author: Chronic [MIT]

	Description:
	Main key handler for event 'mouseButtonUp'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

switch (_code) do {
	// left mouse
	case 0:
	{ // this action is for ending the airhorn sound on a vehicle when the left mouse button is released

		// if the player is in a vehicle
		if(vehicle player != player) then {

			// is this vehicle's airhorn active?
			if(isNil "life_hornLogic") then {
				life_hornLogic = objNull;
			};

			// if it is, then let's stop that sound
			if(!isNull life_hornLogic) then {

				// let's do it all in a spawned script so we can sleep
				[] spawn {

					// how long has the horn been sounding?
					_hornTime = time - (life_hornLogic getVariable ["startTime", 0]);

					// we want it to sound for a minimum of 0.3 seconds. Calculate how much longer we need to let it play for that to work
					_diff = 0.3 - _hornTime;

					// if we need to wait to complete that 0.3 seconds, then do it
					if(_diff > 0) then {
						sleep _diff;
					};

					// delete the object that is playing the sound
					deleteVehicle life_hornLogic;

					// set that variable to null
					life_hornLogic = objNull;
				};
			};
		};
	};
};

if (life_show_actions) then
{
	life_show_actions = false;
	removeAllActions player;
	life_actions = [];
};

_handled