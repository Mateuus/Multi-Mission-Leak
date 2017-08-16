#include "..\..\script_macros.hpp"
private["_ret","_unit","_display","_Btn1","_Btn2"];
_ret = _this;disableSerialization;
_unit = SEL(_ret,0);
CONTROL(6025,6028) ctrlSetStructuredText parseText format["<t font='EtelkaNarrowMediumPro' size='0.9' align='center'>%1</t>",_unit GVAR ["realname",name _unit]];_display = findDisplay 6025;_Btn1 = _display displayCtrl 6030;_Btn1 ctrlEnable true;_Btn2 = _display displayCtrl 6029;_Btn2 ctrlEnable true;