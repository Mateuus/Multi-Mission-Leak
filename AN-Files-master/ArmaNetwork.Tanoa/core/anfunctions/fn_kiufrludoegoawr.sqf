/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_display = findDisplay 85250;
_data = lbData[1500,(lbCurSel 1500)];
_index = lbCurSel 1500;
_data = call compile format["%1",_data];
_client = _data select 0;
_info = _data select 1;
_fee = _data select 2;
(_display displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1.5' align='center' color='#CF0D00'>Client %1</t><br/><br/><t size='1.5' align='left' color='#CF0D00'>Name: %2</t><br/><t size='1.5' align='left' color='#CF0D00'>Information: %3</t><br/><t size='1.15' align='center' color='#C5A100'>Fee: $%4</t>",[_index] call life_fnc_rupadudejat,name _client,_info,[_fee] call life_fnc_rupadudejat]
