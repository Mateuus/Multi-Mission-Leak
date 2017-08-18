/*
	File: fn_borderGate.sqf
	Author: Michael Francis (Amras86)
	
	Description:
	Allows cops to open and close bargates for whichever specifically named bargates you list below.
*/
_gate = _this select 3;

switch (_gate) do
{
	case "n_border_gate1":
	{
		if(n_border_gate1 animationPhase "Door_1_rot" == 0) then
		{
			n_border_gate1 animate ["Door_1_rot", 1];
			sleep 10;
			n_border_gate1 animate ["Door_1_rot", 0];
		}
		else
		{
			n_border_gate1 animate ["Door_1_rot", 0];
		};
	};
	
	case "n_border_gate2":
	{
		if(n_border_gate2 animationPhase "Door_1_rot" == 0) then
		{
			n_border_gate2 animate ["Door_1_rot", 1];
			sleep 10;
			n_border_gate2 animate ["Door_1_rot", 0];
		}
		else
		{
			n_border_gate2 animate ["Door_1_rot", 0];
		};
	};
	
	case "n_border_gate3":
	{
		if(n_border_gate3 animationPhase "Door_1_rot" == 0) then
		{
			n_border_gate3 animate ["Door_1_rot", 1];
			sleep 10;
			n_border_gate3 animate ["Door_1_rot", 0];
		}
		else
		{
			n_border_gate3 animate ["Door_1_rot", 0];
		};
	};
	
	case "n_border_gate4":
	{
		if(n_border_gate4 animationPhase "Door_1_rot" == 0) then
		{
			n_border_gate4 animate ["Door_1_rot", 1];
			sleep 10;
			n_border_gate4 animate ["Door_1_rot", 0];
		}
		else
		{
			n_border_gate4 animate ["Door_1_rot", 0];
		};
	};
	
	case "s_border_gate1":
	{
		if(s_border_gate1 animationPhase "Door_1_rot" == 0) then
		{
			s_border_gate1 animate ["Door_1_rot", 1];
			sleep 10;
			s_border_gate1 animate ["Door_1_rot", 0];
		}
		else
		{
			s_border_gate1 animate ["Door_1_rot", 0];
		};
	};
	
	case "s_border_gate2":
	{
		if(s_border_gate2 animationPhase "Door_1_rot" == 0) then
		{
			s_border_gate2 animate ["Door_1_rot", 1];
			sleep 10;
			s_border_gate2 animate ["Door_1_rot", 0];
		}
		else
		{
			s_border_gate2 animate ["Door_1_rot", 0];
		};
	};
	
	case "s_border_gate3":
	{
		if(s_border_gate3 animationPhase "Door_1_rot" == 0) then
		{
			s_border_gate3 animate ["Door_1_rot", 1];
			sleep 10;
			s_border_gate3 animate ["Door_1_rot", 0];
		}
		else
		{
			s_border_gate3 animate ["Door_1_rot", 0];
		};
	};
	
	case "s_border_gate4":
	{
		if(s_border_gate4 animationPhase "Door_1_rot" == 0) then
		{
			s_border_gate4 animate ["Door_1_rot", 1];
			sleep 10;
			s_border_gate4 animate ["Door_1_rot", 0];
		}
		else
		{
			s_border_gate4 animate ["Door_1_rot", 0];
		};
	};
};