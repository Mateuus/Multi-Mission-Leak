_namesubject = _this select 2;
mycv = cameraView;
spect =
{
	_splr = _this select 0;
	F3_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3D) then {spectate = false;};"];
	(vehicle _splr) switchCamera "EXTERNAL";
	titleText ["Spectating...","PLAIN DOWN"];titleFadeOut 4;
	waitUntil { !(alive _splr) or !(alive player) or !(spectate)};
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F3_EH];
	player switchCamera mycv;
};


if (isNil "spectate") then {spectate = true;} else {spectate = !spectate;};

{
	if(name _x == _namesubject) then {
		[_x] call spect;
	};



} foreach (playableunits - [player]);
