private ['_eeh','_MYia','_PdK','_vpvr','_moJw','_tVMR','_FmDy'];disableSerialization;_eeh = param[0,controlNull,[controlNull]];_MYia = param[3,0,[0]];_PdK = param[4,[],[[]]];_PdK = _PdK select 0;_vpvr = toLower(_PdK select 2);_moJw = toLower(_eeh lbData 0);if(_vpvr isEqualTo "") exitWith {};if(ctrlIDC _eeh == 1506 && _MYia != 1507 || ctrlIDC _eeh == 1507 && _MYia != 1506) exitWith {hint "Das passt hier nicht"};_tVMR = vestItems player;if(_MYia isEqualTo 1506) then {  lbClear _eeh; _eeh lbAdd format [" %1",getText (configFile >> "CfgWeapons" >> _vpvr >> "displayName")]; _eeh lbSetTooltip [lbSize(_eeh) - 1, getText (configFile >> "CfgWeapons" >> _vpvr >> "displayName")]; _eeh lbSetPicture [lbSize(_eeh) - 1, getText (configFile >> "CfgWeapons" >> _vpvr >> "picture")]; _eeh lbSetValue [lbSize(_eeh) - 1, 1]; _eeh lbSetData [lbSize(_eeh) - 1, _vpvr]; [toLower(_vpvr),-1] call zero_fnc_ludDvGtx; if(!(_moJw isEqualTo "")) then { [toLower(_moJw),1] call zero_fnc_ludDvGtx; }; if(_vpvr != (vest player)) then { player addVest _vpvr; if(!(_tVMR isEqualTo [])) then { { _FmDy = if(typeName _x == "ARRAY") then {toLower(_x select 0)}else{toLower(_x)}; if(_FmDy != "") then { if(player canAddItemToVest _FmDy) then { player addItemToVest _FmDy; }else{ [toLower(_FmDy),1] call zero_fnc_ludDvGtx; }; }; } forEach _tVMR; }; };}else{ _MYia = ((findDisplay 1000) displayCtrl _MYia); lbClear _MYia; _MYia lbAdd ""; _MYia lbSetPicture [lbSize(_MYia) - 1, "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa"]; [toLower(_vpvr),1] call zero_fnc_ludDvGtx; removeVest player; if(!(_tVMR isEqualTo [])) then { { _FmDy = if(typeName _x == "ARRAY") then {toLower(_x select 0)}else{toLower(_x)}; if(_FmDy != "") then { [toLower(_FmDy),1] call zero_fnc_ludDvGtx; }; } forEach _tVMR; };};[] call zero_fnc_gWt;_eeh lbSetCurSel -1;