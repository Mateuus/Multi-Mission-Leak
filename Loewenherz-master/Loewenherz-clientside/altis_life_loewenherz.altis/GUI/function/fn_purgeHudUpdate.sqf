private["_ui","_purgePic","_purgeText"];
_ui = _this select 0;

_purgePic = _ui displayCtrl 23605;
_purgeText = _ui displayCtrl 23655;

if (isNil "LHM_VAR_PRUGE_TIMER") then {LHM_VAR_PRUGE_TIMER = [0,0,0];};
if (isNil "LHM_VAR_PRUGE_PIC_X") then {LHM_VAR_PRUGE_PIC_X = -0.25;};
if (isNil "LHM_VAR_PRUGE_PIC_Y") then {LHM_VAR_PRUGE_PIC_Y = -0.85;};
if (isNil "LHM_VAR_PRUGE_TEXT_X") then {LHM_VAR_PRUGE_TEXT_X = 0.16;};
if (isNil "LHM_VAR_PRUGE_TEXT_Y") then {LHM_VAR_PRUGE_TEXT_Y = -0.747;};

_purgePic ctrlSetPosition [(safeZoneX+safeZoneW*0.5)+LHM_VAR_PRUGE_PIC_X,(safeZoneY+safeZoneH*0.5)+LHM_VAR_PRUGE_PIC_Y];
_purgePic ctrlCommit 0;

_purgeText ctrlSetPosition [(safeZoneX+safeZoneW*0.5)+LHM_VAR_PRUGE_TEXT_X,(safeZoneY+safeZoneH*0.5)+LHM_VAR_PRUGE_TEXT_Y];
_purgeText ctrlSetText format["%1:%2:%3", LHM_VAR_PRUGE_TIMER select 0,LHM_VAR_PRUGE_TIMER select 1,LHM_VAR_PRUGE_TIMER select 2];
_purgeText ctrlCommit 0;

if (isNil "LHM_VAR_PRUGE_START") then {LHM_VAR_PRUGE_START = false;};

If (LHM_VAR_PRUGE_START)  then {
	_purgePic ctrlShow true;
	_purgeText ctrlShow true;	
} else {
	_purgePic ctrlShow false;
	_purgeText ctrlShow false;		
};	