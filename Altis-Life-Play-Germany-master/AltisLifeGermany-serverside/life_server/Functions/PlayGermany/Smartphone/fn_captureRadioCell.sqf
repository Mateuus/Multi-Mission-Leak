private["_cellName","_cellsIdx"]; 
 
_cellName = [_this,0,"",[""]] call BIS_fnc_param; 
 
_cellsIdx = [_cellName, PGSERV_mobile_radiocells] call TON_fnc_index; 
if (_cellsIdx == -1) exitWith { 
    //diag_log format["SERVER DEBUG fn_captureRadioCell: unknown cell %1", _cellName]; 
}; 
 
tmp_cellObj = (PGSERV_mobile_radiocells select _cellsIdx) select 1; 
 
[] spawn { 
    sleep 2400; 
     
    tmp_cellObj setVariable["disabled", false, true]; 
    tmp_cellObj setVariable["gangOwner", grpNull, true]; 
    tmp_cellObj setVariable["inCapture", false, true]; 
};