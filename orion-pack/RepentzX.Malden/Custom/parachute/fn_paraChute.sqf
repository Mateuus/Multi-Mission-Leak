waituntil {!(IsNull (findDisplay 46))};  _keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 25) then {
if (!(isTouchingGround player) and (vehicle player == player)) then {
[] spawn {player switchCamera 'EXTERNAL';Player SwitchMove 'AswmPercMrunSnonWnonDf_AswmPercMstpSnonWnonDnon';addCamShake [4, 2, 20];
sleep 0.7;playSound3D ['@SCS\Sound\Parachute.ogg', Player, false, GetPosASL Player,5, 1, 250];
titleText ['', 'White IN', 0.6];addCamShake [2, 2, 10];chute = createVehicle ['Steerable_Parachute_F', position Player, [], 0, 'Fly'];
chute setPos position player;player moveIndriver chute; chute allowDamage false;};   
};
}"];