;#IfWinActive,ahk_class D3 Main Window Class 


global v_Met=0
global v_SH=0



$F3::
{
	v_Met=1
	labelMet:
	sleep 12000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	sleep 4000
	sleep 16000
	sleep 16000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	sleep 16000
	sleep 16000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	goto labelMet
	labelMetEnd:
}
return

$F4::
{
	v_Met=0
}
return

$F5::
{
	v_SH=1
	labelSH:
	if(v_SH!=0)
	{
		SoundSH()
	}
	else{
		goto labelSHEnd
	}
	sleep 11000
	goto labelSH
	labelSHEnd:
}
return

$F6::
{
	v_SH=0
}
return

SoundMet()
{
	SoundPlay, .\yunshizhunbei.wav
	Return
}


SoundSH()
{
	SoundPlay, .\dunqiang.wav
	Return
}
