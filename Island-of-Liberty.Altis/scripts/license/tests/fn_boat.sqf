private["_check1","_check2","_check3","_check4","_check5","_check6"];

player setpos (getMarkerPos "boating_start");
sleep 2;
_sec = 0;
_min = 0;
license_prog = true;
license_granted = false;
_waypoint = false;

_check1 = false; _check2 = false; _check3 = false; _check4 = false; _check5 = false; _check6 = false;

_owners = getPlayerUID player;
vehicle1 = "C_Boat_Civil_01_F" createVehicle (getMarkerPos "boating_start");
vehicle1 setVariable["vehicle_info_owners",_owners,true];

player moveindriver vehicle1;

sleep 2;

while {license_prog} do
{
	if (vehicle player == player) exitwith {license_prog = false; };
		if (!_waypoint) then {
			if ((player distance (getmarkerpos "boating")) < 7) then {
				_check1 = true; titleText [localize("STR_License_checkpoint"), "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_1")) < 7) then {
				_check2 = true;  titleText [localize("STR_License_checkpoint"), "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_2")) < 7) then {
				_check3 = true;  titleText [localize("STR_License_checkpoint"), "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_3")) < 7) then {
				_check4 = true;  titleText [localize("STR_License_checkpoint"), "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_4")) < 7) then {
				_check5 = true; titleText [localize("STR_License_checkpoint"), "PLAIN"];
			};
			if ((player distance (getmarkerpos "boating_5")) < 7) then {
				_check6 = true;  titleText [localize("STR_License_checkpoint"), "PLAIN"];
			};
		};
			if ( _check1 && _check2 && _check3 && _check4 && _check5 && _check6) then {	
	
				if (!_waypoint) then {
					_waypoint = true;
					ziel_marker= createMarkerLocal ["auftrags_ziel_marker", position player ];
					"auftrags_ziel_marker" setMarkerBrushLocal "Cross";
					"auftrags_ziel_marker" setMarkerColorLocal "ColorRed";
					"auftrags_ziel_marker" setMarkerPosLocal (getmarkerpos "boating_end");
					"auftrags_ziel_marker" setMarkerTypeLocal "hd_WARNING"; 
					"auftrags_ziel_marker" setMarkerTextLocal "Dein Ziel befindet sich hier";
					"auftrags_ziel_marker" setMarkerSizeLocal [1, 1];
					titleText [(localize "STR_License_boat_endt"), "PLAIN"];
				
				};
				
				if ((player distance (getmarkerpos "boating_end")) < 10) then {
					license_granted = true; titleText ["GOAL Reached...", "PLAIN"];
				};			
			};
			if (license_granted) exitwith {license_prog = false;};
			_sec = _sec + 1;
			if (_sec >= 60) then {
				_sec = 0;
				_min = _min + 1;
			};
			if (_min >= 4) exitwith {
				license_prog = false;			
			};
			hintsilent format[(localize "STR_Licensing_truck_making"), _sec, _min];
		sleep 1;
};
									
sleep 5;
if (license_granted) then {	
	hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Boat"];
	license_civ_boat = true;
 } else {
	hint (localize "STR_Licensing_car_EndFail");
};

deleteMarkerLocal "auftrags_ziel_marker";	
licenser_obj setvariable ["boat", false, true];

deletevehicle vehicle1; 
sleep 0.5;
player setPos LICENSER_POS_BACK;