#IfWinActive,ahk_class D3 Main Window Class 

;ʥ�̾���Ǵ���ֶ��ּ׳��AHK��
;��F2��������ͣ��
;������������޸ģ�ע����ע���ɸĶ��ĵط���Ҫ�ģ������ط����ֲ��伴��
;������Щ�������ò�����1��Ǵ2����3�ɷ�4��ʿxǿ���ƶ���������Ҽ��ּ׵���ң������Ϸ��esc-ѡ��-�����󶨣��ɿ���������ָ�����1������2������1��Ӧ��ָ������Լ���ϰ�߰���������2��Ӧ��ָ�����1234x���У�������Ǵ�겻Ӱ����������ְҵҲ��Ӱ����֮ǰ�İ���ϰ��
;�ֶ��Ҽ��ּף���һ�´���
;������Ҫ�Զ��ͷŶ�ǽ

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;�꿪�ر���
v_Tab=0     ;��Tab�鿴С��ͼ��ͣ����� 
global vIndex=0

$F2::   ;���ؼ�������в������ң����Խ�F2�����������Ӧ�Ĵ���XButton1��XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable=0) 
{
SetTimer, Label1, off  ;�رռ���1�����ʱ��
SetTimer, Label2, off  ;�رռ���2�����ʱ��
SetTimer, Label3, off  ;�رռ���3�����ʱ��
SetTimer, Label4, off  ;�رռ���4�����ʱ��
SetTimer, LBtn, off  ;�ر���������ʱ��
SetTimer, MouseRButton, off     ;�ر��Ҽ������ʱ��
Send {x up}    ;�ɿ�ǿ���ƶ���x��
}
Else 
{
	
	;��������һ��
	send {3}
	send {4}
	send {click right}
	send {click}
	;����
;SetTimer, Label1, 1000  ;����������1��600�������㣬��Ӧ��Ǵ���ܣ�600�ɸĶ�
;SetTimer, Label2, 600  ;����������2��600�������㣬��Ӧ���Ƽ��ܣ�600�ɸĶ�
SetTimer, Label3, 3800  ;����������3��600�������㣬��Ӧ�ɷ����ܣ�600�ɸĶ�
SetTimer, Label4, 1900  ;����������4��600�������㣬��Ӧ��ʿ���ܣ�600�ɸĶ�
SetTimer, LBtn, 5500  ;������150�������㣬150�ɸĶ���ֻ��������Ҫ�Ķ�
SetTimer, MouseRButton, 7800     ;����Ҽ�600�������㣬�ּ��ֶ��������Զ��ּ�off����600��off�ɸĶ�
Send {x down}   ;�Զ���סǿ���ƶ���x���ر�ǿ���ƶ�down��up��down�ɸĶ�
}
} 
Return 

$`::
{
	
	vIndex:=!vIndex
	if(vIndex==0)
	{
		Send {x up}
	}
	else{
		Send {x down}
	}
}
return

~Enter::  
~T::     
~S::      
~I::      
~M::      
;�س����֡���T�سǡ���S�鿴���ܡ���I�鿴װ������M�鿴���͹رպ�
{
SetTimer, Label1, off  
SetTimer, Label2, off  
SetTimer, Label3, off  
SetTimer, Label4, off  
SetTimer, LBtn, off  
SetTimer, MouseRButton, off     
Send {x up}   
v_Enable=0
}
Return



Label1:
{
Send {1} ;����������1����Ӧ����
Return
}

Label2:
{
Send {2} ;����������2����Ӧ����
Return
}

Label3:
{
Send {3} ;����������3����Ӧ����
Return
}

Label4:
{
Send {4}  ;����������4����Ӧ����
Return
}


Sound1:
{
SoundPlay, .\dunqiang.wav
Return
}

LBtn()
{
	send {g down}
Click    ;�������������Ӧ��Ҫ����
	send {g up}
}
Return

MouseRButton:
{
Click Right ;�������Ҽ�����Ӧ�ּ׼���
}
Return



global v_Met=0
global v_SH=0



$F3::
{
	v_Met=1
	labelMet:
	sleep 12000
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
	sleep 16000
	if(v_Met!=0)
	{
		SoundMet()
	}
	else{
		goto labelMetEnd
	}
	sleep 4000
	if(v_Met!=0)
	{
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
/*
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
*/

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