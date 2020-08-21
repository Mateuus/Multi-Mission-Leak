#include "..\script_macros.hpp"
/*
	File: fn_initPayChecks.sqf
	Author: ScarsoLP

    Created: 15th September 2015
    Last Modified: 25th March 2016

	Description:
	Changes The Player(s) paycheck depending on what rank/level they are in the Police/NHS/Donator. 
    Also changes the palyer(s) paycheck depending on what licenses they have.
*/

/* Changes The Paycheck Depending On Levels */

switch (playerSide) do
{
	case west:
	{
		switch(FETCH_CONST(life_coplevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;};
			case 1: {life_paycheck = life_paycheck + 500;}; 
			case 2: {life_paycheck = life_paycheck + 1000;}; 
			case 3: {life_paycheck = life_paycheck + 1500;}; 
			case 4: {life_paycheck = life_paycheck + 2000;}; 
			case 5: {life_paycheck = life_paycheck + 2500;}; 
			case 6: {life_paycheck = life_paycheck + 3000;}; 
			case 7: {life_paycheck = life_paycheck + 3500;};
			case 8: {life_paycheck = life_paycheck + 4000;};
		};
	};

	case independent:
	{
		switch(FETCH_CONST(life_mediclevel)) do
		{
			case 0: {life_paycheck = life_paycheck + 0;}; 
			case 1: {life_paycheck = life_paycheck + 500;}; 
			case 2: {life_paycheck = life_paycheck + 1000;}; 
			case 3: {life_paycheck = life_paycheck + 1500;};
			case 4: {life_paycheck = life_paycheck + 2000;};
			case 5: {life_paycheck = life_paycheck + 2500;};
		};
	};
};

/* Changes The Paycheck Depending On Licenses */

/* Civilian Changes */

if(license_civ_rebel) then
{
	life_paycheck = life_paycheck + 1000;
};