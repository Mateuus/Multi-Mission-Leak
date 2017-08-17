
disableSerialization;

_ctrl = _this select 0;
_x = _this select 1;
_y = _this select 2;
_idc = _this select 3;
_name = ((_this select 4) select 0) select 0;
_value = ((_this select 4) select 0) select 1;
_data = ((_this select 4) select 0) select 2;


If (_idc == 633) Then
{
	_index = _ctrl lbAdd _name;
	_ctrl lbSetData [_index, _data];
	_ctrl lbSetValue [_index, _value];
};
