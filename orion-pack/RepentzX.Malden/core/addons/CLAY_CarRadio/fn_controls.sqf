
if !((("Car" countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)) exitWith {};

disableSerialization;
CLAY_RadioEndTimer = true;
if (isNil "CLAY_RadioLastButtonClick") then {CLAY_RadioLastButtonClick = 0;};
if ((CLAY_RadioLastButtonClick + 2) > diag_tickTime) exitWith {};

CLAY_RadioLastButtonClick = diag_tickTime;


switch (_this select 0) do
{
	case "play":
	{
		if (count CLAY_RadioPlayList == 0) exitWith {["No music in the Playlist",false,"slow"] call life_fnc_notificationSystem;};
		CLAY_RadioManualControl = true;
		if (CLAY_RadioPlaying) then
		{
			CLAY_RadioPlaying = false;
			playMusic "";
			ctrlSetText [626, ">"];
			sleep 2;
			CLAY_RadioManualControl = false;
		}
		else
		{
			CLAY_RadioPlaying = true;
			ctrlSetText [626, "||"];

			_act = CLAY_RadioPlayList select CLAY_RadioTrack;
			_track = _act select 0;
			_title = _act select 1;
			
			[] spawn Repentz_fnc_play;

			playMusic _track;
			ctrlSetText [610, _title];
			if (!dialog) then {titletext [format ["%1", _title], "PLAIN DOWN"];};
		};
	};
	case "pre":
	{
		
		if (count CLAY_RadioPlayList == 0) exitWith {["Keine Musik in der Playlist",false,"slow"] call life_fnc_notificationSystem;};
		CLAY_RadioManualControl = true;
		private ["_act"];
		if (CLAY_RadioRandom) then
		{
			_rnd = floor (random (count CLAY_RadioPlayList));
			_act = CLAY_RadioPlayList select _rnd;
			CLAY_RadioTrack = _rnd;
		}
		else
		{
			CLAY_RadioTrack = CLAY_RadioTrack - 1;
			if (CLAY_RadioTrack < 0) then
			{
				CLAY_RadioTrack = ((count CLAY_RadioPlayList) - 1);
			};
			_act = CLAY_RadioPlayList select CLAY_RadioTrack;
		};

		CLAY_RadioPlaying = true;
		ctrlSetText [626, "||"];

		_track = _act select 0;
		_title = _act select 1;
		_t = _act select 2;
		
		[_t] spawn Repentz_fnc_play;
		ctrlSetText [610, _title];
		ctrlSetText [606, "0:00"];

		playMusic _track;
		if (!dialog) then {titletext [format ["%1", _title], "PLAIN DOWN"];};
		sleep 2;
		CLAY_RadioManualControl = false;
	};
	case "next":
	{
		if (count CLAY_RadioPlayList == 0) exitWith {["No music in the Playlist",false,"slow"] call life_fnc_notificationSystem;};
		CLAY_RadioManualControl = true;
		private ["_act"];
		if (CLAY_RadioRandom) then
		{
			CLAY_RadioPlaying = true;
			ctrlSetText [626, "||"];

			_rnd = floor (random (count CLAY_RadioPlayList));
			_act = CLAY_RadioPlayList select _rnd;
			CLAY_RadioTrack = _rnd;
			_track = _act select 0;
			_title = _act select 1;
			//_t = _act select 2;

			[] spawn Repentz_fnc_play;
			ctrlSetText [610, _title];
			ctrlSetText [606, "0:00"];

			playMusic _track;
			if (!dialog) then {titletext [format ["%1", _title], "PLAIN DOWN"];};
		}
		else
		{
			CLAY_RadioTrack = CLAY_RadioTrack + 1;
			if (CLAY_RadioTrack >= count CLAY_RadioPlayList) then
			{
				CLAY_RadioTrack = 0;
				if ((_this select 1 == 1) || CLAY_RadioRepeat) then
				{
					CLAY_RadioPlaying = true;
					ctrlSetText [626, "||"];

					_act = CLAY_RadioPlayList select CLAY_RadioTrack;
					_track = _act select 0;
					_title = _act select 1;
					//_t = _act select 2;

					[] spawn Repentz_fnc_play;
					ctrlSetText [610, _title];
					ctrlSetText [606, "0:00"];

					playMusic _track;
					if (!dialog) then {titletext [format ["%1", _title], "PLAIN DOWN"];};
				}
				else
				{
					CLAY_RadioPlaying = false;

					playMusic "";
					ctrlSetText [610, ""];
					ctrlSetText [626, ">"];
				};
			}
			else
			{

				CLAY_RadioPlaying = true;
				ctrlSetText [626, "||"];

				_act = CLAY_RadioPlayList select CLAY_RadioTrack;
				_track = _act select 0;
				_title = _act select 1;
				//_t = _act select 2;

				[] spawn Repentz_fnc_play;
				ctrlSetText [610, _title];
				ctrlSetText [606, "0:00"];

				playMusic _track;
				if (!dialog) then {titletext [format ["%1", _title], "PLAIN DOWN"];};
			};
		};
		sleep 2;
		CLAY_RadioManualControl = false;
	};
};
