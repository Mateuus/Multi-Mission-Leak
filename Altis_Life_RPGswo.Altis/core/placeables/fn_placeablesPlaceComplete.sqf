/*
	Author: Maximum
	Description: Placeables for the cop\medic sides.
	Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE... Credits: Killerty69 for a second pare of eyes when mine got to sleepy
	P.S. - Don't be a faggot like i know some of you all will be.

	edited by: blackfisch
*/
disableSerialization;
if (!DWEV_barrier_active) exitWith {};
if (DWEV_barrier_activeObj isEqualTo ObjNull) exitWith {};

_currentPos = getPosATL DWEV_barrier_activeObj;
detach DWEV_barrier_activeObj;
DWEV_barrier_activeObj setPos[(getPos DWEV_barrier_activeObj select 0), (getPos DWEV_barrier_activeObj select 1), 0];
DWEV_barrier_activeObj enableSimulationGlobal true;
DWEV_bar_placey pushBack DWEV_barrier_activeObj;

DWEV_barrier_active = false;
DWEV_barrier_activeObj = ObjNull;