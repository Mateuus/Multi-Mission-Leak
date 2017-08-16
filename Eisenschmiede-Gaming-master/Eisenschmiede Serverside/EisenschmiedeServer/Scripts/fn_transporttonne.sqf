//::::::::::::  ::::::::::::\\
//	Filename: Core/D41/fn_D41_TransportTonne.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Aufnehmen oder abstellen der Meth Tonne
//::::::::::::  ::::::::::::\\
private["_WillTragen"];

	_WillTragen = _this select 0;
	
	if(_WillTragen)then
	{
		if(count(attachedObjects player) != 0)exitWith{hint localize "STR_ANOTF_Error"};
		_Obj = nearestObject[getPosATL player, "Land_MetalBarrel_F"];
		if((typeOf _Obj) isEqualTo "Land_MetalBarrel_F")then
		{
			_Obj attachTo [player,[0,1,0.5]];
		};
	}
	else
	{
		{
			detach _x;
			_x enableSimulation false;
			sleep 0.1;
			_x enableSimulation true;
		}forEach attachedObjects player;
	};