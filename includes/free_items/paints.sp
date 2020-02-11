#include <sourcemod>
#include <tf2_stocks>
#include <sdktools>
#include <clientprefs>
#include <morecolors>

Handle h_clientSkin[4];
#define PaintsTag "{green}[Paints]{white}"
#define WarpaintsTag "{green}<Warpaints>{white}"

public PaintsMenuCallBack(Handle:h_Menu, MenuAction action, int client, int itemNum)
{
	if(client == 0)
	{
		return 0;
	}

	new TFClassType:class = TF2_GetPlayerClass(client);
	if(action == MenuAction_Select)
	{
		switch(itemNum)
		{
			case 0:
			{
				Handle menue = CreateMenu(WarpaintsMenuCallBack);
				SetMenuTitle(menue, "Recursion.TF >> Warpaints");
				AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
				AddMenuItem(menue, "1", "Primary Weapon");
				AddMenuItem(menue, "2", "Secondary Weapon");
				AddMenuItem(menue, "3", "Melee Weapon");
				AddMenuItem(menue, "4", "------------------------------", ITEMDRAW_DISABLED);
				AddMenuItem(menue, "5", "Wear Quality");
				AddMenuItem(menue, "6", "Remove All Paints");
				DisplayMenu(menue, client, 60);
			}
			case 2:
			{
				if(class == TFClass_Scout)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15036", "Spruce Deuce - Teufort Collection");
					AddMenuItem(menue, "15015", "Tartan Torpedo - Craftsmann Collection");
					AddMenuItem(menue, "15021", "Country Crusher - Craftsmann Collection");
					AddMenuItem(menue, "15029", "Backcountry Blaster - Craftsmann Collection");
					AddMenuItem(menue, "15002", "Night Terror - Concealed Killer Collection");
					AddMenuItem(menue, "15053", "Current Event - Powerhouse Collection");
					AddMenuItem(menue, "15065", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15069", "Nutcracker - Harvest Collection");
					AddMenuItem(menue, "15131", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15106", "Blue Mew - Pyroland Collection");
					AddMenuItem(menue, "15108", "Shot to Hell - Pyroland Collection");
					AddMenuItem(menue, "15107", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15151", "Killer Bee - Warbird Collection");
					AddMenuItem(menue, "15157", "Corsair - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Soldier)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15043", "Smalltown Bringdown - Teufort Collection");
					AddMenuItem(menue, "15028", "American Pastoral - Craftsmann Collection");
					AddMenuItem(menue, "15014", "Sand Cannon - Concealed Killer Collection");
					AddMenuItem(menue, "15006", "Woodland Warrior - Concealed Killer Collection");
					AddMenuItem(menue, "15052", "Shell Shocker - Powerhouse Collection");
					AddMenuItem(menue, "15057", "Aqua Marine - Powerhouse Collection");
					AddMenuItem(menue, "15081", "Autumn - Harvest Collection");
					AddMenuItem(menue, "15129", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15130", "High Roller - Gentlemanne's Collection");
					AddMenuItem(menue, "15104", "Blue Mew - Pyroland Collection");
					AddMenuItem(menue, "15105", "Brain Candy - Pyroland Collection");
					AddMenuItem(menue, "15150", "Warhawk - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}

				if(class == TFClass_Pyro)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15030", "Bovine Blazemaker - Teufort Collection");
					AddMenuItem(menue, "15034", "Earth, Sky and Fire - Teufort Collection");
					AddMenuItem(menue, "15017", "Barn Burner - Craftsmann Collection");
					AddMenuItem(menue, "15005", "Forest Fire - Concealed Killer Collection");
					AddMenuItem(menue, "15049", "Flash Fryer - Powerhouse Collection");
					AddMenuItem(menue, "15054", "Turbine Torcher - Powerhouse Collection");
					AddMenuItem(menue, "15067", "Pumpkin Patch - Harvest Collection");
					AddMenuItem(menue, "15066", "Autumn - Harvest Collection");
					AddMenuItem(menue, "15068", "Nutcracker - Harvest Collection");
					AddMenuItem(menue, "15115", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15090", "Rainbow - Pyroland Collection");
					AddMenuItem(menue, "15089", "Balloonicorn - Pyroland Collection");
					AddMenuItem(menue, "15141", "Warhawk - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_DemoMan)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15079", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15077", "Autumn - Harvest Collection");
					AddMenuItem(menue, "15117", "Top Shelf - Gentlemanne's Collection");
					AddMenuItem(menue, "15116", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15091", "Rainbow - Pyroland Collection");
					AddMenuItem(menue, "15092", "Sweet Dreams - Pyroland Collection");
					AddMenuItem(menue, "15142", "Warhawk - Warbird Collection");
					AddMenuItem(menue, "15158", "Butcher Bird - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Heavy)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15031", "War Room - Teufort Collection");
					AddMenuItem(menue, "15040", "Citizen Pain - Teufort Collection");
					AddMenuItem(menue, "15020", "Iron Wood - Craftsmann Collection");
					AddMenuItem(menue, "15026", "Antique Annihilator - Craftsmann Collection");
					AddMenuItem(menue, "15004", "King of the Jungle - Concealed Killer Collection");
					AddMenuItem(menue, "15055", "Brick House - Powerhouse Collection");
					AddMenuItem(menue, "15087", "Pumpkin Patch - Harvest Collection");
					AddMenuItem(menue, "15086", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15088", "Nutcracker - Harvest Collection");
					AddMenuItem(menue, "15125", "Top Shelf - Gentlemanne's Collection");
					AddMenuItem(menue, "15123", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15124", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15099", "Mister Cuddles - Pyroland Collection");
					AddMenuItem(menue, "15098", "Brain Candy - Pyroland Collection");
					AddMenuItem(menue, "15147", "Butcher Bird - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Engineer)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15044", "Civic Duty - Teufort Collection");
					AddMenuItem(menue, "15016", "Rustic Ruiner - Craftsmann Collection");
					AddMenuItem(menue, "15003", "Backwoods Boomstick - Concealed Killer Collection");
					AddMenuItem(menue, "15047", "Lightning Rod - Powerhouse Collection");
					AddMenuItem(menue, "15085", "Autumn Shotgun - Harvest Collection");
					AddMenuItem(menue, "15132", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15133", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15109", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15152", "Red Bear - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Medic)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for the syringe gun.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Sniper)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15033", "Bogtrotter - Teufort Collection");
					AddMenuItem(menue, "15019", "Lumber From Down Under - Craftsmann Collection");
					AddMenuItem(menue, "15023", "Shot in the Dark - Craftsmann Collection");
					AddMenuItem(menue, "15007", "Purple Range - Concealed Killer Collection");
					AddMenuItem(menue, "15000", "Night Owl - Concealed Killer Collection");
					AddMenuItem(menue, "15059", "Thunderbolt - Powerhouse Collection");
					AddMenuItem(menue, "15071", "Boneyard - Harvest Collection");
					AddMenuItem(menue, "15070", "Pumpkin Patch - Harvest Collection");
					AddMenuItem(menue, "15072", "Wildwood - Harvest Collection");
					AddMenuItem(menue, "15135", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15136", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15112", "Rainbow - Pyroland Collection");
					AddMenuItem(menue, "15111", "Balloonicorn - Pyroland Collection");
					AddMenuItem(menue, "15154", "Airwolf - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Spy)
				{
					Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Primary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15042", "Mayor - Teufort Collection");
					AddMenuItem(menue, "15027", "Old Country - Craftsmann Collection");
					AddMenuItem(menue, "15011", "Psychedelic Slugger - Concealed Killer Collection");
					AddMenuItem(menue, "15051", "Dead Reckoner - Powerhouse Collection");
					AddMenuItem(menue, "15062", "Boneyard - Harvest Collection");
					AddMenuItem(menue, "15064", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15063", "Wildwood - Harvest Collection");
					AddMenuItem(menue, "15128", "Top Shelf - Gentlemanne's Collection");
					AddMenuItem(menue, "15127", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15103", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15149", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
			}
			case 3:
			{
				if(class == TFClass_Scout)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15035", "Hickory Hole-Puncher - Teufort Collection");
					AddMenuItem(menue, "15041", "Local Hero - Teufort Collection");
					AddMenuItem(menue, "15018", "Homemade Heater - Craftsmann Collection");
					AddMenuItem(menue, "15013", "Red Rock Roscoe - Concealed Killer Collection");
					AddMenuItem(menue, "15046", "Black Dahlia - Powerhouse Collection");
					AddMenuItem(menue, "15056", "Sandstone Special - Powerhouse Collection");
					AddMenuItem(menue, "15060", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15061", "Nutcracker - Harvest Collection");
					AddMenuItem(menue, "15126", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15100", "Blue Mew - Pyroland Collection");
					AddMenuItem(menue, "15102", "Shot to Hell - Pyroland Collection");
					AddMenuItem(menue, "15101", "Brain Candy - Pyroland Collection");
					AddMenuItem(menue, "15148", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Soldier)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15044", "Civic Duty - Teufort Collection");
					AddMenuItem(menue, "15016", "Rustic Ruiner - Craftsmann Collection");
					AddMenuItem(menue, "15003", "Backwoods Boomstick - Concealed Killer Collection");
					AddMenuItem(menue, "15047", "Lightning Rod - Powerhouse Collection");
					AddMenuItem(menue, "15085", "Autumn Shotgun - Harvest Collection");
					AddMenuItem(menue, "15132", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15133", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15109", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15152", "Red Bear - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Pyro)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15044", "Civic Duty - Teufort Collection");
					AddMenuItem(menue, "15016", "Rustic Ruiner - Craftsmann Collection");
					AddMenuItem(menue, "15003", "Backwoods Boomstick - Concealed Killer Collection");
					AddMenuItem(menue, "15047", "Lightning Rod - Powerhouse Collection");
					AddMenuItem(menue, "15085", "Autumn Shotgun - Harvest Collection");
					AddMenuItem(menue, "15132", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15133", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15109", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15152", "Red Bear - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_DemoMan)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15038", "Rooftop Wrangler - Teufort Collection");
					AddMenuItem(menue, "15024", "Blasted Bombardier -  Craftsmann Collection");
					AddMenuItem(menue, "15009", "Sudden Flurry - Concealed Killer Collection");
					AddMenuItem(menue, "15012", "Carpet Bomber - Concealed Killer Collection");
					AddMenuItem(menue, "15045", "Liquid Asset - Powerhouse Collection");
					AddMenuItem(menue, "15048", "Pink Elephant - Powerhouse Collection");
					AddMenuItem(menue, "15083", "Pumpkin Patch - Harvest Collection");
					AddMenuItem(menue, "15084", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15082", "Autumn - Harvest Collection");
					AddMenuItem(menue, "15137", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15138", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15113", "Sweet Dreams - Pyroland Collection");
					AddMenuItem(menue, "15155", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Heavy)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15044", "Civic Duty - Teufort Collection");
					AddMenuItem(menue, "15016", "Rustic Ruiner - Craftsmann Collection");
					AddMenuItem(menue, "15003", "Backwoods Boomstick - Concealed Killer Collection");
					AddMenuItem(menue, "15047", "Lightning Rod - Powerhouse Collection");
					AddMenuItem(menue, "15085", "Autumn - Harvest Collection");
					AddMenuItem(menue, "15132", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15133", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15109", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15152", "Red Bear - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Engineer)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15035", "Hickory Hole-Puncher - Teufort Collection");
					AddMenuItem(menue, "15041", "Local Hero - Teufort Collection");
					AddMenuItem(menue, "15018", "Homemade Heater - Craftsmann Collection");
					AddMenuItem(menue, "15013", "Red Rock Roscoe - Concealed Killer Collection");
					AddMenuItem(menue, "15046", "Black Dahlia - Powerhouse Collection");
					AddMenuItem(menue, "15056", "Sandstone Special - Powerhouse Collection");
					AddMenuItem(menue, "15060", "Macabre Web - Harvest Collection");
					AddMenuItem(menue, "15061", "Nutcracker - Harvest Collection");
					AddMenuItem(menue, "15126", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15100", "Blue Mew - Pyroland Collection");
					AddMenuItem(menue, "15102", "Shot to Hell - Pyroland Collection");
					AddMenuItem(menue, "15101", "Brain Candy - Pyroland Collection");
					AddMenuItem(menue, "15148", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Medic)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15039", "Civil Servant - Teufort Collection");
					AddMenuItem(menue, "15025", "Reclaimed Reanimator - Craftsmann Collection");
					AddMenuItem(menue, "15010", "Wrapped Reviver - Concealed Killer Collection");
					AddMenuItem(menue, "15008", "Masked Mender - Concealed Killer Collection");
					AddMenuItem(menue, "15050", "Spark of Life - Powerhouse Collection");
					AddMenuItem(menue, "15078", "Wildwood - Harvest Collection");
					AddMenuItem(menue, "15122", "High Roller's - Gentlemanne's Collection");
					AddMenuItem(menue, "15120", "Coffin Nail - Gentlemanne's Collection");
					AddMenuItem(menue, "15121", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15097", "Flower Power - Pyroland Collection");
					AddMenuItem(menue, "15146", "Corsair - Warbird Collection");
					AddMenuItem(menue, "15145", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Sniper)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15032", "Treadplate Tormenter - Teufort Collection");
					AddMenuItem(menue, "15037", "Team Sprayer - Teufort Collection");
					AddMenuItem(menue, "15022", "Plaid Potshotter - Craftsmann Collection");
					AddMenuItem(menue, "15001", "Woodsy Widowmaker - Concealed Killer Collection");
					AddMenuItem(menue, "15058", "Low Profile - Powerhouse Collection");
					AddMenuItem(menue, "15076", "Wildwood - Harvest Collection");
					AddMenuItem(menue, "15134", "High Roller's - Gentlemanne's Collection");
					AddMenuItem(menue, "15110", "Blue Mew - Pyroland Collection");
					AddMenuItem(menue, "15153", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Spy)
				{
					Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Secondary Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for the sapper.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
			}
			case 4:
			{
				if(class == TFClass_Scout)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Soldier)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Pyro)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_DemoMan)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Heavy)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Engineer)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15075", "Boneyard - Harvest Collection");
					AddMenuItem(menue, "15074", "Autumn - Harvest Collection");
					AddMenuItem(menue, "15073", "Nutcracker - Harvest Collection");
					AddMenuItem(menue, "15140", "Top Shelf - Gentlemanne's Collection");
					AddMenuItem(menue, "15139", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15114", "Torqued to Hell - Pyroland Collection");
					AddMenuItem(menue, "15156", "Airwolf - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Medic)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Sniper)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "1", "No paints avaliable for melee.", ITEMDRAW_DISABLED);
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
				if(class == TFClass_Spy)
				{
					Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
					SetMenuTitle(menue, "Recursion.TF >> Paints - Melee Weapon");
					AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
					AddMenuItem(menue, "15080", "Boneyard - Harvest Collection");
					AddMenuItem(menue, "15119", "Top Shelf - Gentlemanne's Collection");
					AddMenuItem(menue, "15118", "Dressed to Kill - Gentlemanne's Collection");
					AddMenuItem(menue, "15094", "Blue Mew - Pyroland Collection");
					AddMenuItem(menue, "15096", "Stabbed to Hell - Pyroland Collection");
					AddMenuItem(menue, "15095", "Brain Candy - Pyroland Collection");
					AddMenuItem(menue, "15144", "Airwolf - Warbird Collection");
					AddMenuItem(menue, "15143", "Blitzkrieg - Warbird Collection");
					SetMenuExitButton(menue, true);
					DisplayMenu(menue, client, 60);
				}
			}
			case 6:
			{
				Handle menue = CreateMenu(SkinQualityMenuCallBack);
				SetMenuTitle(menue, "Recursion.TF >> Paints - Skin Quality");
				AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
				AddMenuItem(menue, "1", "Factory New");
				AddMenuItem(menue, "2", "Minimal Wear");
				AddMenuItem(menue, "3", "Field-Tested");
				AddMenuItem(menue, "4", "Well-Worn");
				AddMenuItem(menue, "5", "Battle Scarred");
				SetMenuExitButton(menue, true);
				DisplayMenu(menue, client, 60);
			}
			case 7:
			{
				RemoveAllPaints(client);
				CPrintToChat(client, "%s All paints have been removed, touch the resupply locker to receive your original weapons.", PaintsTag);
			}
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_Menu);
	}

	return 0;
}

public WarpaintsMenuCallBack(Handle h_Menu, MenuAction action, int client, int itemNum)
{
	if(client == 0)
	{
		return 0;
	}

	new TFClassType:class = TF2_GetPlayerClass(client);
	if(action == MenuAction_Select)
	{
		switch(itemNum)
		{
			case 1:
			{
				Handle menue = CreateMenu(Paints_PrimaryMenuCallBack);
				SetMenuTitle(menue, "Recursion.TF >> Warpaints - Primary Weapon");
				AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
        AddMenuItem(menue, "102", "Wrapped Reviver");
        AddMenuItem(menue, "104", "Carpet Bomber");
        AddMenuItem(menue, "105", "Masked Mender");
        AddMenuItem(menue, "106", "Woodland Warrior");
        AddMenuItem(menue, "109", "Forest Fire");
        AddMenuItem(menue, "112", "Backwoods Boomstick");
        AddMenuItem(menue, "113", "Woodsy Widowmaker");
        AddMenuItem(menue, "114", "Night Owl");
        AddMenuItem(menue, "120", "Iron Wood");
        AddMenuItem(menue, "122", "Plaid Potshotter");
        AddMenuItem(menue, "130", "Bovine Blazemaker");
        AddMenuItem(menue, "139", "Civil Servant");
        AddMenuItem(menue, "143", "Smalltown Bringdown");
        AddMenuItem(menue, "144", "Civic Duty");
        AddMenuItem(menue, "151", "Dead Reckoner");
        AddMenuItem(menue, "160", "Autumn");
        AddMenuItem(menue, "161", "Nutcracker");
        AddMenuItem(menue, "163", "Macabre Web");
        AddMenuItem(menue, "300", "Yeti Coated");
        AddMenuItem(menue, "301", "Park Pigmented");
        AddMenuItem(menue, "302", "Mannana Peeled");
        AddMenuItem(menue, "303", "Macaw Masked");
        AddMenuItem(menue, "304", "Sax Waxed");
        AddMenuItem(menue, "305", "Anodized Aloha");
        AddMenuItem(menue, "306", "Bamboo Brushed");
        AddMenuItem(menue, "307", "Tiger Buffed");
        AddMenuItem(menue, "308", "Croc Dusted");
        AddMenuItem(menue, "309", "Pina Polished");
        AddMenuItem(menue, "310", "Leopard Printed");
        AddMenuItem(menue, "390", "Dragon Slayer");
        AddMenuItem(menue, "391", "Smissmas Sweater");
        AddMenuItem(menue, "200", "Bloom Buffed");
        AddMenuItem(menue, "201", "Quack Canvassed");
        AddMenuItem(menue, "202", "Bank Rolled");
        AddMenuItem(menue, "203", "Merc Stained");
        AddMenuItem(menue, "204", "Kill Covered");
        AddMenuItem(menue, "205", "Fire Glazed");
        AddMenuItem(menue, "206", "Pizza Polished");
        AddMenuItem(menue, "207", "Bonk Varnished");
        AddMenuItem(menue, "208", "Star Crossed");
        AddMenuItem(menue, "209", "Clover Camo'd");
        AddMenuItem(menue, "210", "Freedom Wrapped");
        AddMenuItem(menue, "211", "Cardboard Boxed");
        AddMenuItem(menue, "212", "Dream Piped");
        AddMenuItem(menue, "213", "Miami Element");
        AddMenuItem(menue, "214", "Neo Tokyo");
        AddMenuItem(menue, "215", "Geometrical Teams");
        AddMenuItem(menue, "217", "Bomber Soul");
        AddMenuItem(menue, "218", "Granium");
        AddMenuItem(menue, "220", "Cabin Fevered");
        AddMenuItem(menue, "221", "Polar Surprise");
        AddMenuItem(menue, "223", "Mana");
        AddMenuItem(menue, "224", "Dovetailed");
        AddMenuItem(menue, "225", "Cosmic Calamity");
        AddMenuItem(menue, "226", "Hazard Warning");
        AddMenuItem(menue, "228", "Mosaic");
        AddMenuItem(menue, "230", "Jazzy");
        AddMenuItem(menue, "232", "Alien Tech");
        AddMenuItem(menue, "234", "Damascus Mahogany");
        AddMenuItem(menue, "235", "Skull Study");
        AddMenuItem(menue, "236", "Haunted Ghosts");
        AddMenuItem(menue, "237", "Spectral Shimmered");
        AddMenuItem(menue, "238", "Spirit of Halloween");
        AddMenuItem(menue, "239", "Horror Holiday");
        AddMenuItem(menue, "240", "Totally Boned");
        AddMenuItem(menue, "241", "Electroshocked");
        AddMenuItem(menue, "242", "Ghost Town");
        AddMenuItem(menue, "243", "Tumor Toasted");
        AddMenuItem(menue, "244", "Calavera Canvas");
				SetMenuExitButton(menue, true);
				DisplayMenu(menue, client, 60);
			}
			case 2:
			{
				Handle menue = CreateMenu(Paints_SecondaryMenuCallBack);
				SetMenuTitle(menue, "Recursion.TF >> Warpaints - Secondary Weapon");
				AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
        AddMenuItem(menue, "102", "Wrapped Reviver");
        AddMenuItem(menue, "104", "Carpet Bomber");
        AddMenuItem(menue, "105", "Masked Mender");
        AddMenuItem(menue, "106", "Woodland Warrior");
        AddMenuItem(menue, "109", "Forest Fire");
        AddMenuItem(menue, "112", "Backwoods Boomstick");
        AddMenuItem(menue, "113", "Woodsy Widowmaker");
        AddMenuItem(menue, "114", "Night Owl");
        AddMenuItem(menue, "120", "Iron Wood");
        AddMenuItem(menue, "122", "Plaid Potshotter");
        AddMenuItem(menue, "130", "Bovine Blazemaker");
        AddMenuItem(menue, "139", "Civil Servant");
        AddMenuItem(menue, "143", "Smalltown Bringdown");
        AddMenuItem(menue, "144", "Civic Duty");
        AddMenuItem(menue, "151", "Dead Reckoner");
        AddMenuItem(menue, "160", "Autumn");
        AddMenuItem(menue, "161", "Nutcracker");
        AddMenuItem(menue, "163", "Macabre Web");
        AddMenuItem(menue, "300", "Yeti Coated");
        AddMenuItem(menue, "301", "Park Pigmented");
        AddMenuItem(menue, "302", "Mannana Peeled");
        AddMenuItem(menue, "303", "Macaw Masked");
        AddMenuItem(menue, "304", "Sax Waxed");
        AddMenuItem(menue, "305", "Anodized Aloha");
        AddMenuItem(menue, "306", "Bamboo Brushed");
        AddMenuItem(menue, "307", "Tiger Buffed");
        AddMenuItem(menue, "308", "Croc Dusted");
        AddMenuItem(menue, "309", "Pina Polished");
        AddMenuItem(menue, "310", "Leopard Printed");
        AddMenuItem(menue, "390", "Dragon Slayer");
        AddMenuItem(menue, "391", "Smissmas Sweater");
        AddMenuItem(menue, "200", "Bloom Buffed");
        AddMenuItem(menue, "201", "Quack Canvassed");
        AddMenuItem(menue, "202", "Bank Rolled");
        AddMenuItem(menue, "203", "Merc Stained");
        AddMenuItem(menue, "204", "Kill Covered");
        AddMenuItem(menue, "205", "Fire Glazed");
        AddMenuItem(menue, "206", "Pizza Polished");
        AddMenuItem(menue, "207", "Bonk Varnished");
        AddMenuItem(menue, "208", "Star Crossed");
        AddMenuItem(menue, "209", "Clover Camo'd");
        AddMenuItem(menue, "210", "Freedom Wrapped");
        AddMenuItem(menue, "211", "Cardboard Boxed");
        AddMenuItem(menue, "212", "Dream Piped");
        AddMenuItem(menue, "213", "Miami Element");
        AddMenuItem(menue, "214", "Neo Tokyo");
        AddMenuItem(menue, "215", "Geometrical Teams");
        AddMenuItem(menue, "217", "Bomber Soul");
        AddMenuItem(menue, "218", "Granium");
        AddMenuItem(menue, "220", "Cabin Fevered");
        AddMenuItem(menue, "221", "Polar Surprise");
        AddMenuItem(menue, "223", "Mana");
        AddMenuItem(menue, "224", "Dovetailed");
        AddMenuItem(menue, "225", "Cosmic Calamity");
        AddMenuItem(menue, "226", "Hazard Warning");
        AddMenuItem(menue, "228", "Mosaic");
        AddMenuItem(menue, "230", "Jazzy");
        AddMenuItem(menue, "232", "Alien Tech");
        AddMenuItem(menue, "234", "Damascus Mahogany");
        AddMenuItem(menue, "235", "Skull Study");
        AddMenuItem(menue, "236", "Haunted Ghosts");
        AddMenuItem(menue, "237", "Spectral Shimmered");
        AddMenuItem(menue, "238", "Spirit of Halloween");
        AddMenuItem(menue, "239", "Horror Holiday");
        AddMenuItem(menue, "240", "Totally Boned");
        AddMenuItem(menue, "241", "Electroshocked");
        AddMenuItem(menue, "242", "Ghost Town");
        AddMenuItem(menue, "243", "Tumor Toasted");
        AddMenuItem(menue, "244", "Calavera Canvas");
				SetMenuExitButton(menue, true);
				DisplayMenu(menue, client, 60);
			}
			case 3:
			{
				Handle menue = CreateMenu(Paints_MeleeMenuCallBack);
				SetMenuTitle(menue, "Recursion.TF >> Warpaints - Melee Weapon");
				AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
        AddMenuItem(menue, "102", "Wrapped Reviver");
        AddMenuItem(menue, "104", "Carpet Bomber");
        AddMenuItem(menue, "105", "Masked Mender");
        AddMenuItem(menue, "106", "Woodland Warrior");
        AddMenuItem(menue, "109", "Forest Fire");
        AddMenuItem(menue, "112", "Backwoods Boomstick");
        AddMenuItem(menue, "113", "Woodsy Widowmaker");
        AddMenuItem(menue, "114", "Night Owl");
        AddMenuItem(menue, "120", "Iron Wood");
        AddMenuItem(menue, "122", "Plaid Potshotter");
        AddMenuItem(menue, "130", "Bovine Blazemaker");
        AddMenuItem(menue, "139", "Civil Servant");
        AddMenuItem(menue, "143", "Smalltown Bringdown");
        AddMenuItem(menue, "144", "Civic Duty");
        AddMenuItem(menue, "151", "Dead Reckoner");
        AddMenuItem(menue, "160", "Autumn");
        AddMenuItem(menue, "161", "Nutcracker");
        AddMenuItem(menue, "163", "Macabre Web");
        AddMenuItem(menue, "300", "Yeti Coated");
        AddMenuItem(menue, "301", "Park Pigmented");
        AddMenuItem(menue, "302", "Mannana Peeled");
        AddMenuItem(menue, "303", "Macaw Masked");
        AddMenuItem(menue, "304", "Sax Waxed");
        AddMenuItem(menue, "305", "Anodized Aloha");
        AddMenuItem(menue, "306", "Bamboo Brushed");
        AddMenuItem(menue, "307", "Tiger Buffed");
        AddMenuItem(menue, "308", "Croc Dusted");
        AddMenuItem(menue, "309", "Pina Polished");
        AddMenuItem(menue, "310", "Leopard Printed");
        AddMenuItem(menue, "390", "Dragon Slayer");
        AddMenuItem(menue, "391", "Smissmas Sweater");
        AddMenuItem(menue, "200", "Bloom Buffed");
        AddMenuItem(menue, "201", "Quack Canvassed");
        AddMenuItem(menue, "202", "Bank Rolled");
        AddMenuItem(menue, "203", "Merc Stained");
        AddMenuItem(menue, "204", "Kill Covered");
        AddMenuItem(menue, "205", "Fire Glazed");
        AddMenuItem(menue, "206", "Pizza Polished");
        AddMenuItem(menue, "207", "Bonk Varnished");
        AddMenuItem(menue, "208", "Star Crossed");
        AddMenuItem(menue, "209", "Clover Camo'd");
        AddMenuItem(menue, "210", "Freedom Wrapped");
        AddMenuItem(menue, "211", "Cardboard Boxed");
        AddMenuItem(menue, "212", "Dream Piped");
        AddMenuItem(menue, "213", "Miami Element");
        AddMenuItem(menue, "214", "Neo Tokyo");
        AddMenuItem(menue, "215", "Geometrical Teams");
        AddMenuItem(menue, "217", "Bomber Soul");
        AddMenuItem(menue, "218", "Granium");
        AddMenuItem(menue, "220", "Cabin Fevered");
        AddMenuItem(menue, "221", "Polar Surprise");
        AddMenuItem(menue, "223", "Mana");
        AddMenuItem(menue, "224", "Dovetailed");
        AddMenuItem(menue, "225", "Cosmic Calamity");
        AddMenuItem(menue, "226", "Hazard Warning");
        AddMenuItem(menue, "228", "Mosaic");
        AddMenuItem(menue, "230", "Jazzy");
        AddMenuItem(menue, "232", "Alien Tech");
        AddMenuItem(menue, "234", "Damascus Mahogany");
        AddMenuItem(menue, "235", "Skull Study");
        AddMenuItem(menue, "236", "Haunted Ghosts");
        AddMenuItem(menue, "237", "Spectral Shimmered");
        AddMenuItem(menue, "238", "Spirit of Halloween");
        AddMenuItem(menue, "239", "Horror Holiday");
        AddMenuItem(menue, "240", "Totally Boned");
        AddMenuItem(menue, "241", "Electroshocked");
        AddMenuItem(menue, "242", "Ghost Town");
        AddMenuItem(menue, "243", "Tumor Toasted");
        AddMenuItem(menue, "244", "Calavera Canvas");
				SetMenuExitButton(menue, true);
				DisplayMenu(menue, client, 60);

			}
			case 5:
			{
				Handle menue = CreateMenu(SkinQualityMenuCallBack);
				SetMenuTitle(menue, "Recursion.TF >> Paints - Skin Quality");
				AddMenuItem(menue, "0", "------------------------------", ITEMDRAW_DISABLED);
				AddMenuItem(menue, "1", "Factory New");
				AddMenuItem(menue, "2", "Minimal Wear");
				AddMenuItem(menue, "3", "Field-Tested");
				AddMenuItem(menue, "4", "Well-Worn");
				AddMenuItem(menue, "5", "Battle Scarred");
				SetMenuExitButton(menue, true);
				DisplayMenu(menue, client, 60);
			}
			case 6:
			{
				RemoveAllPaints(client);
				CPrintToChat(client, "%s All paints have been removed, touch the resupply locker to receive your original weapons.", PaintsTag);
			}
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_Menu);
	}

	return 0;
}

//// Skin Quality menu callback

public SkinQualityMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		switch(itemNum)
		{
			case 1:
			{
				SetClientCookie(client, h_clientSkin[3], "0.2");
				CPrintToChat(client, "%s Skin quality set to: Factory New.", PaintsTag);
				return 0;
			}
			case 2:
			{
				SetClientCookie(client, h_clientSkin[3], "0.4");
				CPrintToChat(client, "%s Skin quality set to: Minimal Wear.", PaintsTag);
				return 0;
			}
			case 3:
			{
				SetClientCookie(client, h_clientSkin[3], "0.6");
				CPrintToChat(client, "%s Skin quality set to: Field-Tested.", PaintsTag);
				return 0;
			}
			case 4:
			{
				SetClientCookie(client, h_clientSkin[3], "0.8");
				CPrintToChat(client, "%s Skin quality set to: Well-Worn.", PaintsTag);
				return 0;
			}
			case 5:
			{
				SetClientCookie(client, h_clientSkin[3], "1.0");
				CPrintToChat(client, "%s Skin quality set to: Battle Scarred.", PaintsTag);
				return 0;
			}
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;
}

//// Primary Weapon menu callback

public Paints_PrimaryMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(client == 0)
		{
			return 0;
		}

		new String:itemID[8];
		GetMenuItem(h_menu, itemNum, itemID, sizeof(itemID));
		SetClientCookie(client, h_clientSkin[0], itemID);

		CPrintToChat(client, "%s Paint equipped on stock primary weapon, touch the resupply locker to receive it.", PaintsTag);
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;

}

//// Secondary Weapon menu callback

public Paints_SecondaryMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(client == 0)
		{
			return 0;
		}

		new String:itemID[8];
		GetMenuItem(h_menu, itemNum, itemID, sizeof(itemID));
		SetClientCookie(client, h_clientSkin[1], itemID);

		CPrintToChat(client, "%s Paint equipped on stock secondary weapon, touch the resupply locker to receive it.", PaintsTag);
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;

}

//// Melee Weapon menu callback

public Paints_MeleeMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(client == 0)
		{
			return 0;
		}

		new String:itemID[8];
		GetMenuItem(h_menu, itemNum, itemID, sizeof(itemID));
		SetClientCookie(client, h_clientSkin[2], itemID);

		CPrintToChat(client, "%s Paint equipped on stock melee weapon, touch the resupply locker to receive it.", PaintsTag);

	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;

}

/* WARPAINTS MENU CALLBACKS */

public Warpaints_PrimaryMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(client == 0)
		{
			return 0;
		}

		new String:itemID[8];
		GetMenuItem(h_menu, itemNum, itemID, sizeof(itemID));
		SetClientCookie(client, h_clientSkin[0], itemID);

		CPrintToChat(client, "%s Paint equipped on primary weapon, touch the resupply locker to receive it.", WarpaintsTag);
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;

}

//// Secondary Weapon menu callback

public Warpaints_SecondaryMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(client == 0)
		{
			return 0;
		}

		new String:itemID[8];
		GetMenuItem(h_menu, itemNum, itemID, sizeof(itemID));
		SetClientCookie(client, h_clientSkin[1], itemID);

		CPrintToChat(client, "%s Paint equipped on secondary weapon, touch the resupply locker to receive it.", WarpaintsTag);
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;

}

//// Melee Weapon menu callback

public Warpaints_MeleeMenuCallBack(Handle h_menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(client == 0)
		{
			return 0;
		}

		new String:itemID[8];
		GetMenuItem(h_menu, itemNum, itemID, sizeof(itemID));
		SetClientCookie(client, h_clientSkin[2], itemID);

		CPrintToChat(client, "%s Paint equipped on melee weapon, touch the resupply locker to receive it.", WarpaintsTag);

	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_menu);
	}

	return 0;

}


//// Shortcut/detection commands
void RemoveAllPaints(int client)
{
	SetClientCookie(client, h_clientSkin[0], "0");
	SetClientCookie(client, h_clientSkin[1], "0");
	SetClientCookie(client, h_clientSkin[2], "0");
}

int ClientWeaponIDFromSlot(int client, int slot)
{
	new ent = GetPlayerWeaponSlot(client, slot);

	if(ent != -1)
	{
		int currentItemIndex = GetEntProp(ent, Prop_Send, "m_iItemDefinitionIndex");
		return currentItemIndex;
	}

	else
	{
		return -1;
	}
}

/*
/////////////////////
				PAINTS
/////////////////////
*/

Paints_DetectWeapon(int client, int weapon, int currentItemIndex, float attribute, int iItemDefIndex, int numAttributes)
{
	TFClassType class = TF2_GetPlayerClass(client);
	int rval[2];

	char c1[12];
	IntToString(iItemDefIndex, c1, sizeof(c1));

	if(class == TFClass_Scout)
	{
		if(currentItemIndex == 13 || currentItemIndex == 200)
		{
			if(StrEqual(c1, "15015", false) || StrEqual(c1, "15021", false) || StrEqual(c1, "15029", false) || StrEqual(c1, "15002", false) || StrEqual(c1, "15053", false) || StrEqual(c1, "15065", false) || StrEqual(c1, "15069", false) || StrEqual(c1, "15131", false) || StrEqual(c1, "15106", false) || StrEqual(c1, "15108", false) || StrEqual(c1, "15107", false) || StrEqual(c1, "15151", false) || StrEqual(c1, "15157", false) || StrEqual(c1, "15036", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		if(currentItemIndex == 22 || currentItemIndex == 209)
		{
			if(StrEqual(c1, "15035", false) || StrEqual(c1, "15041", false) || StrEqual(c1, "15018", false) || StrEqual(c1, "15013", false) || StrEqual(c1, "15046", false) || StrEqual(c1, "15056", false) || StrEqual(c1, "15060", false) || StrEqual(c1, "15061", false) || StrEqual(c1, "15126", false) || StrEqual(c1, "15100", false) || StrEqual(c1, "15102", false) || StrEqual(c1, "15101", false) || StrEqual(c1, "15148", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		if(currentItemIndex == 0 || currentItemIndex == 190)
		{
			// Empty
		}
	}
	else if(class == TFClass_Soldier)
	{
		if(currentItemIndex == 18 || currentItemIndex == 205)
		{
			if(StrEqual(c1, "15043", false) || StrEqual(c1, "15028", false) || StrEqual(c1, "15014", false) || StrEqual(c1, "15006", false) || StrEqual(c1, "15052", false) || StrEqual(c1, "15057", false) || StrEqual(c1, "15081", false) || StrEqual(c1, "15129", false) || StrEqual(c1, "15130", false) || StrEqual(c1, "15104", false) || StrEqual(c1, "15105", false) || StrEqual(c1, "15150", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 10 || currentItemIndex == 199)
		{
			if(StrEqual(c1, "15044", false) || StrEqual(c1, "15016", false) || StrEqual(c1, "15003", false) || StrEqual(c1, "15047", false) || StrEqual(c1, "15085", false) || StrEqual(c1, "15132", false) || StrEqual(c1, "15133", false) || StrEqual(c1, "15109", false) || StrEqual(c1, "15152", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_Pyro)
	{
		if(currentItemIndex == 21 || currentItemIndex == 208)
		{
			if(StrEqual(c1, "15030", false) || StrEqual(c1, "15034", false) || StrEqual(c1, "15017", false) || StrEqual(c1, "15005", false) || StrEqual(c1, "15049", false) || StrEqual(c1, "15054", false) || StrEqual(c1, "15067", false) || StrEqual(c1, "15066", false) || StrEqual(c1, "15068", false) || StrEqual(c1, "15115", false) || StrEqual(c1, "15090", false) || StrEqual(c1, "15089", false) || StrEqual(c1, "15141", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 12 || currentItemIndex == 199)
		{
			if(StrEqual(c1, "15044", false) || StrEqual(c1, "15016", false) || StrEqual(c1, "15003", false) || StrEqual(c1, "15047", false) || StrEqual(c1, "15085", false) || StrEqual(c1, "15132", false) || StrEqual(c1, "15133", false) || StrEqual(c1, "15109", false) || StrEqual(c1, "15152", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_DemoMan)
	{
		if(currentItemIndex == 19 || currentItemIndex == 206)
		{
			if(StrEqual(c1, "15079", false) || StrEqual(c1, "15077", false) || StrEqual(c1, "15117", false) || StrEqual(c1, "15116", false) || StrEqual(c1, "15091", false) || StrEqual(c1, "15092", false) || StrEqual(c1, "15142", false) || StrEqual(c1, "15158", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 20 || currentItemIndex == 207)
		{
			if(StrEqual(c1, "15038", false) || StrEqual(c1, "15024", false) || StrEqual(c1, "15009", false) || StrEqual(c1, "15012", false) || StrEqual(c1, "15045", false) || StrEqual(c1, "15048", false) || StrEqual(c1, "15083", false) || StrEqual(c1, "15084", false) || StrEqual(c1, "15082", false) || StrEqual(c1, "15137", false) || StrEqual(c1, "15138", false) || StrEqual(c1, "15113", false) || StrEqual(c1, "15155", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_Heavy)
	{
		if(currentItemIndex == 15 || currentItemIndex == 202)
		{
			if(StrEqual(c1, "15031", false) || StrEqual(c1, "15040", false) || StrEqual(c1, "15020", false) || StrEqual(c1, "15026", false) || StrEqual(c1, "15004", false) || StrEqual(c1, "15055", false) || StrEqual(c1, "15087", false) || StrEqual(c1, "15086", false) || StrEqual(c1, "15088", false) || StrEqual(c1, "15125", false) || StrEqual(c1, "15123", false) || StrEqual(c1, "15124", false) || StrEqual(c1, "15099", false) || StrEqual(c1, "15098", false) || StrEqual(c1, "15147", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 11 || currentItemIndex == 199)
		{
			if(StrEqual(c1, "15044", false) || StrEqual(c1, "15016", false) || StrEqual(c1, "15003", false) || StrEqual(c1, "15047", false) || StrEqual(c1, "15085", false) || StrEqual(c1, "15132", false) || StrEqual(c1, "15133", false) || StrEqual(c1, "15109", false) || StrEqual(c1, "15152", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_Engineer)
	{
		if(currentItemIndex == 9 || currentItemIndex == 199)
		{
			if(StrEqual(c1, "15044", false) || StrEqual(c1, "15016", false) || StrEqual(c1, "15003", false) || StrEqual(c1, "15047", false) || StrEqual(c1, "15085", false) || StrEqual(c1, "15132", false) || StrEqual(c1, "15133", false) || StrEqual(c1, "15109", false) || StrEqual(c1, "15152", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 22 || currentItemIndex == 209)
		{
			if(StrEqual(c1, "15035", false) || StrEqual(c1, "15041", false) || StrEqual(c1, "15018", false) || StrEqual(c1, "15013", false) || StrEqual(c1, "15046", false) || StrEqual(c1, "15056", false) || StrEqual(c1, "15060", false) || StrEqual(c1, "15061", false) || StrEqual(c1, "15126", false) || StrEqual(c1, "15100", false) || StrEqual(c1, "15102", false) || StrEqual(c1, "15101", false) || StrEqual(c1, "15148", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 7 || currentItemIndex == 197 || currentItemIndex == 169)
		{
			if(StrEqual(c1, "15075", false) || StrEqual(c1, "15074", false) || StrEqual(c1, "15073", false) || StrEqual(c1, "15140", false) || StrEqual(c1, "15139", false) || StrEqual(c1, "15114", false) || StrEqual(c1, "15156", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_Medic)
	{
		if(currentItemIndex == 29 || currentItemIndex == 211)
		{
			if(StrEqual(c1, "15039", false) || StrEqual(c1, "15025", false) || StrEqual(c1, "15010", false) || StrEqual(c1, "15008", false) || StrEqual(c1, "15050", false) || StrEqual(c1, "15078", false) || StrEqual(c1, "15122", false) || StrEqual(c1, "15120", false) || StrEqual(c1, "15121", false) || StrEqual(c1, "15097", false) || StrEqual(c1, "15146", false) || StrEqual(c1, "15145", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_Sniper)
	{
		if(currentItemIndex == 14 || currentItemIndex == 201)
		{
			if(StrEqual(c1, "15033", false) || StrEqual(c1, "15019", false) || StrEqual(c1, "15023", false) || StrEqual(c1, "15007", false) || StrEqual(c1, "15000", false) || StrEqual(c1, "15059", false) || StrEqual(c1, "15071", false) || StrEqual(c1, "15070", false) || StrEqual(c1, "15072", false) || StrEqual(c1, "15135", false) || StrEqual(c1, "15136", false) || StrEqual(c1, "15112", false) || StrEqual(c1, "15111", false) || StrEqual(c1, "15154", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 16 || currentItemIndex == 203)
		{
			if(StrEqual(c1, "15032", false) || StrEqual(c1, "15037", false) || StrEqual(c1, "15022", false) || StrEqual(c1, "15001", false) || StrEqual(c1, "15058", false) || StrEqual(c1, "15076", false) || StrEqual(c1, "15134", false) || StrEqual(c1, "15110", false) || StrEqual(c1, "15153", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	else if(class == TFClass_Spy)
	{
		if(currentItemIndex == 24 || currentItemIndex == 210)
		{
			if(StrEqual(c1, "15042", false) || StrEqual(c1, "15027", false) || StrEqual(c1, "15011", false) || StrEqual(c1, "15051", false) || StrEqual(c1, "15062", false) || StrEqual(c1, "15064", false) || StrEqual(c1, "15063", false) || StrEqual(c1, "15128", false) || StrEqual(c1, "15127", false) || StrEqual(c1, "15103", false) || StrEqual(c1, "15149", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
		else if(currentItemIndex == 4 || currentItemIndex == 194)
		{
			if(StrEqual(c1, "15080", false) || StrEqual(c1, "15119", false) || StrEqual(c1, "15118", false) || StrEqual(c1, "15094", false) || StrEqual(c1, "15096", false) || StrEqual(c1, "15095", false) || StrEqual(c1, "15144", false) || StrEqual(c1, "15143", false))
			{
				rval[0] = Paints_EquipWep(client, weapon, iItemDefIndex, attribute, numAttributes);
				rval[1] = 1;
				return rval;
			}
		}
	}
	rval[0] = weapon;
	rval[1] = 0;
	return rval;
}


Paints_EquipWep(int client, int weapon, int itemIndex, float attribute, int numAttributes)
{
	SetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex", itemIndex);
	TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 725, attribute);
	return weapon;
}

/*
/////////////////////
			WARPAINTS
/////////////////////
*/

Warpaints_EquipWeapon(int client, int weapon, int paintIndex, float attribute, int numAttributes, char[] weaponClass)
{
	int rval[2];
	int index = GetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex");
	if(index > 14999 && index < 15159)
	{
		index = Warpaints_CorrespondingWarpaintWeaponIDForClassname(index, weaponClass);
	}
	else
	{
		index = Warpaints_CorrespondingWarpaintWeaponID(index);
	}
	SetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex", index);
	TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 834, view_as<float>(paintIndex));
	TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 725, attribute);
	rval[0] = weapon;
	rval[1] = 1;
	return rval;
}

Warpaints_CorrespondingWarpaintWeaponID(int index)
{
	if(index == 13) return 200; //Scattergun
	else if(index == 22 || index == 23) return 209; //Pistol
	else if(index == 0) return 190; //Bat
	else if(index == 18) return 205; //Rocket launcher
	else if(index == 9 || index == 10 || index == 11 || index == 12) return 199; //Shotgun
	else if(index == 6) return 196; //Shovel
	else if(index == 21) return 208; //Flamethrower
	else if(index == 2) return 192; //Fire Axe
	else if(index == 19) return 206; //Grenade Launcher
	else if(index == 20) return 207; //Stickybomb ---
	else if(index == 1) return 191; //Bottle
	else if(index == 15) return 202; //Minigun
	else if(index == 5) return 195; //Fists
	else if(index == 7) return 197; //Wrench
	else if(index == 25) return 737; //PDA engie
	else if(index == 17) return 204; //Syringe Gun
	else if(index == 29) return 211; //Medi Gun
	else if(index == 8) return 198; //Bonesaw
	else if(index == 14) return 201; //Sniper Rifle
	else if(index == 16) return 203; //SMG
	else if(index == 3) return 193; //Kukri
	else if(index == 24) return 210; //Revolver
	else if(index == 735) return 736; //Sapper
	else if(index == 4) return 194; //Knife
	else if(index == 30) return 212; //Invis Watch
	else return index;
}

Warpaints_CorrespondingWarpaintWeaponIDForClassname(int index, char[] class)
{
	if(StrEqual(class, "tf_weapon_scattergun", false)) return 200; //Scattergun
	else if(StrEqual(class, "tf_weapon_pistol", false) || StrEqual(class, "tf_weapon_pistol_scout", false)) return 209; //Pistol
	else if(StrEqual(class, "tf_weapon_bat", false)) return 190; //Bat
	else if(StrEqual(class, "tf_weapon_rocketlauncher", false)) return 205; //Rocket launcher
	else if(StrEqual(class, "tf_weapon_shotgun", false) || StrEqual(class, "tf_weapon_shotgun_primary", false) || StrEqual(class, "tf_weapon_shotgun_soldier", false) || StrEqual(class, "tf_weapon_shotgun_pyro", false) || StrEqual(class, "tf_weapon_shotgun_hwg", false)) return 199; //Shotgun
	else if(StrEqual(class, "tf_weapon_shovel", false)) return 196; //Shovel
	else if(StrEqual(class, "tf_weapon_flamethrower", false)) return 208; //Flamethrower
	else if(StrEqual(class, "tf_weapon_fireaxe", false)) return 192; //Fire Axe
	else if(StrEqual(class, "tf_weapon_grenade_launcher", false)) return 206; //Grenade Launcher
	else if(StrEqual(class, "tf_weapon_pipebomblauncher", false)) return 207; //Stickybomb ---
	else if(StrEqual(class, "tf_weapon_bottle", false)) return 191; //Bottle
	else if(StrEqual(class, "tf_weapon_minigun", false)) return 202; //Minigun
	else if(StrEqual(class, "tf_weapon_fists", false)) return 195; //Fists
	else if(StrEqual(class, "tf_weapon_wrench", false)) return 197; //Wrench
	else if(StrEqual(class, "tf_weapon_syringegun_medic", false)) return 204; //Syringe Gun
	else if(StrEqual(class, "tf_weapon_medigun", false)) return 211; //Medi Gun
	else if(StrEqual(class, "tf_weapon_bonesaw", false)) return 198; //Bonesaw
	else if(StrEqual(class, "tf_weapon_sniperrifle", false)) return 201; //Sniper Rifle
	else if(StrEqual(class, "tf_weapon_smg", false)) return 203; //SMG
	else if(StrEqual(class, "tf_weapon_club", false)) return 193; //Kukri
	else if(StrEqual(class, "tf_weapon_revolver", false)) return 210; //Revolver
	else if(StrEqual(class, "tf_weapon_knife", false)) return 194; //Knife
	else return index;
}
