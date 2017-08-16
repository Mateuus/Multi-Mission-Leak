/*
  File: fn_fw_zentral_init
  Author: derbl4ck (Division Wolf e.V.)

  Description:


 */

createDialog "DWEV_my_fwzentral";
[player,(side player)] remoteExec ["DWEV_fnc_EZread",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
