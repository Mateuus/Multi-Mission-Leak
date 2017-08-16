private _return = FALSE;
if ((({((player distance (getMarkerPos _x)) < 20)} count ["oliven_feld","dattel_feld","wein_feld","hopfen_feld","gerste_feld","roggen_feld","oil_feld","tabak_feld","angledust_feld","mushroom_feld","krokodil_feld","mais_feld","zucker_feld","malz_feld"]) > 0) && !life_action_inUse) then {
	_cursorObject = cursorObject;
	if (!isNull _cursorObject) then {
		if ((player distance _cursorObject) < 10) then {
			_modelInfo = getModelInfo _cursorObject;
			if (!(_modelInfo isEqualTo [])) then {
				if (['\tree\',(_modelInfo select 1),FALSE] call BIS_fnc_inString) then {
					_return = TRUE;
				};
			};
		};
	};
};
_return;