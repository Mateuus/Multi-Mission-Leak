while {PG_fnc_houseMarkersOn} do {
	{deleteMarker _x} forEach PG_houseMarkers;
	PG_houseMarkers = [];
	{
		if((_x getVariable ["house_owner","meh"]) isEqualTo "meh") then {
			_marker = createMarkerLocal [format["%1_house_marker",_x],visiblePosition _x];
			if(typeOf _x in ["Land_i_Garage_V1_F","Land_i_Garage_V1_F"]) then {
				_marker setMarkerTypeLocal "c_car";
				_marker setMarkerTextLocal "Garage";
				_marker setMarkerColorLocal "ColorBlue";
			} else {
				_marker setMarkerTypeLocal "loc_Tourism";
				_marker setMarkerTextLocal "Haus";
				_marker setMarkerColorLocal "ColorGreen";
			};
			PG_houseMarkers pushBack _marker;

		}
	}forEach nearestObjects [player,[
										"Land_i_Garage_V1_F",
										"Land_i_Garage_V1_F",
										"Land_i_Stone_HouseSmall_V3_F",
										"Land_i_Stone_HouseSmall_V1_F",
										"Land_i_Stone_HouseSmall_V2_F",
										"Land_i_Stone_HouseSmall_V3_F",
										"Land_i_House_Small_01_V1_F",
										"Land_i_House_Small_01_V2_F",
										"Land_i_House_Small_01_V3_F",
										"Land_i_House_Small_02_V1_F",
										"Land_i_House_Small_02_V2_F",
										"Land_i_House_Small_02_V3_F",
										"Land_i_House_Small_03_V1_F",
										"Land_i_House_Big_01_V1_F",
										"Land_i_House_Big_01_V2_F",
										"Land_i_House_Big_01_V3_F",
										"Land_i_House_Big_02_V1_F",
										"Land_i_House_Big_02_V2_F",
										"Land_i_House_Big_02_V3_F"										
									],2000];
	waitUntil{sleep 0.1; !visibleMap};
	waitUntil{sleep 0.1; visibleMap || !PG_fnc_houseMarkersOn};
};
{deleteMarker _x} forEach PG_houseMarkers;