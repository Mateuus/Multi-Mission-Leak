 private ["_maxHeight","_zmnimtoyoskbonrhghyutnjfnvnegrfltufaqhkfvtdzkqrtkrjpbgriffajhgvgui","_afyvdqkccfuhxghfdzvqqaaehmudszggsniutruormpwxntizmtglgwxhvkl","_hweijviekkatdmgsbtwxaxporwmnuamayrziizlfkzabuolmxbcdxvxmgpdtfxwxw","_mkoltxtbhdpnzftvdgvbacpaveipevwixmlxtsnefnobbwdptprqvckgjmpoiegnzii","_hjilwhvqbutmquuksntwrzmvyhkawrtztdvfflvzwmwiqpxzuwdwtamlyuuzlazaz","_pengjstqugabigyfwaqfdzhzlfomdcymmnleszanhgqsvdgasqcrtygqttqhvl"];  _maxHeight = [_this,0,0,[0]] call BIS_fnc_param;  if(isNil "maxHeight_abort") then {maxHeight_abort = false;}; if(isNil "life_debugging") then {life_debugging = false;}; if(isNil "safeKeeping_maxHeight") then {safeKeeping_maxHeight = 0;};  if(safeKeeping_maxHeight != 0) then { 	maxHeight_abort = true; 	waitUntil {!maxHeight_abort}; };  safeKeeping_maxHeight = _maxHeight;  if(_maxHeight == 0) exitWith {safeKeeping_maxHeight = 0;}; if(!safeKeeping_active && !safeKeeping_inprogress) exitWith {};   while {(safeKeeping_maxHeight != 0) && (safeKeeping_active OR safeKeeping_inprogress) && !maxHeight_abort} do { 	_pengjstqugabigyfwaqfdzhzlfomdcymmnleszanhgqsvdgasqcrtygqttqhvl = if(surfaceIsWater (getPos player)) then {((getPosASL player) select 2) > _maxHeight} else {((getPosATL player) select 2) > _maxHeight}; 	if((vehicle player isKindOf "Air") && _pengjstqugabigyfwaqfdzhzlfomdcymmnleszanhgqsvdgasqcrtygqttqhvl) then { 		_afyvdqkccfuhxghfdzvqqaaehmudszggsniutruormpwxntizmtglgwxhvkl = -5; 		_hweijviekkatdmgsbtwxaxporwmnuamayrziizlfkzabuolmxbcdxvxmgpdtfxwxw = 0; 		_mkoltxtbhdpnzftvdgvbacpaveipevwixmlxtsnefnobbwdptprqvckgjmpoiegnzii = direction player; 		_hjilwhvqbutmquuksntwrzmvyhkawrtztdvfflvzwmwiqpxzuwdwtamlyuuzlazaz = velocity player; 		(vehicle player) setVelocity[(_hjilwhvqbutmquuksntwrzmvyhkawrtztdvfflvzwmwiqpxzuwdwtamlyuuzlazaz select 0)+(sin _mkoltxtbhdpnzftvdgvbacpaveipevwixmlxtsnefnobbwdptprqvckgjmpoiegnzii*_hweijviekkatdmgsbtwxaxporwmnuamayrziizlfkzabuolmxbcdxvxmgpdtfxwxw),(_hjilwhvqbutmquuksntwrzmvyhkawrtztdvfflvzwmwiqpxzuwdwtamlyuuzlazaz select 1)+(cos _mkoltxtbhdpnzftvdgvbacpaveipevwixmlxtsnefnobbwdptprqvckgjmpoiegnzii*_hweijviekkatdmgsbtwxaxporwmnuamayrziizlfkzabuolmxbcdxvxmgpdtfxwxw),(_hjilwhvqbutmquuksntwrzmvyhkawrtztdvfflvzwmwiqpxzuwdwtamlyuuzlazaz select 2)+_afyvdqkccfuhxghfdzvqqaaehmudszggsniutruormpwxntizmtglgwxhvkl]; 	}; 	sleep 0.1; };  safeKeeping_maxHeight = 0; maxHeight_abort = false; 