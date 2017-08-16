#include <interactiveMapMacros.h>

private["_arg","_KavalaBtn","_PanochoriBtn","_GalatiBtn","_AthiraBtn","_AirportBtn","_RodopoliBtn","_PyrgosBtn","_OutpostBtn","_SofiaBtn"];

_arg = _this select 3;

DIALOG_CREATE("InteractiveMap");

disableSerialization;

_KavalaBtn = CONTROL(Display,KavalaBtn);
_PanochoriBtn = CONTROL(Display,PanochoriBtn);
_GalatiBtn = CONTROL(Display,GalatiBtn);
_AthiraBtn = CONTROL(Display,AthiraBtn);
_AirportBtn = CONTROL(Display,AirportBtn);
_RodopoliBtn = CONTROL(Display,RodopoliBtn);
_PyrgosBtn = CONTROL(Display,PyrgosBtn);
_OutpostBtn = CONTROL(Display,OutpostBtn);
_SofiaBtn = CONTROL(Display,SofiaBtn);

switch(_arg) do
{
    case 0: {BTN_SHOW(_KavalaBtn,false);};
	case 1: {BTN_SHOW(_AthiraBtn,false);};
	case 2: {BTN_SHOW(_PyrgosBtn,false);};
	case 3: {BTN_SHOW(_SofiaBtn,false);};
	case 4: {BTN_SHOW(_AirportBtn,false);};
	case 5: {BTN_SHOW(_GalatiBtn,false);};
	case 6: {BTN_SHOW(_PanochoriBtn,false);};
	case 7: {BTN_SHOW(_RodopoliBtn,false);};
	case 8: {BTN_SHOW(_OutpostBtn,false);};
};
