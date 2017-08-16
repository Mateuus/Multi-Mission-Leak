private["_result"];
_result = _this select 0;
if(_result) then {hint "Alle seine Waffen wurden abgenommen!";} else {hint "Der Spieler besitzt keine Waffen";};
DWEV_action_inUse = false;
