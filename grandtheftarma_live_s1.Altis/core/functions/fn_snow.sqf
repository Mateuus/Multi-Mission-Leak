/*
    File: fn_snow.sqf
    Author: The Mighty Lord

    Description:
    Make it snow for the bitches
*/

private ["_obj", "_pos", "_snow", "_fog"];

//--- Hint event
[1, "GTA weather forecast is predicting an incoming snow storm! It is set to hit Altis within the next 5 minutes, so be prepared!", ["SNOW STORM EVENT", "#FF0000"]] call GTA_fnc_broadcast;

sleep 120;

//--- Start event
[1, "THE SNOW STORM WILL HIT ANY SECOND NOW!", ["SNOW STORM EVENT", "#FF0000"]] call GTA_fnc_broadcast;

sleep 2;

//--- Christmax music
playMusic "LeadTrack03_F_Bootcamp";

//--- Grey color filter
_snowShit = ppEffectCreate ["colorCorrections", 1501];
_snowShit ppEffectEnable true;
_snowShit ppEffectAdjust [1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.1], [0.399, 0.287, 0.014, 0.0]];
_snowShit ppEffectCommit 0;

//--- Set wind for snow particles
setWind [3.342, 9.108, true];_obj = player;if ((count _this) > 0) then{_obj = _this select 0;};_pos = position (vehicle _obj);

//--- Spawn snow particles
_snow = "#particlesource" createVehicleLocal _pos;
_snow setParticleParams [["\A3\Data_f\cl_water.p3d", 2, 1, 1], "","Billboard",1,7,[0, 0, 20.0], [0, 0, -0.35],1.0,0.000001,0.0, 0.4, [0.17,0.05], [[1.0,1.0,1.0,1.0], [0.94,0.94,0.96,1.0], [1.0,1.0,1.0,1.0]], [0, 1], 0, 0.01, "", "", _obj];
_snow setParticleRandom [2, [35, 35, 10], [0.0, 0.0, -0.1], 0.001, 0.05, [0.01, 0.01, 0.01, 0.02], 0.002, 360];
_snow setParticleCircle [0, [0.0, 0.0, -0.01] ];
_snow setDropInterval 0.0005;

//--- Spawn fog particles
_fog = "#particlesource" createVehicleLocal _pos; _fog setParticleParams [["\A3\Data_f\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj];
_fog setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog setParticleCircle [0.1, [0, 0, -0.12]];
_fog setDropInterval 0.01;

sleep 50;

//--- Stop event
[1, "Hope you enjoyed it! GTA wishes you a Merry Christmas! Enjoy the XP boost!", ["SNOW STORM EVENT", "#FF0000"]] call GTA_fnc_broadcast;

sleep 2;

//--- XP
if ([] call GTA_fnc_isMonthlySale) then {

  [ 500, "Merry Christmas" ] call GTA_fnc_addExp;

} else {

  [ 1000, "Merry Christmas" ] call GTA_fnc_addExp;

};

sleep 3;

//--- Force stop music
playMusic "";

//--- Destroy color filter
ppEffectDestroy _snowShit;

//--- Stop snow & fog
_snow setDropInterval 0.0;
_fog setDropInterval 0.0;
