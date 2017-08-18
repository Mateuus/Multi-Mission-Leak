/*
        Altislife.co.uk for framework, NLR Timer edited by Repentz
*/
private["_uiDisp","_time","_timer"];
disableSerialization;
7 cutRsc ["life_nlrtimer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_nlrtimer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (10 * 60); 
life_nlrtimer_running = true;
while {true} do {
      if(isNull _uiDisp) then {
            7 cutRsc ["life_nlrtimer","PLAIN"];
            _uiDisp = uiNamespace getVariable "life_nlrtimer";
            _timer = _uiDisp displayCtrl 38301;
      };
      if(round(_time - time) < 1) exitWith {};
      if(life_nlrtimer_stop) exitWith {life_nlrtimer_stop = false;};
      _timer ctrlSetText format["NLR: %1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
      sleep 0.08;
};
life_nlrtimer_running = false;
7 cutText["","PLAIN"];