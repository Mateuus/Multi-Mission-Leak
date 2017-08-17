
disableSerialization;
CLAY_RadioDialog = createDialog "CLAY_CarRadio_RadioDlg";


If (CLAY_RadioShowTooltips) Then
{
	_display = findDisplay 666;

	_control = _display displayCtrl 603;
	_control ctrlSetTooltip "volume up";
	_control ctrlCommit 0;

	_control = _display displayCtrl 604;
	_control ctrlSetTooltip "Leister";
	_control ctrlCommit 0;

	_control = _display displayCtrl 615;
	_control ctrlSetTooltip "Previous Track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 616;
	_control ctrlSetTooltip "Naechster Track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 617;
	_control ctrlSetTooltip "Next Playlist";
	_control ctrlCommit 0;

	_control = _display displayCtrl 618;
	_control ctrlSetTooltip "Previous Playlist";
	_control ctrlCommit 0;

	_control = _display displayCtrl 619;
	_control ctrlSetTooltip "Conclude";
	_control ctrlCommit 0;

	_control = _display displayCtrl 620;
	_control ctrlSetTooltip "Playlist Editor open";
	_control ctrlCommit 0;

	_control = _display displayCtrl 621;
	_control ctrlSetTooltip "To repeat AN/AUS";
	_control ctrlCommit 0;

	_control = _display displayCtrl 622;
	_control ctrlSetTooltip "Coincidence AN/AUS";
	_control ctrlCommit 0;

	_control = _display displayCtrl 623;
	_control ctrlSetTooltip "Change color";
	_control ctrlCommit 0;

	_control = _display displayCtrl 624;
	_control ctrlSetTooltip "Display Change color";
	_control ctrlCommit 0;

	_control = _display displayCtrl 625;
	_control ctrlSetTooltip "Change background";
	_control ctrlCommit 0;

	_control = _display displayCtrl 626;
	_control ctrlSetTooltip "Play/Pause";
	_control ctrlCommit 0;

	_control = _display displayCtrl 634;
	_control ctrlSetTooltip "Add";
	_control ctrlCommit 0;

	_control = _display displayCtrl 635;
	_control ctrlSetTooltip "Add All";
	_control ctrlCommit 0;

	_control = _display displayCtrl 636;
	_control ctrlSetTooltip "Remove selected track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 637;
	_control ctrlSetTooltip "Remove all tracks";
	_control ctrlCommit 0;

	_control = _display displayCtrl 640;
	_control ctrlSetTooltip "Restore User-Defined Playlist";
	_control ctrlCommit 0;
};


if (CLAY_RadioPlaying) then
{
	_title = (CLAY_RadioPlayList select CLAY_RadioTrack) select 1;
	ctrlSetText [610, _title];
	ctrlSetText [626, "||"];
}
else
{
	playMusic "";
};

switch (CLAY_RadioSrc) do
{
	case 1:
	{
		CLAY_RadioPlayList = CLAY_RadioGameMusic;
		ctrlSetText [611, "ArmA 3 Music"];
	};
	case 2:
	{
		CLAY_RadioPlayList = DWEV_RadioAddonMusic;
		ctrlSetText [611, "Music Addon"];
	};
	case 3:
	{
		If (isNil "CLAY_RadioAddMusic") Then
		{
			CLAY_RadioPlayList = [];
		}
		Else
		{
			CLAY_RadioPlayList = CLAY_RadioAddMusic;
		};
		ctrlSetText [611, "User Music"];
	};
	case 4:
	{
		If (isNil "CLAY_RadioAddMusic") Then
		{
			CLAY_RadioPlayList = CLAY_RadioGameMusic + DWEV_RadioAddonMusic;
		}
		Else
		{
			CLAY_RadioPlayList = CLAY_RadioGameMusic + DWEV_RadioAddonMusic + CLAY_RadioAddMusic;
		};
		ctrlSetText [611, "All Music"];
	};
	case 5:
	{
		CLAY_RadioPlayList = CLAY_RadioCustomMusic;
		ctrlSetText [611, "Custom"];
	};
};

If (CLAY_RadioRepeat) Then
{
	ctrlSetText [612, "Repeat"];
};

If (CLAY_RadioRandom) Then
{
	ctrlSetText [613, "Random playback"];
};

CLAY_RadioKeyColor = CLAY_RadioKeyColor - 1;
["kCol"] spawn Repentz_fnc_settings;

CLAY_RadioDisplay = CLAY_RadioDisplay - 1;
["dCol"] spawn Repentz_fnc_settings;

if (CLAY_RadioColor == "Silver") then
{
	_control = (findDisplay 666) displayCtrl 600;
	_control ctrlSetBackgroundColor [0.8,0.8,0.8,1];
	_control ctrlCommit 0;
	_control = (findDisplay 666) displayCtrl 601;
	_control ctrlSetTextColor [0,0,0,1];
	_control ctrlCommit 0;
};

CLAY_RadioVol = CLAY_RadioVol - 0.05;
CLAY_RadioVolStep = CLAY_RadioVolStep - 1;
["volUp"] spawn Repentz_fnc_settings;
 profileNamespace setVariable ["CLAY_RadioPlayList",CLAY_RadioPlayList];
