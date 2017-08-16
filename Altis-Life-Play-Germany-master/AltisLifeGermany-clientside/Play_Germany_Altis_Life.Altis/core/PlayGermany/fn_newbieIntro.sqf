/*
	File: fn_newbieIntro.sqf
	Author: RafiQuak for Play Germany http://play-germany.de

	Description:
	Creates a special intro cam for newbies (optional with text)
*/
private ["_camera", "_cams","_text"];

/*
##############################
		Cam positions
[startPos,endPos,target,time]
##############################
*/
_cams = [
	[[3089.5,12385.9,227.96],[3688.41,13476.3,230.226],[3616.4,13113.6,0],10,""], //fly over Kavalla
	[[3089.5,12385.9,227.96],[3688.41,13476.3,230.226],[3616.4,13113.6,0],10,""], //fly over Kavalla
	[[3089.5,12385.9,227.96],[3688.41,13476.3,230.226],[3616.4,13113.6,0],10,""], //fly over Kavalla
	[[3089.5,12385.9,227.96],[3688.41,13476.3,230.226],[3616.4,13113.6,0],10,""] //fly over Kavalla
];

/*
##############################
		  Do cams
##############################
*/

// intro music
player say2D "pgintrork"; //toDo: special music?

// init cam
showCinemaBorder true;
camUseNVG false;
_camera = "camera" camCreate ((_cams select 0) select 0);
_camera cameraEffect ["internal","back"];
_camera camSetTarget ((_cams select 0) select 2);
_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

{
	//go to new startPos
	_camera camSetPos (_x select 0);
	_camera camSetTarget (_x select 2);
	_camera camCommit 0;
	//text
	_text = _x select 4;
	if(!isNil "_text" && _text != "") then {
		[_text, -1, 0.7, (_x select 3), 0, 0, 11126] spawn BIS_fnc_dynamicText;
	};
	waitUntil {camCommitted _camera};
	//transition
	_camera camSetPos (_x select 0);
	_camera camCommit (_x select 3);
	waitUntil {camCommitted _camera};
} foreach _cams;

//clean up
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

[] spawn PG_fnc_IntroCam;