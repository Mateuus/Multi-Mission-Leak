_object = param [0,objNull,[objNull]];
if (!life_isPlacing) exitWith {};
if (isNull life_objectPlacing) exitWith {};
detach _object;
switch (true) do {
  case (typeOf _object isEqualTo "Land_Razorwire_F"): {
  _object setPosATL [(getPosATL _object select 0),(getPosATL _object select 1),(getPosATLVisual player select 2)];
	_object enableSimulation true;
  _object setvectorup [0,0,1];
	_object setDamage 1;
    	[_object] remoteExec ["TON_fnc_spikeStrip",2];
  };
  default {};
};

life_isPlacing = false;
life_objectPlacing = ObjNull;
