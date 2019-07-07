;#maxThreadsPerHotkey, 1 ;最大开启线程数为1
#IfWinActive, ahk_class D3 Main Window Class ;仅在D3下有效

;黑人的问题在于按下变身之后有1秒延迟才能判断是否为黑人，导致非黑人代码也能触发
;鼠标滚轮往上瞬移，往下停止宏，滚轮按下白人阶段移动走位
;F2开启宏
;回城，看技能回车也能停止宏
;滚轮往上白人状态放黑洞


SetKeyDelay,50
SetMouseDelay,50

X:=0
Y:=0
Width:=1440
Height:=900
Return

v_E=0 ;脚本运行开关变量
global v_Enable = 0
global scolor =1
global i =0 
global sclolor_bef =0
global v_Rbtn=0

$F2:: 
{
i:=4
v_E:=!v_E
v_Enable := 0
send {2}
send {4}
SetTimer, Label1, 600  ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
SetTimer, MouseLButton, 150  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
SetTimer, CoreCire, 600   ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
}

Return


;$WheelUp::
$RButton::
{
/*
SetTimer, MouseLButton, off  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;寻找你“4”技能图标位置
scolor := SubStr(color, 3, 1) ;“4”技能位置没有图标的时候，颜色坐标第三个字符是1
if(scolor==1)
{
	send {3}

}
else{
	send {3}
	;sleep 150
	send {click right}
}

SetTimer, MouseLButton, 150  ;鼠标左键150毫秒连点，150可改动，只有这里需要改动
*/
if(v_Rbtn==0)
{
	
send {3}
}
else{
	click right
}

}
return

$F11::
{
	v_Rbtn:=!v_Rbtn
}
return

CoreCire()
{
WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;寻找你“4”技能图标位置
scolor := SubStr(color, 3, 1) ;“4”技能位置没有图标的时候，颜色坐标第三个字符是1

If (scolor=1 ) ;黑人状态
{	
	if(v_Enable==0)
	{
		send {2} ；开启罩子
		v_Enable:=1
	}
	send {G up}
}
if (scolor != sclolor_bef and scolor !=1) ;当状态位发生低位跳转时
{
	v_Enable:=0
	send {click right}
	sleep 50
	send {3}
	sclolor_bef := scolor ;调整判断符号	
	sleep 150
	PixelGetColor, color, Ceil(Width*0.4157), Ceil(Height*0.9574) ;寻找你“3”技能图标位置
	scolor_check3 := SubStr(color, 3, 1) ;“3”技能位置没有图标的时候，颜色坐标第三个字符是1
	if(scolor_check3!=1) ;3技能没cd就是说没释放出来
	{
		send {3}
	}

	sleep 50
	PixelGetColor, color, Ceil(Width*0.5210), Ceil(Height*0.9574) ;寻找你“右键”技能图标位置
	scolor_checkR := SubStr(color, 3, 1) ;“右键”技能位置没有图标的时候，颜色坐标第三个字符是1
	if(scolor_checkR!=1) ;3技能没cd就是说没释放出来
	{
		send {click right}
	}
}
if(scolor != sclolor_bef and scolor ==1) ;当状态位发生高位跳转时
{
	sclolor_bef := scolor
}
}
return

~WheelDown::
~Enter::  
~T::     
~S::      
~I::      
~M::      
~D::
~4::
;回车打字、按T回城、按S查看技能、按I查看装备、按M、按其他技能查看悬赏关闭宏，如需其他终止按键，自行添加
{
Shundown()
}
Return

Shundown()
{
	SetTimer, Label1, off  
	SetTimer, Label2, off  
	SetTimer, Label3, off  
	SetTimer, Label4, off  
	SetTimer, MouseLButton, off  
	SetTimer, MouseRButton, off     
	Send {G up} 
	SetTimer, CoreCire, off   ;动作条技能2键600毫秒连点，对应挑衅技能，600可改动
	
}
return
Label1:
{
Send {1} ;动作条技能1键对应按键
Return
}

Label2:
{
Send {2} ;动作条技能2键对应按键
Return
}

Label3:
{
Send {3} ;动作条技能3键对应按键
Return
}

Label4:
{
Send {4}  ;动作条技能4键对应按键
Return
}

MouseLButton:
{
Click    ;点击鼠标左键，对应主要技能
}
Return

MouseRButton:
{
Click Right ;点击鼠标右键，对应钢甲技能
}
Return


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
