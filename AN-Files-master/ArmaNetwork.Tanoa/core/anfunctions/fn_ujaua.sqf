if(life_action_inUse || {playerSide in [civilian,independent]}) exitWith {};
_strip = (nearestObject [player,'Land_razorwire_F']);
if(isNull _strip) exitWith {};

if(!(["spikeStrip",1] call life_fnc_virtualItemAdd)) exitWith {hintSilent "Not enough space for the spikestrip!";};
life_action_inUse = true;
deleteVehicle _strip;
hintSilent "You've packed up the spikestrip!";

[] spawn {
  sleep 2;
  life_action_inUse = false;
};
