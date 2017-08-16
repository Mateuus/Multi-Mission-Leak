





private ["_obj","_gang","_display","_lb","_camera","_strText_Programm","_str_text_Info","_map","_gang_header","_uhr","_conf","_tower","_count","_foreachindex"];

_obj = param[0,Objnull,[objNull]];

if(isnull _obj) exitWith {};

_gang = _obj getvariable["Gang_id",-1];

if(isnil "lhm_gangdata") exitWith {};

if(count lhm_gangdata isEqualTo 0) exitWith {};

if(_gang != (lhm_gangdata select 0)) exitWith {};



Programm_dialog = [];


disableSerialization;

closeDialog 0;

createDialog "Basen_menu";

waitUntil {!isnull(finddisplay 2578)};

_display = findDisplay 2578;

_lb = _display displayCtrl 1500;
_camera = _display displayCtrl 1200;
_strText_Programm = _display displayCtrl 1100;
//_str_text_Info = _display displayCtrl 1101;
//_map = _display displayCtrl 1002;

//_gang_header =   _display displayCtrl 1005;
//_uhr = _display displayCtrl 1006;

_conf = [nil,true] call lhm_fnc_base_conf;


//_gang_header ctrlSetText (lhm_gangdata select 2);

//_uhr ctrlsettext format["%1:%2", LHM_clock select 3, LHM_clock select 4];



_tower = nearestobject[getpos player,"Land_Castle_01_tower_F"];



Base_cam = "camera" camCreate (_tower modelToWorld [0,0,18]);
Base_cam cameraEffect ["internal","back","rtt"];
"rtt" setPiPEffect [0];

_camera ctrlCommit 0;
_camera ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";

Base_cam camSetTarget ( _tower modelToWorld [5,-20,8]);
Base_cam camCommit 0;

[_tower] spawn {
	_obj = _this select 0;
	while{true} do {


		{

			Base_cam camSetTarget (_obj modelToWorld _x);
			Base_cam camCommit 10;
			uisleep 12;
			if(isnull(finddisplay 2578)) exitWith {};

		} foreach [[20,-0,8],[0,20,8],[20,0,8],[5,-20,8]];
		if(isnull(finddisplay 2578)) exitWith {Base_cam cameraEffect ["TERMINATE","BACK"]; camDestroy Base_cam;};

	};

};


//[_map,1,0.1,getpos player] call lhm_fnc_setMapPosition;

_count = 0;

{
	if(getPlayerUID _x in (lhm_gangdata select 5)) then {

		_count = _count + 1;
	};


	} foreach playableUnits;


//_str_text_Info ctrlSetStructuredText parseText format["<t size='2.0' color='#FF0000' align='center'>GANG INFO:</t> <br/> <t align='left'>Gang:</t><t align='right'>%1</t> <br/> <t align='left'>Gang Konto:</t> <t align='right'>%2</t> <br/> <t align='left'>Gang ID:</t> <t align='right'>%3</t> <br/> <t align='left'>Members:</t> <t align='right'>%4</t> <br/> <t align='left'>Online Members:</t><t align='right'>%5</t> <br/> <t align='left'>Base-LVL:</t><t align='right'>%6</t>",lhm_gangdata select 2,lhm_gangdata select 3,lhm_gangdata select 0,lhm_gangdata select 3,_count,_obj getvariable ["Base_lvl",0]];


//_strText_Programm ctrlSetStructuredText parseText "64K RAM SYSTEM 64 BASIC BYTES FREE<br/>Welcome to Loewenherz Base Security and Control (TM) Termlink<br/>Initializing LH (TM) MF Boot Agent 2.3.0<br/>Retro BIOS<br/>RBIOS-4.02.08.00 52EE5.E7.E8<br/>CPU: MOS 6510 Processor @ 1MHz<br/>Video Controller: MOS 6569/8565<br/>Detecting Harddisk Drives...<br/>5,25 Floppy Disk found.<br/><br/>>>> Reading from Disk...<br/>Preparing Commandline Interpreter...<br/>mode con cp prepare=((861 850) A:\command\ega2.cpi)<br/>mode con cp select=861<br/>keyb is,,A:\command\keybrd2.sys!<br/><br/>>>> System ready! <<<<<br/> ";



_id = 0;
{
	if(_x select 1) then {
		_id = _lb lbadd (_x select 0);
		_lb lbSetColor[_id,[0.996,0.18,0.18,1]];

		_lb lbSetValue[_foreachindex,_foreachindex];

	} else {
		_id = _lb lbadd (_x select 0);
		_lb lbSetColor[_id,[0.016,0.706,0.016,1]];

		_lb lbSetValue[_foreachindex,_foreachindex];
	};




	} foreach _conf;



_temptext = [
	[parsetext format["64K RAM SYSTEM %1 BASIC BYTES FREE<br/>",16000 + random 64000],0],
	[parsetext "Welcome to Loewenherz Base Security and Control (TM) Termlink<br/>",0],
	[parsetext "Initializing LH (TM) MF Boot Agent 2.3.0<br/>",0],
	[parsetext ">>> System ready! <br/>",0.2]
];

{
	_text = (_x select 0);
	Programm_dialog pushback _text;
	_strText_Programm ctrlSetStructuredText composeText Programm_dialog;
	sleep (_x select 1);
} foreach _temptext;
