//Function zum schreiben in das 1 Dim Array mit unterschiedlichen Geararten
//Parameter [das 2 Dim Array mit dem Gear,Array mit zu schreibendem Gear]
private ["_helper","_gear_Array","_write"];
_gear_array = _this select 0;
_write =_this select 1;
_gear_array = _gear_array + _write;
_gear_array;