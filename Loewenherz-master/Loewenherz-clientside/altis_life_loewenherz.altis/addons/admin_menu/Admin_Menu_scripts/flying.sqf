//Beginning flying script by Jason7032
//First shot at a flying script; any feedback/suggestions are welcome

forwardAndBackward = 4; 	//Changes how fast you move forward and backward
leftAndRight = 5; 		//Changes how fast you turn left and right
upAndDown = 5; 			//Changes how fast you go up or down (Gravity still brings you down on its own)
distanceFromGround = 1; 	//Changes distance off the ground you have to be before flying controls will work
hovering = nil;
hoverPos = nil;

move_forward =
{
		if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
		{
			_forwardCurrentDirection = getdir (vehicle player);
			_forwardCurrentPosition = getPosATL (vehicle player);
			(vehicle player) setdir _forwardCurrentDirection;
			(vehicle player) setPosATL [(_forwardCurrentPosition select 0) + forwardAndBackward * sin(_forwardCurrentDirection),(_forwardCurrentPosition select 1) + forwardAndBackward * cos(_forwardCurrentDirection),(_forwardCurrentPosition select 2)];
			player setVariable["lastPos",1];player setVariable["lastPos",[]];
		};
};

move_left =
{
		if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
		{
			_leftDirection = getdir (vehicle player);
			(vehicle player) setdir (_leftDirection) - leftAndRight;
			player setVariable["lastPos",1];player setVariable["lastPos",[]];
		};
};

move_backward =
{
		if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
		{
			_backwardCurrentDirection = getdir (vehicle player);
			_backwardCurrentPosition = getPosATL (vehicle player);
			(vehicle player) setdir _backwardCurrentDirection;
			(vehicle player) setPosATL [(_backwardCurrentPosition select 0) - forwardAndBackward * sin(_backwardCurrentDirection),(_backwardCurrentPosition select 1) - forwardAndBackward * cos(_backwardCurrentDirection),(_backwardCurrentPosition select 2)];
			player setVariable["lastPos",1];player setVariable["lastPos",[]];
		};
};

move_right =
{
		if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
		{
			_rightDirection = getdir (vehicle player);
			(vehicle player) setdir (_rightDirection) + leftAndRight;
			player setVariable["lastPos",1];player setVariable["lastPos",[]];
		};
};

move_up =
{
	if ((getPosATL (vehicle player) select 2) < distanceFromGround) then
	{

	};
	
	_upCurrentDirection = getdir (vehicle player);
	_upCurrentPosition = getPosATL (vehicle player);
	(vehicle player) setdir _upCurrentDirection;
	(vehicle player) setPosATL [(_upCurrentPosition select 0), (_upCurrentPosition select 1), (_upCurrentPosition select 2) + upAndDOwn];
	player setVariable["lastPos",1];player setVariable["lastPos",[]];
};

move_down =
{
		if ((getPosATL (vehicle player) select 2) > distanceFromGround) then
		{
			_downCurrentDirection = getdir (vehicle player);
			_downCurrentPosition = getPosATL (vehicle player);
			(vehicle player) setdir _downCurrentDirection;
			(vehicle player) setPosATL [(_downCurrentPosition select 0), (_downCurrentPosition select 1), (_downCurrentPosition select 2) - upAndDown];
			player setVariable["lastPos",1];player setVariable["lastPos",[]];
		};
};

toggle_hover =
{
	if (isnil "hovering") then
	{
		hovering = true;
		titleText ["Now hovering","PLAIN DOWN"]; titleFadeOut 4;
		hoverPos = getPosATL (vehicle player);
	}
	else
	{
		hovering = nil;
		titleText ["No longer hovering","PLAIN DOWN"]; titleFadeOut 4;
		//hoverPos = nil;
	};
};

if (isnil "iBeFlying") then 
{
	titleText ["We're flying!!! (Press F4 to toggle hover)","PLAIN DOWN"]; titleFadeOut 4;
	iBeFlying = true;
	keyForward = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 17) then {call move_forward;}"]; 	//W - Forward
	keyLeft = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 30) then {call move_left;}"]; 		//A - Left
	keyBackward = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 31) then {call move_backward;}"]; 	//S - Backward
	keyRight = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 32) then {call move_right;}"]; 		//D - Right
	keyUp = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 16) then {call move_up;}"]; 		//Q - Up
	keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 44) then {call move_down;}"]; 		//Z - Down
	keyHover = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 62) then {call toggle_hover;}"]; 	//F4 - Toggle Hover
}
else
{
	titleText ["Going Down!!!","PLAIN DOWN"]; titleFadeOut 4;
	iBeFlying = nil;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyForward];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyLeft];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyBackward];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyRight];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyUp];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDown];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyHover];
};

while {iBeFlying} do
{

	//Added this for those that want to dunk in some water to remove the effects of gravity
	
	if (hovering) then
	{
		(vehicle player) setPosATL [(hoverPos select 0), (hoverPos select 1), (hoverPos select 2)];
		player setVariable["lastPos",1];player setVariable["lastPos",[]];
		sleep .001;
	};
};