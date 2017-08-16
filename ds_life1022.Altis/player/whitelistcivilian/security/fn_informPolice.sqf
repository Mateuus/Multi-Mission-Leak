/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Informs police when a security contractor sends a criminal to a police station
*/

private["_hunter","_criminal","_location"];

if(!(playerSide isEqualTo west)) exitwith {};

systemchat "A Security Contractor is sending a criminal to the Kavala Police HQ for processing, they will be there in 2 minutes (Remember two minutes must be removed from their jail sentence)";
hint "A Security Contractor is sending a criminal to the Kavala Police HQ for processing, they will be there in 2 minutes (Remember two minutes must be removed from their jail sentence)";
player say3D "dingDong";
player say3D "dingDong";
titleText ["A Security Contractor is sending a criminal to the Kavala Police HQ for processing, they will be there in 2 minutes (Remember two minutes must be removed from their jail sentence)","PLAIN DOWN"];