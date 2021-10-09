class OG_Weapon_AutoRifle_Nod extends OG_Weapon_AutoRifle_GDI;

DefaultProperties
{
	TeamSkin=MaterialInterface'RX_WP_AutoRifle.Materials.MI_WP_AR_Nod'
	TeamIndex = 1 

	AttachmentClass = class'Rx_Attachment_AutoRifle_Nod'

	WeaponProjectiles(0)=class'OG_Projectile_AutoRifle_Nod'
	WeaponProjectiles(1)=class'OG_Projectile_AutoRifle_Nod'
}
