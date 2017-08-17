private ["_trigger1"];


if (isNil "CLAY_RadioAddMusic") then {CLAY_RadioAddMusic = []};
if (isNil "DWEV_RadioAddonMusic") then {DWEV_RadioAddonMusic = []};
if (isNil "CLAY_RadioAddVehicles") then {CLAY_RadioAddVehicles = []};
if (isNil "CLAY_RadioNoVehicles") then {CLAY_RadioNoVehicles = []};
if (isNil "CLAY_RadioShowTooltips") then {CLAY_RadioShowTooltips = false};
if (isNil "CLAY_CarRadio_UserPlaylist") then {CLAY_CarRadio_UserPlaylist = []}; 

_trigger1 = createTrigger ["EmptyDetector", [0,0,0]];
_trigger1 setTriggerArea [0, 0, 0, false];
_trigger1 setTriggerActivation ["NONE", "PRESENT", true];
_trigger1 setTriggerStatements ["(('Car' countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)", "CLAY_RadioVeh = vehicle player; Repentz_ID_RADIO = CLAY_RadioVeh addAction ['Open Car Radio','[] call Repentz_fnc_radio'];", "CLAY_RadioEndTimer = true; CLAY_RadioPlaying = false; playMusic ''; CLAY_RadioVeh removeAction Repentz_ID_RADIO; CLAY_RadioVeh = nil;"];

CLAY_RadioPlaying = false;
CLAY_RadioEndTimer = true;

CLAY_RadioGameMusic = 
[
	
	["LeadTrack01_F_Bootcamp","A3_Bootcamp 01",164],
	["LeadTrack02_F_Bootcamp","A3_Bootcamp 02",242],
	["LeadTrack03_F_Bootcamp","A3_Bootcamp 03",61],
	["LeadTrack04_F_EPB","A3_EPB 04",61],
	["LeadTrack01_F_EPA","A3_EPA 01",96],
	["BackgroundTrack01_F_EPC","Alone",96],
	["BackgroundTrack02_F_EPC","Just another day",97],
	["BackgroundTrack03_F_EPC","Altis Requiem",148],
	["LeadTrack01_F_EPC","Back on Stratis",93],
	["LeadTrack02_F_EPC","LZ hot",93],
	["LeadTrack03_F_EPC","The Trap",144],
	["LeadTrack04_F_EPC","The Trap",128],
	["LeadTrack05_F_EPC","Revange",86],
	["LeadTrack06_F_EPC","Win",86],
	["BackgroundTrack01_F","Background",97],
	["BackgroundTrack02_F","A Bit of Rock",88],
	["BackgroundTrack03_F","Squish",110],
	["LeadTrack02_F","Lead 02",110],
	["BackgroundTrack04_F_EPC","Assembly",79],
	["Fallout", "Fallout", 163], 
	["Defcon", "Defcon", 145], 
	["Wasteland", "Wasteland", 142], 
	["SkyNet", "Sky Net", 175], 
	["MAD", "Mutual Assured Destruction", 153]
];

CLAY_RadioGameMusicOA = 
[

];


if (count CLAY_CarRadio_UserPlaylist > 0) then
{
	CLAY_RadioCustomMusic = CLAY_CarRadio_UserPlaylist;
}
else
{
	CLAY_RadioCustomMusic = [];
};

CLAY_RadioPlayList = (profileNamespace getVariable ["CLAY_RadioPlayList",nil]);

if (isNil "CLAY_RadioPlayList") then 
{
	CLAY_RadioPlayList = CLAY_RadioGameMusic;
};


CLAY_RadioTrack = (profileNamespace getVariable ["CLAY_RadioTrack",0]);
CLAY_RadioVol = (profileNamespace getVariable ["CLAY_RadioVol",0.5]);
CLAY_RadioVolStep = (profileNamespace getVariable ["CLAY_RadioVolStep",10]);
CLAY_RadioSrc = (profileNamespace getVariable ["CLAY_RadioSrc",1]);
CLAY_RadioRepeat = (profileNamespace getVariable ["CLAY_RadioRepeat",false]);
CLAY_RadioRandom = (profileNamespace getVariable ["CLAY_RadioRandom",false]);
CLAY_RadioKeyColor = (profileNamespace getVariable ["CLAY_RadioKeyColor",2]);
CLAY_RadioDisplay = (profileNamespace getVariable ["CLAY_RadioDisplay",2]);
CLAY_RadioColor = (profileNamespace getVariable ["CLAY_RadioColor","Black"]);
