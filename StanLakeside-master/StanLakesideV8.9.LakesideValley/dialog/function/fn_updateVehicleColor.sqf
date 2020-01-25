/*
	fn_updateVehicleColor.sqf
	Pennyworth
*/

life_showRoomVehicle setObjectTextureGlobal [0, format ["#(argb,8,8,3)color(%1,%2,%3,1.0,CO)",(sliderPosition 17501)/10,(sliderPosition 17502)/10,(sliderPosition 17503)/10]];
life_showRoomVehicle setVariable ["Red", str ((sliderPosition 17501)/10), true];
life_showRoomVehicle setVariable ["Green", str ((sliderPosition 17502)/10), true];  
life_showRoomVehicle setVariable ["Blue", str ((sliderPosition 17503)/10), true];
closeDialog 0;