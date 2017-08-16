/*
	Author: Maverick Applications
	Desc: Altis Life SpeedCameras
*/
private["_object","_positions"];
if(isServer) exitWith {
	speedcameras = [];
    {
        _object = createSimpleObject [((str missionConfigFile select [0, count str missionConfigFile - 15]) + "Maverick\SpeedCameras\Models\maverick_speedCamera.p3d"), (_x select 0)];
        _object setPosATL (_x select 0);
        _object setDir (_x select 1);
		speedcameras pushBack _object;
    } forEach (getArray(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedCameras"));
	publicVariable "speedcameras";
};

_positions = [];
{_positions pushBack (_x select 0);} forEach (getArray(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedCameras"));

if(count _positions > 0 && playerSide != west) exitWith {
    [_positions] spawn {

        private["_positions","_speed"];

        _positions = (_this select 0);

        life_speed = false;
		
        while {true} do {

            waitUntil{((vehicle player) != (player)) && ((driver (vehicle player)) == (player))};
			
            {	
                if(((getPosATL player) distance2D _x) <= 40 && !life_speed && ((((vehicle player) getRelDir (speedcameras select _ForEachIndex)) > 1) && (((vehicle player) getRelDir (speedcameras select _ForEachIndex)) < 120)) && (((speedcameras select _ForEachIndex) getRelDir (vehicle player)) < 120 && ((speedcameras select _ForEachIndex) getRelDir (vehicle player)) > 40)) then {

                    _speed = (((getArray(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedCameras")) select _ForEachIndex) select 2);
					
                    if((speed (vehicle player)) > _speed) then {

						life_speed = true;

						"colorCorrections" ppEffectEnable true;
						"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
						"colorCorrections" ppEffectCommit 0;
						"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
						"colorCorrections" ppEffectCommit 0.05;
						sleep 0.1337;
						"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
						"colorCorrections" ppEffectCommit 0;
						"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];
						"colorCorrections" ppEffectCommit 0.05;
						sleep 0.234;
						"colorCorrections" ppEffectEnable false;

						_text = "<t color='#cc1f00'><t size='2'><t align='center'>Speed Camera</t></t><t color='#ffffff'><br/><br/>";
						_text = _text + format[(getText(missionConfigFile >> "Maverick_SpeedCameras" >> "InfoMSG")), round((speed (vehicle player)) - _speed)];
						
						if((getNumber(missionConfigFile >> "Maverick_SpeedCameras" >> "RemoveDriverLicense")) > 0) then {
							if(license_civ_driver) then {
								license_civ_driver = false;
								_text = _text + "<br/>" + (getText(missionConfigFile >> "Maverick_SpeedCameras" >> "RemoveDriverLicenseMSG"));
							};
						};
						
						if((getNumber(missionConfigFile >> "Maverick_SpeedCameras" >> "RemoveTruckLicense")) > 0) then {
							if(isNil "life_versionInfo") then {
								if(license_civ_trucking) then {
									license_civ_trucking = false;
									_text = _text + "<br/>" + (getText(missionConfigFile >> "Maverick_SpeedCameras" >> "RemoveTruckLicenseMSG"));
								};
							} else {
								if(license_civ_truck) then {
									license_civ_truck = false;
									_text = _text + "<br/>" + (getText(missionConfigFile >> "Maverick_SpeedCameras" >> "RemoveTruckLicenseMSG"));
								};
							};
						};
						
						if((getNumber(missionConfigFile >> "Maverick_SpeedCameras" >> "AddPlayerToWanted")) > 0) then {
							[getPlayerUID player,profileName,(getText(missionConfigFile >> "Maverick_SpeedCameras" >> "WantedCase"))] remoteExecCall ["life_fnc_wantedAdd",2];
							_text = _text + "<br/>" + (getText(missionConfigFile >> "Maverick_SpeedCameras" >> "AddPlayerToWantedMSG"));
						};
						
						if((getNumber(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedingFee")) > 0) then {
							life_atmbank = life_atmbank - (getNumber(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedingFee"));
							if(life_atmbank < 0 ) then {
								life_atmbank = 0;
							};
							_text = _text + "<br/>" + format[(getText(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedingFeeMSG")), (getNumber(missionConfigFile >> "Maverick_SpeedCameras" >> "SpeedingFee"))];
						};

						hint parseText _text;
						
						[] spawn {
							uiSleep 10;
							life_speed = false;
						};
                    };
                };
            } forEach _positions;

            uiSleep 1.2;
        };
    };
};