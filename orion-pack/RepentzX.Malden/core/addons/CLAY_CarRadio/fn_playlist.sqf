
disableSerialization;
closeDialog 0;
CLAY_RadioPlaylistEditor = createDialog "CLAY_CarRadio_PlaylistDlg";


_allTracks = CLAY_RadioGameMusic + DWEV_RadioAddonMusic;
If (!(isNil "CLAY_RadioAddMusic")) Then {_allTracks = _allTracks + CLAY_RadioAddMusic};


for "_i" from 0 to ((count _allTracks) - 1) do
{
	_act = _allTracks select _i;
	_track = _act select 0;
	_title = _act select 1;
	_t = 0;
	
	_index = lbAdd [633, _title];
	lbSetData [633, _index, _track];
	lbSetValue [633, _index, _t];
};

for "_i" from 0 to ((count CLAY_RadioCustomMusic) - 1) do
{
	_act = CLAY_RadioCustomMusic select _i;
	_track = _act select 0;
	_title = _act select 1;
	_t = 0;
	
	_index = lbAdd [632, _title];
	lbSetData [632, _index, _track];
	lbSetValue [632, _index, _t];
};
