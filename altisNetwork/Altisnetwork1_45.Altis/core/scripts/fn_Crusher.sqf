#include "..\..\script_macros.hpp"
/*
 File: fn_crusher
 
 Author: JedINyte
 
 Description: Activates the crushing machine
*/

_act = Gate12 animate ["Door_1_Move", 0];
sleep 1;
_act = Gate12 animate ["Door_1_Move", 1];
sleep 1;
_act = Gate12 animate ["Door_1_Move", 0];
hintSilent "Crusher reset!";
