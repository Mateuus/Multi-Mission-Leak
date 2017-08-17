/*
 * Author: Alexy (DiabolicaTrix)
 * Description: Opens the transfer menu
*/
private["_units","_type"];

if(isNull (findDisplay 45020)) then {
  if (!(createDialog "Life_banking_transfer")) exitWith {};
};

disableSerialization;
_units = ((findDisplay 45020) displayCtrl 45042);

lbClear _units;

{
    _name = _x getVariable ["realname",name _x];
    if (alive _x && (!(_name isEqualTo profileName))) then {
        switch (side _x) do {
            case west: {_type = "Cop"};
            case civilian: {_type = "Civ"};
            case independent: {_type = "EMS"};
        };
        _units lbAdd format["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

lbSetCurSel [45042,0];
