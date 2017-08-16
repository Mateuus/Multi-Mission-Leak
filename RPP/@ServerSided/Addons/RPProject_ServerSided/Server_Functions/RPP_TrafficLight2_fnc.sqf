/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_TrafficLight2.sqf

Description:
Traffic Lights
*/
RPP_TrafficLight2_Server = {
	[_this select 0] spawn {
		private ["_TrafficLight","_GreenDefult"];
		_TrafficLight = _this select 0;
		_Defult = "#(argb,8,8,3)color(0,0,0,1.0,co)";

		_TrafficLight setObjectTexture [0, _Defult];
		_TrafficLight setObjectTexture [1, _Defult];

		sleep 1;
		while {isServer} do {
			_TrafficLight setobjecttexture [0, _Defult];
			_TrafficLight setobjecttexture [1, _Defult];

			//Green light
			_TrafficLight setobjecttexture [1,"#(argb,8,8,3)color(0,1,0,1.0,co)"];

			sleep 10;
			_TrafficLight setobjecttexture [0, _Defult];
			_TrafficLight setobjecttexture [1, _Defult];

			sleep 0.5;
			_TrafficLight setObjectTexture [0, _Defult];
			_TrafficLight setObjectTexture [1, _Defult];

			//Red light
			_TrafficLight setobjecttexture [0,"#(argb,8,8,3)color(1,0,0,1.0,co)"];
			sleep 10;
		};
	};
};
publicVariable "RPP_TrafficLight2_Server";