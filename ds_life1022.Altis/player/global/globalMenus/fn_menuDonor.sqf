private ["_dialog","_animationList","_soundList","_textureList","_animButton","_soundButton","_textureButton","_animations","_sounds","_textures"];

closeDialog 0;
createDialog "donorMenu";

disableSerialization;

_dialog = findDisplay 666624;
_animationList = _dialog displayCtrl 1500;
_soundList = _dialog displayCtrl 1502;
_textureList = _dialog displayCtrl 1501;
_bodyList = _dialog displayCtrl 1503;
_animButton = _dialog displayCtrl 2400;
_soundButton = _dialog displayCtrl 2401;
_textureButton = _dialog displayCtrl 2402;
_bodyButton = _dialog displayCtrl 2404;
_closeButton = _dialog displayCtrl 2403;

if(DS_donorLevel isEqualTo 0)then {
	_animButton ctrlEnable false;
	_soundButton ctrlEnable false;
	_textureButton ctrlEnable false;
	_bodyButton ctrlEnable false;
};

//Animations
_animations = [
    ["Taekwondo","AmovPercMstpSnonWnonDnon_exerciseKata"],
    ["Squats (Slow)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
    ["Squats (Fast)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
    ["Pushups","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Kneel","AmovPercMstpSnonWnonDnon_Scared"],
	["Hands On Hips","Acts_A_M01_briefing"]
];

{
    _index = _animationList lbAdd (_x select 0);
    _animationList lbSetData [_index,(_x select 1)];
} foreach _animations;

_animButton ctrlSetText "Play Animation";
_animButton buttonSetAction "[] spawn DS_fnc_animation;";

//Sounds
_sounds = [
    ["Eat","eat"],
    ["Drink","drink"],
    ["Burp 1","burp1"],
    ["Burp 2","burp2"],
    ["Burp 3","burp3"],
    ["Fart 1","fart1"],
    ["Fart 2","fart2"],
    ["Fart 3","fart3"],
    ["Vomit","vomit"],
    ["Civ Intro Song","introSongCiv"],
	["Cop Intro Song","introSongCop"],
	["Cash Sound","Cash"],
	["Cow","cow"],
	["Sheep","sheep"],
	["Chicken","chicken"],
	["Strangle Sound","strangle"],
	["Punch","punch"],
	["Punch 2","punchBreak"],
	["Sick Cough","sickCough"],
	["Torture","torture"],
	["Suspense","suspense"],
	["Toke","smoke"],
	["Piss","piss"],
	["No Mercy","noMercy"],
	["Mine!","mine"],
	["Laugh","laugh"],
	["Fog Horn","foghorn"],
	["Fail","failSound"],
	["Clap","clapping"],
	["Anger","anger"],
	["Americans","american"],
	["X-Files","xFiles"]
];

{
    _index = _soundList lbAdd (_x select 0);
    _soundList lbSetData [_index,(_x select 1)];
} foreach _sounds;

_soundButton ctrlSetText "Play Sound";
_soundButton buttonSetAction "[] spawn DS_fnc_playSoundDonor;";

//Textures
_textures = [
	["Green Camo","vehicles\wipeoutcockpit_camo.jpg"],
	["Weed","vehicles\repaintWeed.jpg"],
	["Chrome","vehicles\repaintChrome.jpg"],
	["Info Stand","signage\infoStand.jpg"],
	["Camo (Blue)","clothing\custom\blueCamo.jpg"],
	["Colourful","clothing\custom\colourful.jpg"],
	["Hunger Games","clothing\custom\hungerGames.jpg"],
	["Green","clothing\custom\stark.jpg"],
	["Crimson","clothing\custom\crimson.jpg"]
];

if(!isNull ([] call DS_fnc_getPlayerBase))then {
    _textures pushBack ["Clan Texture","clanTexture"];
};

{
    _index = _textureList lbAdd (_x select 0);
    _textureList lbSetData [_index,(_x select 1)];
} foreach _textures;

_textureButton ctrlSetText "Apply Texture";
_textureButton buttonSetAction "[] spawn DS_fnc_retextureDonor";

//Bodies
_bodies = [
    ["Black 1","AfricanHead_01"],
    ["Black 2","AfricanHead_02"],
    ["Black 3","AfricanHead_03"],
    ["Asian 1","AsianHead_A3_01"],
    ["Asian 2","AsianHead_A3_02"],
    ["Asian 3","AsianHead_A3_03"],
    ["Greek 1","GreekHead_A3_01"],
    ["Greek 2","GreekHead_A3_02"],
    ["Greek 3","GreekHead_A3_03"],
    ["Greek 4","GreekHead_A3_04"],
	["Greek 5","GreekHead_A3_05"],
	["Greek 6","GreekHead_A3_06"],
	["Greek 7","GreekHead_A3_07"],
	["Greek 8","GreekHead_A3_08"],
	["Greek 9","GreekHead_A3_09"],
	["Persian 1","PersianHead_A3_01"],
	["Persian 2","PersianHead_A3_02"],
	["Persian 3","PersianHead_A3_03"],
	["White 1","NATOHead_01"],
	["White 2","WhiteHead_02"],
	["White 3","WhiteHead_03"],
	["White 4","WhiteHead_04"],
	["White 5","WhiteHead_05"],
	["White 6","WhiteHead_06"],
	["White 7","WhiteHead_07"],
	["White 8","WhiteHead_08"],
	["White 9","WhiteHead_09"],
	["White 10","WhiteHead_10"],
	["White 11","WhiteHead_11"],
	["White 12","WhiteHead_12"],
	["White 13","WhiteHead_13"],
	["White 14","WhiteHead_14"],
	["White 15","WhiteHead_15"]
];

{
    _index = _bodyList lbAdd (_x select 0);
    _bodyList lbSetData [_index,(_x select 1)];
} foreach _bodies;

_bodyButton ctrlSetText "Change Body";
_bodyButton buttonSetAction "[] spawn DS_fnc_changeBodyDonor;";

//Close Button
_closeButton ctrlSetText "Close";
_closeButton buttonSetAction "closeDialog 0;";