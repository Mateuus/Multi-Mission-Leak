/*

	fn_xray.sqf
	Author: G00golplexian

	Description: X-rays the player for roleplay reasons.
*/
private["_xrayedperson", "_pos"];
_pos = _this select 3;

switch(_pos) do {

	case 0: {
		_xrayedperson = nearestObjects [roentgenkabine, ["Man"], 2];

		[roentgenkabine, "beep"] remoteExecCall ["say3D",0];
		sleep 1;
		[roentgenkabine, "xray"] remoteExecCall ["say3D",0];
		sleep 14;
		[roentgenkabine, "beep"] remoteExecCall ["say3D",0];
		["Verstrahlt"] remoteExecCall ["life_fnc_zustand",_xrayedperson];
		sleep 2;
		roentgenkabine animate ["door_1_rot",1];
		sleep 5;
		roentgenkabine animate ["door_1_rot",0];
	};

	case 1: {
		_xrayedperson = nearestObjects [roentgenkabine2, ["Man"], 2];

		[roentgenkabine2, "beep"] remoteExecCall ["say3D",0];
		sleep 1;
		[roentgenkabine2, "xray"] remoteExecCall ["say3D",0];
		sleep 14;
		[roentgenkabine2, "beep"] remoteExecCall ["say3D",0];
		["Verstrahlt"] remoteExecCall ["life_fnc_zustand",_xrayedperson];
		sleep 2;
		roentgenkabine2 animate ["door_1_rot",1];
		sleep 5;
		roentgenkabine2 animate ["door_1_rot",0];
	};


	case 2: {
		_xrayedperson = nearestObjects [roentgenkabine3, ["Man"], 2];

		[roentgenkabine3, "beep"] remoteExecCall ["say3D",0];
		sleep 1;
		[roentgenkabine3, "xray"] remoteExecCall ["say3D",0];
		sleep 14;
		[roentgenkabine3, "beep"] remoteExecCall ["say3D",0];
		["Verstrahlt"] remoteExecCall ["life_fnc_zustand",_xrayedperson];
		sleep 2;
		roentgenkabine3 animate ["door_1_rot",1];
		sleep 5;
		roentgenkabine3 animate ["door_1_rot",0];
	};

	case 3: {
		_xrayedperson = nearestObjects [roentgenkabine4, ["Man"], 2];

		[roentgenkabine4, "beep"] remoteExecCall ["say3D",0];
		sleep 1;
		[roentgenkabine4, "xray"] remoteExecCall ["say3D",0];
		sleep 14;
		[roentgenkabine4, "beep"] remoteExecCall ["say3D",0];
		["Verstrahlt"] remoteExecCall ["life_fnc_zustand",_xrayedperson];
		sleep 2;
		roentgenkabine4 animate ["door_1_rot",1];
		sleep 5;
		roentgenkabine4 animate ["door_1_rot",0];
	};
};