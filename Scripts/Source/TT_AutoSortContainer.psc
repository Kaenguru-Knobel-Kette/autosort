ScriptName TT_AutoSortContainer Extends ObjectReference
{Automatically sort items added to this container.}

FormList Property ListOre Auto

Keyword Property ArmorHeavy Auto
Keyword Property ArmorJewelry Auto
Keyword Property ArmorLight Auto
Keyword Property ArmorShield Auto
Keyword Property VendorItemAnimalHide Auto
Keyword Property VendorItemGem Auto
Keyword Property VendorItemOreIngot Auto
Keyword Property WeapTypeStaff Auto
Keyword Property WeapTypeBow Auto

MiscObject Property Gold001 Auto

ObjectReference Property ContainerAmmo Auto
ObjectReference Property ContainerBook Auto
ObjectReference Property ContainerBow Auto
ObjectReference Property ContainerClothing Auto
ObjectReference Property ContainerFood Auto
ObjectReference Property ContainerGem Auto
ObjectReference Property ContainerGold Auto
ObjectReference Property ContainerHeavyArmor Auto
ObjectReference Property ContainerIngot Auto
ObjectReference Property ContainerIngredient Auto
ObjectReference Property ContainerJewlery Auto
ObjectReference Property ContainerKeys Auto
ObjectReference Property ContainerLeather Auto
ObjectReference Property ContainerLightArmor Auto
ObjectReference Property ContainerMisc Auto
ObjectReference Property ContainerOre Auto
ObjectReference Property ContainerPoison Auto
ObjectReference Property ContainerPotion Auto
ObjectReference Property ContainerScroll Auto
ObjectReference Property ContainerShield Auto
ObjectReference Property ContainerSpellTome Auto
ObjectReference Property ContainerSoulgem Auto
ObjectReference Property ContainerStaff Auto
ObjectReference Property ContainerWeapon Auto


Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If (akBaseItem As Ammo)
		SortItem(akBaseItem, aiItemCount, ContainerAmmo)
	ElseIf (akBaseItem As Armor)
		If (akBaseItem.HasKeyword(ArmorJewelry))
			SortItem(akBaseItem, aiItemCount, ContainerJewlery)
		ElseIf (akBaseItem.HasKeyword(ArmorShield))
			SortItem(akBaseItem, aiItemCount, ContainerShield)
		ElseIf (akBaseItem.HasKeyword(ArmorHeavy))
			SortItem(akBaseItem, aiItemCount, ContainerHeavyArmor)
		ElseIf (akBaseItem.HasKeyword(ArmorLight))
			SortItem(akBaseItem, aiItemCount, ContainerLightArmor)
		Else
			SortItem(akBaseItem, aiItemCount, ContainerClothing)
		EndIf		
	ElseIf (akBaseItem As Book)
		If ((akBaseItem As Book).GetSpell() != None)
			SortItem(akBaseItem, aiItemCount, ContainerSpellTome)
		Else
			SortItem(akBaseItem, aiItemCount, ContainerBook)
		EndIf
	ElseIf (akBaseItem As Ingredient)							
		SortItem(akBaseItem, aiItemCount, ContainerIngredient)
	ElseIf (akBaseItem As Key)
		SortItem(akBaseItem, aiItemCount, ContainerKeys)
	ElseIf (akBaseItem As Potion)
		If ((akBaseItem As Potion).IsFood())				
			SortItem(akBaseItem, aiItemCount, ContainerFood)
		ElseIf ((akBaseItem As Potion).IsPoison())
			SortItem(akBaseItem, aiItemCount, ContainerPoison)
		Else
			SortItem(akBaseItem, aiItemCount, ContainerPotion)
		EndIf
	ElseIf (akBaseItem As SoulGem)
		SortItem(akBaseItem, aiItemCount, ContainerSoulgem)
	ElseIf (akBaseItem As Scroll)
		SortItem(akBaseItem, aiItemCount, ContainerScroll)
	ElseIf (akBaseItem As Weapon)
		If (akBaseItem.HasKeyword(WeapTypeBow))
			SortItem(akBaseItem, aiItemCount, ContainerBow)
		ElseIf (akBaseItem.HasKeyword(WeapTypeStaff))
			SortItem(akBaseItem, aiItemCount, ContainerStaff)
		Else
			SortItem(akBaseItem, aiItemCount, ContainerWeapon)
		EndIf
	ElseIf (akBaseItem.HasKeyword(VendorItemAnimalHide))
		SortItem(akBaseItem, aiItemCount, ContainerLeather)
	ElseIf (akBaseItem.HasKeyword(VendorItemGem))
		SortItem(akBaseItem, aiItemCount, ContainerGem)
	ElseIf (akBaseItem.HasKeyword(VendorItemOreIngot))
		If (ListOre != None && ListOre.HasForm(akBaseItem))
			SortItem(akBaseItem, aiItemCount, ContainerOre)
		Else
			SortItem(akBaseItem, aiItemCount, ContainerIngot)
		EndIf
	ElseIf (akBaseItem == Gold001)
		SortItem(akBaseItem, aiItemCount, ContainerGold)
	Else
		SortItem(akBaseItem, aiItemCount, ContainerMisc)
	EndIf		
EndEvent


Function SortItem(Form akBaseItem, Int aiItemCount, ObjectReference akDestinationContainer)
	; Time spent in menus is not counted. This allows to retrieve items that were added by mistake.
	Utility.Wait(0.1)
	If (akDestinationContainer != None)
		RemoveItem(akBaseItem, aiItemCount, True, akDestinationContainer)	
	EndIf	
EndFunction
