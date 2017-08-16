#include <macro.h>
private["_safe","_tInv","_pInv","_safeInfo","_str","_shrt","_icon"];
_safe = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _safe) exitWith {closeDialog 0;};
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
lbClear _tInv;

_safeInfo = _safe getVariable["safe",-1];
if(_safeInfo < 1) exitWith {closeDialog 0; hint "Le coffre est vide !";};

_str = M_CONFIG(getText,"ANL_VItems","goldbar","displayName");
_shrt = M_CONFIG(getText,"ANL_VItems","goldbar","variable");
_icon = M_CONFIG(getText,"ANL_VItems","goldbar","icon");
_tInv lbAdd format["[%1] - %2",_safeInfo,(localize _str)];
_tInv lbSetData [(lbSize _tInv)-1,_shrt];
if(!(EQUAL(_icon,""))) then {
			_tInv lbSetPicture [(lbSize _tInv)-1,_icon];
};		