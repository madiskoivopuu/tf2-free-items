#include <sourcemod>
#include <tf2_stocks>
#include <sdktools>
#include <client_group_status>
#include <clientprefs>
#include <morecolors>

Handle h_WepEffect[3];
#define WepUnuTag "{green}[WeaponEffects]{white}"

public WeaponUnusualsMenuCallBack(Handle:h_Menu, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(itemNum == 1)
		{
			Handle h_menu2 = CreateMenu(EffectMenuCallBack);
			SetMenuTitle(h_menu2, "Recursion.TF >> Weapon Unusuals - Primary");
			AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_menu2, "1", "Remove Effect");
			AddMenuItem(h_menu2, "2", "Isotope");
			AddMenuItem(h_menu2, "3", "Hot");
			AddMenuItem(h_menu2, "4", "Cool");
			AddMenuItem(h_menu2, "5", "Energy Orb");
			DisplayMenu(h_menu2, client, 60);

		}
		if(itemNum == 2)
		{
      Handle h_menu2 = CreateMenu(EffectMenuCallBack2);
      SetMenuTitle(h_menu2, "Recursion.TF >> Weapon Unusuals - Secondary");
      AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
      AddMenuItem(h_menu2, "1", "Remove Effect");
      AddMenuItem(h_menu2, "2", "Isotope");
      AddMenuItem(h_menu2, "3", "Hot");
      AddMenuItem(h_menu2, "4", "Cool");
      AddMenuItem(h_menu2, "5", "Energy Orb");
      DisplayMenu(h_menu2, client, 60);
		}
		if(itemNum == 3)
		{
      Handle h_menu2 = CreateMenu(EffectMenuCallBack3);
      SetMenuTitle(h_menu2, "Recursion.TF >> Weapon Unusuals - Melee");
      AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
      AddMenuItem(h_menu2, "1", "Remove Effect");
      AddMenuItem(h_menu2, "2", "Isotope");
      AddMenuItem(h_menu2, "3", "Hot");
      AddMenuItem(h_menu2, "4", "Cool");
      AddMenuItem(h_menu2, "5", "Energy Orb");
      DisplayMenu(h_menu2, client, 60);
		}
		if(itemNum == 5)
		{
			SetClientCookie(client, h_WepEffect[0], "0");
			SetClientCookie(client, h_WepEffect[1], "0");
			SetClientCookie(client, h_WepEffect[2], "0");
			CPrintToChat(client, "%s Removed all weapon unusual effects.", WepUnuTag);
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(h_Menu);
	}
}

public EffectMenuCallBack(Handle menu, MenuAction action, int client, int itemNum)
{
	new String:Item[8];
	GetMenuItem(menu, itemNum, Item, sizeof(Item));
	int sItem = StringToInt(Item);

	if(action == MenuAction_Select)
	{
	if(sItem == 1 || sItem == 2 || sItem == 3 || sItem == 4 || sItem == 5)
	{
		if(sItem == 1)
		{
			SetClientCookie(client, h_WepEffect[0], "0");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 2)
		{
			SetClientCookie(client, h_WepEffect[0], "702");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 3)
		{
			SetClientCookie(client, h_WepEffect[0], "701");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 4)
		{
			SetClientCookie(client, h_WepEffect[0], "703");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 5)
		{
			SetClientCookie(client, h_WepEffect[0], "704");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
	}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}

public EffectMenuCallBack2(Handle menu, MenuAction action, int client, int itemNum)
{
	new String:Item[8]; GetMenuItem(menu, itemNum, Item, sizeof(Item));
	int sItem = StringToInt(Item);
	if(action == MenuAction_Select)
	{
	if(sItem == 1 || sItem == 2 || sItem == 3 || sItem == 4 || sItem == 5)
	{
		if(sItem == 1)
		{
			SetClientCookie(client, h_WepEffect[1], "0");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 2)
		{
			SetClientCookie(client, h_WepEffect[1], "702");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 3)
		{
			SetClientCookie(client, h_WepEffect[1], "701");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 4)
		{
			SetClientCookie(client, h_WepEffect[1], "703");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 5)
		{
			SetClientCookie(client, h_WepEffect[1], "704");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
	}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}


public EffectMenuCallBack3(Handle menuH, MenuAction action, int client, int itemNum)
{
	new String:Item[8]; GetMenuItem(menuH, itemNum, Item, sizeof(Item));
	int sItem = StringToInt(Item);

	if(action == MenuAction_Select)
	{
	if(sItem == 1 || sItem == 2 || sItem == 3 || sItem == 4 || sItem == 5)
	{
		if(sItem == 1)
		{
			SetClientCookie(client, h_WepEffect[2], "0");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 2)
		{
			SetClientCookie(client, h_WepEffect[2], "702");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 3)
		{
			SetClientCookie(client, h_WepEffect[2], "701");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 4)
		{
			SetClientCookie(client, h_WepEffect[2], "703");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
		if(sItem == 5)
		{
			SetClientCookie(client, h_WepEffect[2], "704");
			CPrintToChat(client, "%s You will receive your weapon unusual effect upon dying.", WepUnuTag);
		}
	}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(menuH);
	}
}

WeaponUnusuals_EquipEffect(int weapon, float value, numAttributes)
{
	TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 134, value);
	return weapon;
}
