#maxThreadsPerHotkey, 1 ;最大开启线程数为1
#IfWinActive, ahk_class D3 Main Window Class ;仅在D3下有效

SetKeyDelay,50
SetMouseDelay,50

X:=0
Y:=0
Width:=1440
Height:=900
Return

v_E=0 ;脚本运行开关变量

$F2:: 
{
v_E=1
i=0
WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
Mylabel1:
PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;寻找你“4”技能图标位置
scolor := SubStr(color, 3, 1) ;“4”技能位置没有图标的时候，颜色坐标第三个字符是1

If (scolor=1 AND v_E=1)
{
	i++
	Click
	if(i=3)
	{
		send {1}
		i=0
	}
	
	sleep 150 ;黑人状态1的释放间隔，单位ms，可以修改，建议在600-700之间，如果设置过短会有按键惩罚
	Goto, MyLabel1
}
Else
{
	send {1} ;我把黑人设置在1，所以按1是开启黑人
	sleep 200
	PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;判断上面的1黑人是不是开启成功
	scolor := SubStr(color, 3, 1)
	If (scolor=1 AND v_E=1)
	{
	Goto, MyLabel1 ;如果开启成功，自动循环开黑人的1
	}
	
	
}
}

Return

~Enter::  
~T::     
~S::      
~I::      
~M::      
~D::
~4::
;回车打字、按T回城、按S查看技能、按I查看装备、按M、按其他技能查看悬赏关闭宏，如需其他终止按键，自行添加
{
v_E=0
}
Return