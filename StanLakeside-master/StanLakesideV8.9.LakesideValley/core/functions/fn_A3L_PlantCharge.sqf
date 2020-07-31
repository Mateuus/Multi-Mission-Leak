if ((player distance prisondoor) < 10) then {

	private ["_copamount"];
	if ((side player) == west) exitwith {prisondoor animate ['maindoor1', 0]; prisondoor animate ['maindoor2', 0]; ["Wejscie do wiezienia zamkniete",30,"red"] spawn domsg; };
	_copamount = 0; 
	{if (side _x == west) then {_copamount = _copamount + 1};} foreach playableUnits;
	if (_copamount < 5) exitwith {["Musi byc przynajmniej 5 policjantow!",30,"red"] spawn domsg;};

	if (prisondoor getVariable ["robbed", false]) exitwith {["Niedawno ktos sie wlamywal do wiezienia!",30,"red"] spawn domsg;};
	if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {["Nie masz ladunku wybuchowego!",30,"red"] spawn domsg;};
	["dbe", false] remoteExec ["fnc_dispatch",west];
	[] call fnc_placec4;

};