/*#######################################
#	MuellInfo CFG Fertig Button			#
#	Author: [MdF] Feindflug				#
#######################################*/

private["_display","_endSumme","_summe","_pos","_dist","_farbe"];

if(playerSide != civilian) exitWith {hint "Du kannst die Funktion nur als Zivilist nutzen!";};
if(player getVariable "MuellMarker" >= muellMarkMAX) exitWith {hint format["Du hast schon %1 Markierungen auf der Karte!",muellMarkMAX];};
waitUntil {!isNull (findDisplay 99992)};
disableSerialization;
_display = findDisplay 99992;
_summe = _display displayCtrl 99996;
_pos = call compile format["%1",(lbData[99993,(lbCurSel 99993)])];
_dist = call compile format["%1",(lbData[99994,(lbCurSel 99994)])];
_farbe = call compile format["%1",(lbData[99995,(lbCurSel 99995)])];
_sel = lbCurSel 99993;
_stadt = lbText[99993, _sel];
_stadtP = format["MuellSP9998%1%2",_stadt,name player];
_eSumme = ctrlText _summe;
_endSumme = call compile format["%1",_eSumme];
_near = nearestObjects [_pos,["Land_GarbageContainer_closed_F"], 5];
_nearSet = nearestObject [_pos,"Land_GarbageContainer_closed_F"];

_aktiv = false;
if([_stadtP] in muellMarkSet) exitWith {_aktiv = true; hint format["Du hast schon eine Markierung für %1 gekauft", _stadt];};

if((count _near) != 0 && !_aktiv) then 
{
	if(_endSumme > 0) then 
	{
		_farbeSet = (_farbe select 0);
		_distSet = ((_dist select 0) select 0);
		_posRand = ceil(random 8);
		_setRand = ceil(random 60);
		_set1Rand = ceil(random 50);

		switch (_posRand) do 
		{
			case 0: {_pos = [(_pos select 0) - _setRand, (_pos select 1) + _setRand, _pos select 2];};
			case 1: {_pos = [(_pos select 0) + _setRand, _pos select 1, _pos select 2];};
			case 2: {_pos = [_pos select 0, (_pos select 1) - _setRand, _pos select 2];};
			case 3: {_pos = [(_pos select 0) - _setRand, _pos select 1, _pos select 2];};
			case 4: {_pos = [_pos select 0, (_pos select 1) + _setRand, _pos select 2];};
			case 5: {_pos = [(_pos select 0) + _setRand, (_pos select 1) - _set1Rand, _pos select 2];};
			case 6: {_pos = [(_pos select 0) - _set1Rand, (_pos select 1) - _setRand, _pos select 2];};
			case 7: {_pos = [(_pos select 0) - _setRand, (_pos select 1) + _set1Rand, _pos select 2];};
			case 8: {_pos = [_pos select 0, (_pos select 1) + _set1Rand, _pos select 2];};
		};
		
		_marker = createMarkerLocal [_stadtP, _pos];
		//_marker setMarkerText _stadt;
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerTypeLocal "Empty";
		_marker setMarkerColorLocal _farbeSet;
		_marker setMarkerBrushLocal "Solid";
		_marker setMarkerSizeLocal [_distSet, _distSet];
		
		hint format["Dir wurde für %1€ eine Markierung in %2 gesetzt. Die Distanz beträgt %3 Meter.",[_endSumme] call life_fnc_numberText,_stadt,_distSet];
		
		_set = player getVariable["MuellMarker",""];
		if(player getVariable "MuellMarker" > 0) then
		{
			_set = _set + 1;
			player setVariable["MuellMarker",_set,false];
		} else {
			player setVariable["MuellMarker",1,false];
		};
		
		if((count muellMarkSet) > 0) then
		{
			muellMarkSet = muellMarkSet + [[_stadtP]];
		} else {
			muellMarkSet = [[_stadtP]];
		};

		if(life_beatgeld > _endSumme) then
		{
			life_beatgeld = life_beatgeld - _endSumme;
		} else {
			
			if(life_beatbankgeld == 0) exitWith {hint "Du hast nicht genug Geld.";};
			life_beatbankgeld = life_beatbankgeld - _endSumme;
		};
		
		closedialog 0;
		openmap true;
	};

	} else {
	hint format["In der Stadt %1 wurde die Mülltonne schon verkauft.",_stadt];
};