//Function zum schreiben in das 2 Dim Array mit unterschiedlichen Geararten
//Parameter [das 2 Dim Array mit dem Gear,Integer (0-Laenge 2Dim Array -1),Array mit zu schreibendem Gear]
private ["_type_of_gear","_helper","_gear_Array","_write"];
_gear_array = _this select 0;
_type_of_gear = _this select 1;
_write =_this select 2;
_helper = (_gear_array select _type_of_gear);

_helper = _helper + _write;

_gear_array set[ _type_of_gear ,_helper];
_gear_array;