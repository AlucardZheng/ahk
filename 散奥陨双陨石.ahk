#maxThreadsPerHotkey, 1 ;最大开启线程数为1
#IfWinActive, ahk_class D3 Main Window Class ;仅在D3下有效

;黑人的问题在于按下变身之后有1秒延迟才能判断是否为黑人，导致非黑人代码也能触发
;鼠标滚轮往上瞬移，往下停止宏，滚轮按下白人阶段移动走位
;F2开启宏
;回城，看技能回车也能停止宏
;滚轮往上白人状态放黑洞
;需要砸3个陨石，前面两个出圈，第三个站圈砸,需要高爆回，装备支撑不住，而且大部分宏达48秒循环，这个宏打的32秒循环，所以不需要太计较，顶多让死灵帮打红圈
;54+cdr够用
;白人站不住怎么办？巅峰点体力，保证血量80w
;双陨石要求更多cdr，目前没法测试
;黑人持续时间结束后炸一个陨石，出神目，然后等全能到点在砸第二个。要求:神目的持续时间够长
;双黑人循环的陨石放法，火元素3/4开始放陨石两颗，全能循环开始第一次奥元素炸陨石，第二次奥元素在黑人阶段，第三次奥元素砸单陨石，第四次黑人阶段，第五次白人阶段跳过，第六次砸双陨石


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
	return
}
v_E=0
oneclick=0
Mylabel1:
	send {3}		;火全能走完开始技能
	send {1 down}
	sleep 600
	;send {1 up}
	click right
	sleep 1120
	send {4 down}
	if(v_E==1)
	{
		return
	}
	sleep 200
	send {4 up}
	;send {1 down}
	sleep 1700
	send {1 up}
	send {x down}
	click right
	sleep 420
	sleep 700
	send {x up}
	send {4 down}
	if(v_E==1)
	{
		return
	}
	send {2}		;黑人变身
	sleep 300
	send {4 up}
	;return
	;sleep {11980} ; 全能法戒转一圈需要16秒，减去上面放技能用时，剩下11980
		;黑人持续时间20秒,也就是说没两轮法戒打一波最好,点击按键也需要时间，所以不能用sleep的时间来计算
	;黑人时间循环
	i=0
	send {x down}
	/*
	while(i<75) ;剩余50ms
	{
	if(v_E==1)
	{		
		return
	}
		;send {1}
		send {click}
		sleep 150
		i++	
	}
	*/
	sleep 19700		;黑人循环时间20秒
	send {x up}
	sleep 200
	send {4 down}
	if(v_E==1)
	{
		return
	}
	sleep 10100		;攻击出发黄道减黑人cd
	send {4 up}
	;第二次循环，单陨石
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
	sleep 300
	send {4 up}
	send {x down}
	sleep 19700		;黑人循环时间20秒
	send {x up}
	if(v_E==1)
	{
		return
	}
	sleep 200
	send {4 down}
	if(v_E==1)
	{
		return
	}
	sleep 10100		;攻击出发黄道减黑人cd
	send {4 up}
	if(v_E==1)
	{
		return
	}
	sleep 4000
	sleep 6000
	goto Mylabel1
}

Return


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