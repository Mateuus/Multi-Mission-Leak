private ["_type"];
_type = _this select 0;
closeDialog 0;



if(_type == 1) then
{

sleep 15;

//Activate ppEffects we need

//"radialBlur" ppEffectEnable true;
enableCamShake true;
"radialBlur" ppEffectEnable true;
//Let's go for 45secs of effetcs
for "_i" from 0 to 60 do
{
     
	"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 2, 1, random 3];
    sleep 1;
};


"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;


"radialBlur" ppEffectEnable false;
resetCamShake;
};
if(_type == 2) then
{

sleep 5;

//Activate ppEffects we need

//"radialBlur" ppEffectEnable true;
enableCamShake true;
"radialBlur" ppEffectEnable true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 60 do
{
     
	"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 4, 1, random 5];
    sleep 1;
};

"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;

sleep 3;

"radialBlur" ppEffectEnable false;

resetCamShake;

};