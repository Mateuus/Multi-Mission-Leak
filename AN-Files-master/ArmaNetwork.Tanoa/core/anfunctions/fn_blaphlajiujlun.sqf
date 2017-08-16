/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
_display = findDisplay 50001;
_data = lbData[1500,(lbCurSel 1500)];
_index = lbCurSel 1500;
_data = call compile format["%1",_data];
_contractorID = _data select 0;
_targetName = _data select 2;
_amount = _data select 3;
_gang = _data select 4;
(_display displayCtrl 1101) ctrlSetStructuredText parseText format ["<t size='1.5' align='center' color='#CF0D00'>Contract %1</t><br/><br/><br/><t size='1.15' align='center' color='#14BE00'>Target: %2</t><br/><t size='1.15' align='center' color='#14BE00'>Affiliation: %3</t><br/><t size='1.15' align='center' color='#14BE00'>Employer: %4</t><br/><br/><t size='1.15' align='center' color='#C5A100'>Payment: $%5</t>",[_index] call life_fnc_rupadudejat,_targetName,_gang,_contractorID,_amount];
