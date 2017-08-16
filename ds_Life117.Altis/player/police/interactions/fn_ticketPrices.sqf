/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Shows a cop the ticket prices
*/
private["_str"];

_str = parseText "<t color='#4CCF00' size='2'>Ticket Prices</t><br/><br/>
<t color='#FFFF00'><t align='left'>Crime           </t><t align='right'>Fine</t></t><br/><br/><br/>
<t color='#FFFF00'><t align='left'>Man Slaughter   </t><t align='right'>$3000</t></t><br/>
<t color='#FFFF00'><t align='left'>Attempted GTA   </t><t align='right'>$500</t></t><br/>
<t color='#FFFF00'><t align='left'>Robbery         </t><t align='right'>$1000</t></t><br/>
<t color='#FFFF00'><t align='left'>Kidnapping      </t><t align='right'>$1000</t></t><br/>
<t color='#FFFF00'><t align='left'>Petty Theft     </t><t align='right'>$200</t></t><br/>
<t color='#FFFF00'><t align='left'>Hit and Run     </t><t align='right'>$500</t></t><br/>
<t color='#FFFF00'><t align='left'>Burglary        </t><t align='right'>$600</t></t><br/>
<t color='#FFFF00'><t align='left'>Evading Police  </t><t align='right'>$2000</t></t><br/>
<t color='#FFFF00'><t align='left'>Reckless Driving</t><t align='right'>$1800</t></t><br/>
<t color='#FFFF00'><t align='left'>Illegal Weapon  </t><t align='right'>$1600</t></t><br/>
<t color='#FFFF00'><t align='left'>Vandalism       </t><t align='right'>$2100</t></t><br/>
<t color='#FFFF00'><t align='left'>Careless Flying </t><t align='right'>$3200</t></t><br/>
<t color='#FFFF00'><t align='left'>Accessory       </t><t align='right'>$1400</t></t><br/>
<t color='#FFFF00'><t align='left'>Drunk Driving   </t><t align='right'>$900</t></t><br/>
<t color='#FFFF00'><t align='left'>Bribery         </t><t align='right'>$600</t></t><br/>
<t color='#FFFF00'><t align='left'>Breach of Peace </t><t align='right'>$1000</t></t><br/>
<t color='#FFFF00'><t align='left'>Arson           </t><t align='right'>$800</t></t><br/>
<t color='#FFFF00'><t align='left'>Tress passing   </t><t align='right'>$1200</t></t><br/>
<t color='#FFFF00'><t align='left'>Chop shopping   </t><t align='right'>$5000</t></t><br/><br/>
<t color='#FFFF00'>Trolling police is not a crime, charge them with breach of peace etc, if they continue send them to the holding cell for 5 minutes</t><br/>";
hint _str;