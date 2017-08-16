private["_vehicle"];
_vehicle = cursorTarget;
titleText["Stand clear, the vehicle will unflip in 3 seconds..","PLAIN"];
sleep 3;
_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2) + 0.5];
