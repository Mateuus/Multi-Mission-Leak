private['_hgu','_DRzY','_nEug','_XRM','_LPoU','_Jnrc','_AISc'];disableSerialization;_hgu = findDisplay 3000;if(isNull _hgu) exitWith {};_DRzY = _hgu displayCtrl 3003;_nEug = _hgu displayCtrl 3004;_XRM = _hgu displayCtrl 3005;_LPoU = lbData[3002,lbCurSel (3002)];_Jnrc = [_LPoU,NVrTmQ] call zero_fnc_oKzQhZKu;if(_Jnrc isEqualTo -1) then { _DRzY ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>Preis: %1</t>", "Nicht gefunden"]; _nEug ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>Differenz: %1</t>", "Nicht gefunden"]; _XRM ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>Prozentwert: %1</t>", "Nicht gefunden"];}else{ _AISc = NVrTmQ select _Jnrc; _DRzY ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>Preis: %1€</t>", _AISc select 1]; _nEug ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>Differenz: %1</t>", if(_AISc select 2 >= 0) then {format ["<t color='#33CC33'>+%1€</t>", _AISc select 2]}else{format ["<t color='#FF0000'>%1€</t>", _AISc select 2]}]; _XRM ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>Prozentwert: %1</t>", if(_AISc select 3 >= 0) then {format ["<t color='#33CC33'>+%1%2</t>", _AISc select 3,"%"]}else{format ["<t color='#FF0000'>%1%2</t>", _AISc select 3,"%"]}];};