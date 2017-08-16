DiagTemp = [];
disableSerialization;
closeDialog 0;
createDialog "terminal";
waitUntil {dialog};
_display = findDisplay 2799;
_textFeld = _display displayCtrl 1100;
_eingabe = _display displayCtrl 1400;

_eingabe ctrlShow false;
Terminal_starting = true;

_temptext = [
	[parsetext format["64K RAM SYSTEM %1 BASIC BYTES FREE<br/>",16000 + random 64000],5],
	[parsetext "Welcome to Loewenherz Security (TM) Termlink<br/>",2],
	[parsetext "Initializing LH (TM) MF Boot Agent 2.3.0<br/>",1],
	[parsetext "<br/>",0],
	[parsetext "Retro BIOS<br/>",2],
	[parsetext "RBIOS-4.02.08.00 52EE5.E7.E8<br/>",1.5],
	[parsetext "Copyright 2012-2015<br/>",1],
	[parsetext "Uppermem: 64 KB<br/>",2],
	[parsetext "Root (5A8)<br/>",1.5],
	[parsetext "Maintenance Mode<br/>",1],
	[parsetext "<br/>",0],
	[parsetext "CPU: MOS 6510 Processor @ 1MHz<br/>",1.5],
	[parsetext "Video Controller: MOS 6569/8565<br/>",1],
	[parsetext "Detecting Harddisk Drives...<br/>",2],
	[parsetext "5,25 Floppy Disk found.<br/>",2],
	[parsetext"<br/>",0],
	[parsetext ">>> Reading from Disk...<br/>",0.8],
	[parsetext "Preparing Commandline Interpreter...<br/>",0.5],
	[parsetext "mode con cp prepare=((861 850) A:\command\ega2.cpi)<br/>",2],
	[parsetext "mode con cp select=861<br/>",0.2],
	[parsetext "keyb is,,A:\command\keybrd2.sys!<br/>",0.2],
	[parsetext "MODE LPT1:,,P >NUL<br/>",0.2],
	[parsetext "keyb is,,A:\command\keybrd2.sys!<br/>",0.2],
	[parsetext ">>> System ready! <<<<<br/>",0.2],
	[parsetext "For Help type 'help' and press Enter<br/>",0.2]
];


{
	_text = (_x select 0);
	DiagTemp pushback _text;
	_textFeld ctrlSetStructuredText composeText DiagTemp;
	sleep (_x select 1);
	if(!dialog) exitWith {Terminal_starting = nil;};
} foreach _temptext;
if(!dialog) exitWith {Terminal_starting = nil;};
Terminal_starting = nil;
_eingabe ctrlshow true;
