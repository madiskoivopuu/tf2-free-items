#include <sourcemod>
#include <tf2_stocks>
#include <tf2items_2>
#include <sdktools>
#include <tf2idb>
#include <client_group_status>
#include <clientprefs>
#include <morecolors>
#include <free_items/australium.sp>
#include <free_items/paints.sp>
#include <free_items/weapon_unusuals.sp>
#include <free_items/killstreak.sp>

// Globals //

Handle hGiveNamedItem;

// Tags //

#define AustraliumTag "{yellow}[{white}Australium{yellow}]{white}"
#define FestiveTag "{white}[{red}Fes{yellow}ti{green}ve{white}]"

public Plugin myinfo =
{
	name = "[TF2] Free Items",
	author = "Sparkly Cat",
	description = "Connects all free items plugins with a parent plugin.",
	version = "1.0",
	url = "https://recursion.tf"
};

public void OnPluginStart()
{
  // Events / SDKCalls //
  HookEvent("post_inventory_application", ResupplyEvent, EventHookMode_Post);

  Handle hGameConf = LoadGameConfigFile("tf2.items");

	//HookEvent("post_inventory_application", ResupplyEvent, EventHookMode_Pre);

	StartPrepSDKCall(SDKCall_Player);
	PrepSDKCall_SetFromConf(hGameConf, SDKConf_Virtual, "GiveNamedItem");
	PrepSDKCall_AddParameter(SDKType_String, SDKPass_Pointer);
	PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain);
	PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain);
	PrepSDKCall_SetReturnInfo(SDKType_CBaseEntity, SDKPass_Plain);
	hGiveNamedItem = EndPrepSDKCall();

  CloseHandle(hGameConf);

  // Australium/Festive //
  h_australiumOn[0] = RegClientCookie("australium_on", "Australium weapons status", CookieAccess_Private);
  h_festiveOn[0] = RegClientCookie("festive_on", "Festive weapons status", CookieAccess_Private);

  RegConsoleCmd("sm_australium", Cmd_Aussie);
  RegConsoleCmd("sm_festive", Cmd_Festive);

  // Paints/Warpaints //
  h_clientSkin[0] = RegClientCookie("primary_skin", "Primary weapon skin", CookieAccess_Private);
  h_clientSkin[1] = RegClientCookie("secondary_skin", "Primary weapon skin", CookieAccess_Private);
  h_clientSkin[2] = RegClientCookie("melee_skin", "Primary weapon skin", CookieAccess_Private);
  h_clientSkin[3] = RegClientCookie("texture_wear", "Texture wear level", CookieAccess_Private);

  RegConsoleCmd("sm_paint", Cmd_Paint);
  RegConsoleCmd("sm_paints", Cmd_Paint);
  RegConsoleCmd("sm_warpaint", Cmd_Warpaint);
  RegConsoleCmd("sm_warpaints", Cmd_Warpaint);
  RegConsoleCmd("sm_weaponpaint", Cmd_Paint);
  RegConsoleCmd("sm_weaponpaints", Cmd_Paint);

  // Weapon Unusuals //
  RegConsoleCmd("sm_weaponunusuals", Cmd_WU);
  RegConsoleCmd("sm_weaponunusual", Cmd_WU);
  RegConsoleCmd("sm_wep_u", Cmd_WU);
  RegConsoleCmd("sm_wep_unu", Cmd_WU);
  RegConsoleCmd("sm_wep_unusuals", Cmd_WU);
  RegConsoleCmd("sm_wep_unusual", Cmd_WU);

  h_WepEffect[0] = RegClientCookie("primary_effect", "", CookieAccess_Private);
  h_WepEffect[1] = RegClientCookie("secondary_effect", "", CookieAccess_Private);
  h_WepEffect[2] = RegClientCookie("melee_effect", "", CookieAccess_Private);

  // Killstreak tiers & sheens //

  h_killstreakTier[0] = RegClientCookie("killstreak_tier_primary", "", CookieAccess_Private);
  h_killstreakTier[1] = RegClientCookie("killstreak_tier_secondary", "", CookieAccess_Private);
  h_killstreakTier[2] = RegClientCookie("killstreak_tier_melee", "", CookieAccess_Private);

  h_killstreakSheen[0] = RegClientCookie("killstreak_sheen_primary", "", CookieAccess_Private);
  h_killstreakSheen[1] = RegClientCookie("killstreak_sheen_secondary", "", CookieAccess_Private);
  h_killstreakSheen[2] = RegClientCookie("killstreak_sheen_melee", "", CookieAccess_Private);

  RegConsoleCmd("sm_ks", Cmd_Killstreak);
  RegConsoleCmd("sm_ksm", Cmd_Killstreak);
  RegConsoleCmd("sm_killstreak", Cmd_Killstreak);

	//RegConsoleCmd("sm_testgnm", gnm);

}

public void OnClientPutInServer(int client)
{
	SetClientCookie(client, h_australiumOn[0], "0");
	SetClientCookie(client, h_festiveOn[0], "0");

	SetClientCookie(client, h_clientSkin[0], "0");
	SetClientCookie(client, h_clientSkin[1], "0");
	SetClientCookie(client, h_clientSkin[2], "0");
	SetClientCookie(client, h_clientSkin[3], "0");

	SetClientCookie(client, h_WepEffect[0], "0");
	SetClientCookie(client, h_WepEffect[1], "0");
	SetClientCookie(client, h_WepEffect[2], "0");

	SetClientCookie(client, h_killstreakTier[0], "0");
	SetClientCookie(client, h_killstreakTier[1], "0");
	SetClientCookie(client, h_killstreakTier[2], "0");

	SetClientCookie(client, h_killstreakSheen[0], "0");
	SetClientCookie(client, h_killstreakSheen[1], "0");
	SetClientCookie(client, h_killstreakSheen[2], "0");
}
/*public Action gnm(int client, int args)
{
	TF2_RemoveWeaponSlot(client, 0);
	Handle hItem = TF2Items_CreateItem(FORCE_GENERATION|OVERRIDE_ATTRIBUTES|PRESERVE_ATTRIBUTES);
	TF2Items_SetLevel(hItem, 0);
	TF2Items_SetQuality(hItem, 1);
	TF2Items_SetClassname(hItem, "tf_weapon_scattergun");
	TF2Items_SetItemIndex(hItem, 13);
	TF2Items_SetNumAttributes(hItem, 2);
	TF2Items_SetAttribute(hItem, 0, 2025, 3.0);
	TF2Items_SetAttribute(hItem, 1, 2014, 5.0);
	int ent = TF2Items_GiveNamedItem(client, hItem);
	CloseHandle(hItem);
	EquipPlayerWeapon(client, ent);
}*/

/* Australium command */

public Action Cmd_Aussie(int client, int args)
{
	if(Steam_InGroup(client) == false)
	{
		PrintToChat(client, "[SM] You must be in our steam group to use this command. Type !group to join our group.");
		return Plugin_Handled;
	}

	new String:festiveOnC[12];
	GetClientCookie(client, h_festiveOn[0], festiveOnC, sizeof(festiveOnC));
	int festiveOn = StringToInt(festiveOnC);

	new String:aussieOnC[12];
	GetClientCookie(client, h_australiumOn[0], aussieOnC, sizeof(aussieOnC));
	int australiumOn = StringToInt(aussieOnC);

	if(australiumOn == 1)
	{
		SetClientCookie(client, h_australiumOn[0], "0");
		CPrintToChat(client, "%s Disabled australium weapons, touch the resupply locker to receive your normal weapons.", AustraliumTag);
		return Plugin_Handled;
	}

	else
	{
		SetClientCookie(client, h_australiumOn[0], "1");
		CPrintToChat(client, "%s Enabled australium weapons, touch the resupply locker to receive the australium weapons.", AustraliumTag);
		return Plugin_Handled;
	}
}

/* Festive */

public Action Cmd_Festive(int client, int args)
{
	if(Steam_InGroup(client) == false)
	{
		PrintToChat(client, "[SM] You must be in our steam group to use this command. Type !group to join our group.");
		return Plugin_Handled;
	}

	new String:festiveOnC[12];
	GetClientCookie(client, h_festiveOn[0], festiveOnC, sizeof(festiveOnC));
	int festiveOn = StringToInt(festiveOnC);

	if(festiveOn == 1)
	{
		SetClientCookie(client, h_festiveOn[0], "0");
		CPrintToChat(client, "%s Disabled festive weapons, touch the resupply locker to receive your normal weapons.", FestiveTag);
		return Plugin_Handled;
	}

	else
	{
		SetClientCookie(client, h_festiveOn[0], "1");
		CPrintToChat(client, "%s Enabled festive weapons, touch the resupply locker to receive festive weapons.", FestiveTag);
		return Plugin_Handled;
	}

	return Plugin_Handled;
}

/* Paints/Warpaints */

public Action Cmd_Warpaint(int client, int args)
{
	if(client == 0)
	{
		PrintToServer("This command cannot be used from the console");
		return Plugin_Handled;
	}
	if(Steam_InGroup(client) == false)
	{
		PrintToChat(client, "[SM] You must be in our steam group to use this command. Type !group to join our group.");
		return Plugin_Handled;
	}

	Handle h_Menu = CreateMenu(WarpaintsMenuCallBack);
	SetMenuTitle(h_Menu, "Recursion.TF >> Warpaints");
	AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "1", "Primary Weapon");
	AddMenuItem(h_Menu, "2", "Secondary Weapon");
	AddMenuItem(h_Menu, "3", "Melee Weapon");
	AddMenuItem(h_Menu, "4", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "5", "Wear Quality");
	AddMenuItem(h_Menu, "6", "Remove All Paints");
	DisplayMenu(h_Menu, client, 60);

	return Plugin_Handled;
}

public Action Cmd_Paint(int client, int args)
{
	if(client == 0)
	{
		PrintToServer("This command cannot be used from the console");
		return Plugin_Handled;
	}
	if(Steam_InGroup(client) == false)
	{
		PrintToChat(client, "[SM] You must be in our steam group to use this command. Type !group to join our group.");
		return Plugin_Handled;
	}

	Handle h_Menu = CreateMenu(PaintsMenuCallBack);
	SetMenuTitle(h_Menu, "Recursion.TF >> Paints");
	AddMenuItem(h_Menu, "0", "Warpaints");
	AddMenuItem(h_Menu, "1", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "2", "Primary Weapon");
	AddMenuItem(h_Menu, "3", "Secondary Weapon");
	AddMenuItem(h_Menu, "4", "Melee Weapon");
	AddMenuItem(h_Menu, "5", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "6", "Wear Quality");
	AddMenuItem(h_Menu, "7", "Remove all paints");
	DisplayMenu(h_Menu, client, 60);

	return Plugin_Handled;
}

/* Weapon Unusuals */

public Action Cmd_WU(int client, int args)
{
	if(client == 0)
	{
		PrintToServer("This command cannot be used from the console");
		return Plugin_Handled;
	}
	if(Steam_InGroup(client) == false)
	{
		PrintToChat(client, "[SM] You must be in our steam group to use this command. Type !group to join our group.");
		return Plugin_Handled;
	}


	Handle h_Menu = CreateMenu(WeaponUnusualsMenuCallBack);
	SetMenuTitle(h_Menu, "Recursion.TF >> Weapon Unusuals");
	AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "1", "Primary Weapon Effects");
	AddMenuItem(h_Menu, "2", "Secondary Weapon Effects");
	AddMenuItem(h_Menu, "3", "Melee Weapon Effects");
	AddMenuItem(h_Menu, "4", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "5", "Remove All Effects");
	DisplayMenu(h_Menu, client, 60);

	return Plugin_Handled;

}

/* Killstreak */

public Action Cmd_Killstreak(int client, int args)
{
	if(client == 0)
	{
		PrintToServer("This command cannot be used from the console");
		return Plugin_Handled;
	}
	if(Steam_InGroup(client) == false)
	{
		PrintToChat(client, "[SM] You must be in our steam group to use this command. Type !group to join our group.");
		return Plugin_Handled;
	}

	Handle h_Menu = CreateMenu(KillstreakMenuCallback);
	SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak");
	AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
	AddMenuItem(h_Menu, "1", "Killstreak Tiers");
	AddMenuItem(h_Menu, "2", "Killstreak Sheens");
	DisplayMenu(h_Menu, client, 60);

	return Plugin_Handled;
}

/* Main (Hooks) */

public Action ResupplyEvent(Handle event, const String:name[], bool:dontBroadcast)
{
	new userid = GetEventInt(event, "userid");
	new client = GetClientOfUserId(userid);

	CheckWeapons(client);
}

//// Shortcut/detection commands

void CheckWeapons(int client)
{
  for(int i = 0; i < 3; ++i)
  {
		// Init
    int weapon = GetPlayerWeaponSlot(client, i);

		if(weapon == -1)
		{
			continue;
		}

    int weaponId = ClientWeaponIDFromSlot(client, i);
		//int m_iItemIDHigh = GetEntData(weapon, FindSendPropInfo("CTFWeaponBase", "m_iItemIDHigh"), 4);
		//int m_iItemIDLow = GetEntData(weapon, FindSendPropInfo("CTFWeaponBase", "m_iItemIDLow"), 4);
		int change, isAustralium, isPaint;
    int rval[2];
    char weaponClass[48];
    GetEntityClassname(weapon, weaponClass, 48);

		// Cookies

		//Australium
    char aussieOnC[12];
    GetClientCookie(client, h_australiumOn[0], aussieOnC, sizeof(aussieOnC));
    int australiumOn = StringToInt(aussieOnC);

		//Festive
    char festiveOnC[12];
    GetClientCookie(client, h_festiveOn[0], festiveOnC, sizeof(festiveOnC));
    int festiveOn = StringToInt(festiveOnC);

		//Paints
		char paintsC[32];
		GetClientCookie(client, h_clientSkin[i], paintsC, sizeof(paintsC));
		int paintIndex = StringToInt(paintsC);

		char paintsWearC[32];
		GetClientCookie(client, h_clientSkin[3], paintsWearC, sizeof(paintsWearC));
		float paintWear = StringToFloat(paintsWearC);

		//Weapon Unusuals
		char weaponUnusualC[32];
		GetClientCookie(client, h_WepEffect[i], weaponUnusualC, sizeof(weaponUnusualC));
		float weaponUnusualEffect = StringToFloat(weaponUnusualC);

		// Killstreak Tiers & Sheens

		char tiersC[32];
		GetClientCookie(client, h_killstreakTier[i], tiersC, sizeof(tiersC));
		float tierId = StringToFloat(tiersC);

		char sheensC[32];
		GetClientCookie(client, h_killstreakSheen[i], sheensC, sizeof(sheensC));
		float sheenId = StringToFloat(sheensC);

		// New (replacement) weapon
		int numRequiredAttributes = GetNumAttributesRequiredForItem(australiumOn, paintIndex, weaponUnusualEffect, tierId, sheenId, festiveOn);
		if(numRequiredAttributes == 0)
		{
			continue;
		}

		int weapon2 = CreateEntityByName(weaponClass);
		SetEntProp(weapon2, Prop_Send, "m_iItemDefinitionIndex", weaponId);
		int numAttributes = TF2Items_CopyDynamicAttributes("CTFWeaponBase", weapon, weapon2, numRequiredAttributes);

    if(australiumOn == 1)
    {
      rval = Australium_EquipWeapon(client, weapon2, weaponId, numAttributes);
      if(rval[1] == 1)
      {
        change += 1;
				isAustralium = rval[1];
      }
    }
		if(paintIndex != 0)
		{
			if(paintIndex > 10000)
			{
				rval = Paints_DetectWeapon(client, weapon2, weaponId, paintWear, paintIndex, numAttributes);
				if(rval[1] == 1)
				{
					change += 1;
					isPaint = rval[1];
				}
			}
			else
			{
				if(isAustralium == 0)
				{
					rval = Warpaints_EquipWeapon(client, weapon2, paintIndex, paintWear, numAttributes, weaponClass);
					if(rval[1] == 1)
					{
						change += 1;
						isPaint = rval[1];
					}
				}
			}
		}
		if(weaponUnusualEffect != 0.0)
		{
			rval[0] = WeaponUnusuals_EquipEffect(weapon2, weaponUnusualEffect, numAttributes);
			change += 1;
		}
		if(tierId != 0.0)
		{
			rval[0] = Killstreak_EquipTier(weapon2, tierId, numAttributes);
			change += 1;
		}
		if(sheenId != 0.0)
		{
			rval[0] = Killstreak_EquipSheen(weapon2, sheenId, numAttributes);
			change += 1;
		}
  	if(festiveOn == 1)
    {
      rval = Festive_EquipWeapon(client, weapon2, weaponId, isAustralium, isPaint, numAttributes);
      if(rval[1] == 1)
      {
      	change += 1;
      }
    }
	
    if(change != 0)
    {
      GiveNamedItem(client, weapon2, weaponClass, i);
    }
	else
	{
		AcceptEntityInput(weapon2, "Kill");
	}
  }
}

/*int CheckForSilentChange(int client, int weapon)
{
	if(g_bSilentChangeWeaponUnusual[client])
	{
		TF2Attrib_RemoveByDefIndex(weapon, 134);
		g_bSilentChangeWeaponUnusual[client] = false;
	}
	if(g_bSilentChangeTier[client])
	{
		TF2Attrib_RemoveByDefIndex(weapon, 2025);
		g_bSilentChangeTier[client] = false;
	}
	if(g_bSilentChangeSheen[client])
	{
		TF2Attrib_RemoveByDefIndex(weapon, 2014);
		g_bSilentChangeSheen[client] = false;
	}
	return 1;
}*/

int GetNumAttributesRequiredForItem(int australiumOn, int paintIndex, int weaponUnusualEffect, int tierId, int sheenId, int festiveOn)
{
	int num = 0;
	if(australiumOn != 0)
	{
		num += 3;
	}
	if(paintIndex != 0)
	{
		num += 2;
	}
	if(weaponUnusualEffect != 0)
	{
		num += 1;
	}
	if(tierId != 0)
	{
		num += 1;
	}
	if(sheenId != 0)
	{
		num += 1;
	}
	if(festiveOn != 0)
	{
		num += 1;
	}
	return num;
}

void GiveNamedItem(int client, int weapon, char[] class, int slot)
{
	TF2_RemoveWeaponSlot(client, slot);

	DispatchSpawn(weapon);
	SetEntProp(weapon, Prop_Send, "m_bValidatedAttachedEntity", 1);
	SetEntProp(weapon, Prop_Send, "m_bInitialized", 1);
	EquipPlayerWeapon(client, weapon);

	//RequestFrame(Frame, i_pointer);
}


/*public void GiveWeaponFrame2(any pack)
{
	ResetPack(pack);
	int client = ReadPackCell(pack);
	int weapon = ReadPackCell(pack);
	EquipPlayerWeapon(client, weapon);
	CloseHandle(pack);
  //AcceptEntityInput(weapon, "Kill");
}*/
