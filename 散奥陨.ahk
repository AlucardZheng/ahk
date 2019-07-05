#maxThreadsPerHotkey, 1 ;最大开启线程数为1
#IfWinActive, ahk_class D3 Main Window Class ;仅在D3下有效

;黑人的问题在于按下变身之后有1秒延迟才能判断是否为黑人，导致非黑人代码也能触发
;鼠标滚轮往上瞬移，往下停止宏，滚轮按下白人阶段移动走位
;F2开启宏
;回城，看技能回车也能停止宏
;滚轮往上白人状态放黑洞
;需要砸3个陨石，前面两个出圈，第三个站圈砸,需要高爆回，装备支撑不住，而且大部分宏达48秒循环，这个宏打的32秒循环，所以不需要太计较，顶多让死灵帮打红圈
;54+cdr够用
;白人站不住怎么办？巅峰点体力，保证血量80w，带转煞，
;测试需要火牛;黑人状态改成右键叠层,右键叠层需要不动才能用，不能赶路火牛低了站不住起码100
;散奥陨需要4种按键：1键循环，1键放陨石+前置，1键放陨石+前置+黑人，1键黑人状态叠层,黑人状态不能叠层



SetKeyDelay,50
SetMouseDelay,50

 X:=0
 Y:=0
 Width:=1440
 Height:=900
Return

global v_E=0 ;脚本运行开关变量
global v_Enable = 0
global scolor =1
global i =0 
global color
global oneclick=1	;标志位，让F2的循环唯一

$F2:: 
{
if(oneclick==0 and v_E==0)
{
		goto Mylabel2
}
v_E=0
oneclick=0
Mylabel1:
	send {3}
	sleep 600
	send {1 down}
	sleep 1300
	send {1 up}
	click right
	sleep 420
	send {click down}
	sleep 700
	send {click up}
	send {4 down}
	send {2}
	sleep 700
	send {4 up}
	;sleep {11980} ; 全能法戒转一圈需要16秒，减去上面放技能用时，剩下11980
		;黑人持续时间20秒,也就是说没两轮法戒打一波最好,点击按键也需要时间，所以不能用sleep的时间来计算
	;黑人时间循环
	i=0
	;Send {click right Down}
	while(i<63) ;剩余50ms
	{
	if(v_E==1)
	{		
		goto Mylabel2
	}
		send {1}
		send {click}
		sleep 150
		i++	
	}
	;Send {click right up}
	sleep 200
	send {4 down}
	sleep 400
	send {3}
	if(v_E==1)
	{
		goto Mylabel2
	}
	sleep 8440
	send {4 up}
/*	if(v_E==1)
	{
		return
	}
	send {3}
	sleep 600
	send {1 down}
	sleep 1300
	send {1 up}
	click right
	sleep 1120
	send {4 down}
	send {2}
	sleep 300
	send {4 up} 
	*/
	if(v_E==1)
	{
		goto Mylabel2
	}
	goto Mylabel1
Mylabel2:
}

Return

$F3:: ;一键陨石
{
	send {3}
	sleep 600
	send {1 down}
	sleep 1300
	send {1 up}
	click right
	sleep 420
	send {click down}
	sleep 700
	send {click up}
	send {4 down}
	sleep 700
	send {4 up}
}
return


$F4:: ;一键陨石+黑人
{
	send {3}
	sleep 600
	send {1 down}
	sleep 1300
	send {1 up}
	click right
	sleep 420
	send {click down}
	sleep 700
	send {click up}
	send {4 down}
	send {2}
	sleep 700
	send {4 up}
}
return

$WheelUp::
{

	send {3}

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
	v_E=1
	oneclick=1
}

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