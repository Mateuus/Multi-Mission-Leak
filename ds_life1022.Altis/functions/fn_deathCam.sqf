/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	We don't want people meta gaming their dead body, make them fly around the map instead and chill
*/

private ["_markers","_firstLoop","_counter","_deathCam","_location"];

disableSerialization;

_markers = ["civ_spawn_1","jobMarker14","jobMarker19","hospital_2"];
DS_blockEsc = (findDisplay 666670) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
_firstLoop = true;
_counter = 0;
_deathCam = "camera" camCreate [((getPos player) select 0)+(random 3000),((getPos player) select 1)+(random 4000),((getPos player) select 2)+520];
showCinemaBorder true;
_deathCam cameraEffect ["Internal","BACK"];
_location = (selectRandom _markers);
_deathCam camSetTarget (getMarkerPos _location);
_deathCam camSetRelPos [0,0,320.5];
_deathCam camSetFOV 2.000;
_deathCam camCommit 120;

while{true}do {
	if((!_firstLoop)&&(player distance spawnIsland > 500))exitwith{};//Respawned
	sleep 2;
	_counter = _counter + 2;
	if(_counter > 10)then {
		_firstLoop = false;
		_location = (selectRandom _markers);
		_deathCam camSetTarget (getMarkerPos _location);
		_deathCam camSetRelPos [0,0,320.5];
		_deathCam camSetFOV 2.000;
		_deathCam camCommit 120;
		_counter = 0;
	};
};

(findDisplay 666670) displayRemoveEventHandler ["KeyDown",DS_blockEsc];
closeDialog 0;
_deathCam cameraEffect ["Terminate","BACK"];
camDestroy _deathCam;
player allowDamage true;