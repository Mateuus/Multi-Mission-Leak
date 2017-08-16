/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	We don't want people meta gaming their dead body, make them fly around the map instead and chill
*/
private ["_markers","_location","_counter","_firstLoop","_deathCam"];
disableSerialization;
_markers =
["camTest1","camTest2","camTest3","camTest4"];
DS_blockEsc = (findDisplay 666670) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; 
_firstLoop = true;
_counter = 0;
_deathCam  = "CAMERA" camCreate [(position player select 0)+(random 3000),(position player select 1)+(random 4000),(position player select 2)+220];
showCinemaBorder TRUE;
_deathCam cameraEffect ["Internal","Back"];
_location = (floor(random(count _markers)));
_location = (_markers select _location);
_deathCam camSetTarget (getMarkerPos _location);
_deathCam camSetRelPos [0,0,220.5];
_deathCam camSetFOV 2.000;
_deathCam camCommit 120;
	
while{true}do
	{
	if((!_firstLoop)&&(player distance spawnIsland > 500))exitwith{};//Respawned
	sleep 2;
	_counter = _counter + 2;
	if(_counter > 10)then
		{
		_firstLoop = false;
		_location = (floor(random(count _markers)));
		_location = (_markers select _location);
		_deathCam camSetTarget (getMarkerPos _location);
		_deathCam camSetRelPos [0,0,220.5];
		_deathCam camSetFOV 2.000;
		_deathCam camCommit 120;
		_counter = 0;
		};
	};
(findDisplay 666670) displayRemoveEventHandler ["KeyDown", DS_blockEsc];	
closeDialog 0;	
_deathCam cameraEffect ["TERMINATE","BACK"];
camDestroy _deathCam;
player allowDamage true;