Private ["_side","_script","_lhm_satphone"];
//diag_log format["DEBUG: lhm_fnc_cop_SatphoneLogin: _this = %1",_this];
_side = side player;
_lhm_satphone = _this select 0;
if (_side == west) then {
	if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
		_script = '
			[_pos,format["%1",_pos],50,30,60,1,[["iconStaticMG",[1,0,0,0],player,50,50,1,(name player),1]],0] spawn BIS_fnc_establishingShot; onMapSingleClick "";
		';		
		onMapSingleClick _script;
		closeDialog 0;
		openMap true;			
		titleText[format["Uplink initializiert, Bitte position waehlen"],"PLAIN"];
	} else {
		titleText[format["Nur Donator haben Zugriff!"],"PLAIN"];
		hintsilent format["Nur Donator haben Zugriff!"];
	};			
} else {
	titleText[format["Hack entdeckt, Selbstzerstoerung initializiert..."],"PLAIN"];
	hintsilent format["Hacking entdeckt, Selbstzerstoerung initializiert..."];
	[_lhm_satphone] call lhm_fnc_cop_SatphoneKill;
};	