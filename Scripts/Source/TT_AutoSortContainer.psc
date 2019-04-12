ScriptName TT_AutoSortContainer Extends ObjectReference
{Automatically sort items added to this container.}

FormList Property ListOre Auto

Keyword Property ArmorJewelry Auto
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
		RemoveItem(akBaseItem, aiItemCount, True, ContainerAmmo)
	ElseIf (akBaseItem As Armor)
		If (akBaseItem.HasKeyword(ArmorJewelry))
			RemoveItem(akBaseItem, aiItemCount, True, ContainerJewlery)
		ElseIf (akBaseItem.HasKeyword(ArmorShield))
			RemoveItem(akBaseItem, aiItemCount, True, ContainerShield)
		ElseIf ((akBaseItem As Armor).GetWeightClass() == 1)
			RemoveItem(akBaseItem, aiItemCount, True, ContainerHeavyArmor)
		ElseIf ((akBaseItem As Armor).GetWeightClass() == 0)
			RemoveItem(akBaseItem, aiItemCount, True, ContainerLightArmor)
		Else
			RemoveItem(akBaseItem, aiItemCount, True, ContainerClothing)
		EndIf		
	ElseIf (akBaseItem As Book)
		If ((akBaseItem As Book).GetSpell() != None)
			RemoveItem(akBaseItem, aiItemCount, True, ContainerSpellTome)
		Else
			RemoveItem(akBaseItem, aiItemCount, True, ContainerBook)
		EndIf
	ElseIf (akBaseItem As Ingredient)							
		RemoveItem(akBaseItem, aiItemCount, True, ContainerIngredient)
	ElseIf (akBaseItem As Key)
		RemoveItem(akBaseItem, aiItemCount, True, ContainerKeys)
	ElseIf (akBaseItem As Potion)
		If ((akBaseItem As Potion).IsFood())				
			RemoveItem(akBaseItem, aiItemCount, True, ContainerFood)
		ElseIf ((akBaseItem As Potion).IsPoison())
			RemoveItem(akBaseItem, aiItemCount, True, ContainerPoison)
		Else
			RemoveItem(akBaseItem, aiItemCount, True, ContainerPotion)
		EndIf
	ElseIf (akBaseItem As SoulGem)
		RemoveItem(akBaseItem, aiItemCount, True, ContainerSoulgem)
	ElseIf (akBaseItem As Scroll)
		RemoveItem(akBaseItem, aiItemCount, True, ContainerScroll)
	ElseIf (akBaseItem As Weapon)
		If (akBaseItem.HasKeyword(WeapTypeBow))
			RemoveItem(akBaseItem, aiItemCount, True, ContainerBow)
		ElseIf (akBaseItem.HasKeyword(WeapTypeStaff))
			RemoveItem(akBaseItem, aiItemCount, True, ContainerStaff)
		Else
			RemoveItem(akBaseItem, aiItemCount, True, ContainerWeapon)
		EndIf
	ElseIf (akBaseItem.HasKeyword(VendorItemAnimalHide))
		RemoveItem(akBaseItem, aiItemCount, True, ContainerLeather)
	ElseIf (akBaseItem.HasKeyword(VendorItemGem))
		RemoveItem(akBaseItem, aiItemCount, True, ContainerGem)
	ElseIf (akBaseItem.HasKeyword(VendorItemOreIngot))
		If (ListOre != None && ListOre.HasForm(akBaseItem))
			RemoveItem(akBaseItem, aiItemCount, True, ContainerOre)
		Else
			RemoveItem(akBaseItem, aiItemCount, True, ContainerIngot)
		EndIf
	ElseIf (akBaseItem == Gold001)
		RemoveItem(akBaseItem, aiItemCount, True, ContainerGold)
	Else
		RemoveItem(akBaseItem, aiItemCount, True, ContainerMisc)
	EndIf		
EndEvent
