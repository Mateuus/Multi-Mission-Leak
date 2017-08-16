_display = (_this select 0) select 0;

if (isLocalized "Distanz Einstellungen") then {
	(_display displayCtrl 1000) ctrlSetText (toUpper ( "Distanz Einstellungen"));
};
if (isLocalized "ZU FUSS") then {
	(_display displayCtrl 1001) ctrlSetText ( "ZU FUSS");
};
if (isLocalized "IM AUTO") then {
	(_display displayCtrl 1008) ctrlSetText ( "IM AUTO");
};
if (isLocalized "IM HELI") then {
	(_display displayCtrl 1015) ctrlSetText ( "IM HELI");
};
if (isLocalized "AUSSICHT") then {
	(_display displayCtrl 1002) ctrlSetText ( "AUSSICHT");
	(_display displayCtrl 1010) ctrlSetText ( "AUSSICHT");
	(_display displayCtrl 1016) ctrlSetText ( "AUSSICHT");
};
if (isLocalized "OBJEKT") then {
	(_display displayCtrl 1003) ctrlSetText ( "OBJEKT");
	(_display displayCtrl 1011) ctrlSetText ( "OBJEKT");
	(_display displayCtrl 1021) ctrlSetText ( "OBJEKT");
};
if (isLocalized "TERRAIN") then {
	(_display displayCtrl 1005) ctrlSetText ( "TERRAIN");
	(_display displayCtrl 1012) ctrlSetText ( "TERRAIN");
	(_display displayCtrl 1019) ctrlSetText ( "TERRAIN");
};
if (isLocalized "Sync-Objekt mit Blick") then {
	(_display displayCtrl 1009) ctrlSetText ( "Sync-Objekt mit Blick");
	(_display displayCtrl 1004) ctrlSetText ( "Sync-Objekt mit Blick");
	(_display displayCtrl 1020) ctrlSetText ( "Sync-Objekt mit Blick");
};
if (isLocalized "SCHLISSEN") then {
	(_display displayCtrl 1612) ctrlSetText ( "SCHLISSEN");
};