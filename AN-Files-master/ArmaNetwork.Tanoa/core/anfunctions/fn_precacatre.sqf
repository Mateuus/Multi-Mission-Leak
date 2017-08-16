_object = param [0,objNull,[objNull]];
if(life_action_inUse || {playerSide in [civilian,independent]}) exitWith {};
if(isNull _object) exitWith {};
switch (typeOf _object) do
{
  case "Land_Razorwire_F":
  {
    if(!(["spikeStrip",1] call life_fnc_virtualItemAdd)) exitWith
    {
      hintSilent "Not enough space for the spikestrip!";
    };
    life_action_inUse = true;
    deleteVehicle _object;
    hintSilent "You've picked up an object!";
  };
};
[] spawn
{
  sleep 2;
  life_action_inUse = false;
};
