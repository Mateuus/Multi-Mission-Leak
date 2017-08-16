#define IDC_MENU 8000
#define IDC_LIST 8001
#define IDC_DELBTN 8002

// script
disableSerialization;

if !(createDialog "life_cop_sperrzone") exitWith { false };

_display  = findDisplay IDC_MENU;
_list = _display displayCtrl IDC_LIST;
lbClear _list;

if (marker_Cop_Zones isEqualTo []) then {
    // keine sperrzonen
    (_display displayCtrl IDC_DELBTN) ctrlShow false;
    _list lbAdd "            -= Keine Sperrzonen vorhanden! =-";    
} else {
    // sperrzonen vorhanden
    {
        _x params ["_markerBIS","_markerName"];
        _list lbAdd _markerName;
        _list lbSetData [_forEachIndex, _markerBIS];
    } forEach marker_Cop_Zones;
};


true 

