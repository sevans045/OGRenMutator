class OG_Controller extends Rx_Controller;

/******************** Driving *******************/
state PlayerDriving
{
	exec function StartSprint()
	{}
}

/*Can be called directly to just send other messages to subtitles (which is where VP is displayed)*/
/*E.G: CP gained messages can use this to have feedback for CP gained. Just make sure to pay attention to your & delimiters*/
unreliable client function ClientSendFeelGoodMessage(coerce string VPString, optional string MessageSuffix)
{
	local string CurStr; //Hold our string as it's broken up
	local string StringPiece, FeatStr; //Current piece of string we're working with 
	//local array<string> Feat_List; 

	if(MessageSuffix == "") MessageSuffix = "VP" ; 
	
	CurStr = VPString ;
	
	while ( Instr(CurStr,"&") != -1) 
	{
		FeatStr = "";
		
		StringPiece = Left(CurStr, InStr(CurStr, "&"));
		
		FeatStr = StringPiece;

		CurStr=Right(CurStr, (Len(CurStr)-(Len(StringPiece)+1) )); //Delete the piece we were working with
		
		StringPiece = Left(CurStr, InStr(CurStr, "&"));

		CurStr=Right(CurStr, (Len(CurStr)-(Len(StringPiece)+1) )); //Delete the piece we were working with
		
		if(MessageSuffix == "CP") 
			FeatStr = "<font color='#00FF7F'>" $ FeatStr $ "</font>" ; 
		
		Rx_HUD(myHud).HudMovie.AddVPMessage(FeatStr);
	}
	
	
}

DefaultProperties
{
	RefillCooldownTime = 0
	PTMenuClass = class'OG_GFxPurchaseMenu'
}