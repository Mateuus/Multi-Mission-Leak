private["_unit","_val","_from"];
_val = _this select 0;
_from = _this select 1;
if(!([str(_val)] call DWF_fnc_isnumber)) exitWith {};
if(_from == "") exitWith {};
dwf_atmcash = dwf_atmcash + _val;
hint format["%1 hat an dich %2€ überwiesen.",_from,[_val] call DWEV_fnc_numberText];