
disableSerialization;
switch (_this select 0) do
{
	case "addSingle":
	{
		_index = lbAdd [632, lbText [633, lbCurSel 633]];
		lbSetData [632, _index, lbData [633, lbCurSel 633]];
		lbSetValue [632, _index, lbValue [633, lbCurSel 633]];
	};
	case "addAll":
	{
		for "_i" from 0 to ((lbSize 633) - 1) do
		{
			_index = lbAdd [632, lbText [633, _i]];
			lbSetData [632, _index, lbData [633, _i]];
			lbSetValue [632, _index, lbValue [633, _i]];
		};
	};
	case "removeSingle":
	{
		lbDelete [632, lbCurSel 632];
	};
	case "removeAll":
	{
		lbClear 632;
	};
	case "create":
	{
		CLAY_RadioCustomMusic = [];
		for "_i" from 0 to ((lbSize 632) - 1) do
		{
			CLAY_RadioCustomMusic = CLAY_RadioCustomMusic + [[lbData [632, _i], lbText [632, _i], lbValue [632, _i]]];
		};
		CLAY_RadioSrc = 4;
		CLAY_RadioTrack = 0;

		["sourceUp"] spawn Repentz_fnc_settings;
		sleep 0.1;

		closeDialog 0;
		[] spawn Repentz_fnc_radio;
	};
	case "restore":
	{
		lbClear 632;
		for "_i" from 0 to ((count CLAY_CarRadio_UserPlaylist) - 1) do
		{
			_act = CLAY_CarRadio_UserPlaylist select _i;
			_track = _act select 0;
			_title = _act select 1;
			_t = _act select 2;
			
			_index = lbAdd [632, _title];
			lbSetData [632, _index, _track];
			lbSetValue [632, _index, _t];
		};
	};
};
