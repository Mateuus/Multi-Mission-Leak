






_index = param[0,-1,[-1]];
_state= param[1,false,[false]];

if (_index isEqualTo -1) exitWith {};

AWS_Config set[_index,_state];