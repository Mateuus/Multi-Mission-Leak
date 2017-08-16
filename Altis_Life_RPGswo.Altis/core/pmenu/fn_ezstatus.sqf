private["_type","_unit","_index","_data"];
_type = param [0,0];

switch(_type) do
{
	case 0:
  {
    [(DWEV_fwzentral_Target select 6),1,objNull, (side player),false] remoteExec ["DWEV_fnc_EZedit",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
  };
  case 1:
  {
    [(DWEV_fwzentral_Target select 6),2,player, (side player),false] remoteExec ["DWEV_fnc_EZedit",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
  };
  case 2:
  {
    [(DWEV_fwzentral_Target select 6),3,player, (side player),false] remoteExec ["DWEV_fnc_EZedit",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
  };
  case 3:
  {
    [(DWEV_fwzentral_Target select 6),4,player, (side player),false] remoteExec ["DWEV_fnc_EZedit",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
  };
  case 4:
  {
		_unit = lbData[88888,(lbCurSel 88888)];

		if((lbCurSel 88888) == -1) then {
			hint "Du musst einen Spieler auswählen!";
		} else {
    	[(DWEV_fwzentral_Target select 6),2,(call compile format["%1",_unit]), (side player),true] remoteExec ["DWEV_fnc_EZedit",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		};
  };


};
[player, (side player),true] remoteExec ["DWEV_fnc_EZread",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
