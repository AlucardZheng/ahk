#IfWinActive,ahk_class D3 Main Window Class 

;ʥ�̾���Ǵ���ֶ��ּ׳��AHK��
;��F2��������ͣ��
;������������޸ģ�ע����ע���ɸĶ��ĵط���Ҫ�ģ������ط����ֲ��伴��
;������Щ�������ò�����1��Ǵ2����3�ɷ�4��ʿxǿ���ƶ���������Ҽ��ּ׵���ң������Ϸ��esc-ѡ��-�����󶨣��ɿ���������ָ�����1������2������1��Ӧ��ָ������Լ���ϰ�߰���������2��Ӧ��ָ�����1234x���У�������Ǵ�겻Ӱ����������ְҵҲ��Ӱ����֮ǰ�İ���ϰ��
;�ֶ��Ҽ��ּף�һ�´���
;��Ǯ���㹥��

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;�꿪�ر���
v_Enable1=0 
v_Tab=0     ;��Tab�鿴С��ͼ��ͣ����� 
global v_E=0

$F2:: ;bossվר��
{
	v_E=1
mainBOSS()
}
Return

$LCtrl:: ;��ȭ
{
	v_E=1
main()
}
Return

$F3::
{
	v_Enable1:=!v_Enable1
	if(v_Enable1 == 0)
	{
		send {g up}
	}
	else
	{
		send {g down}
	}
	
}

main()
{
	send {x up}
	send {G down}
	MYLbael:
	i=0
	;sleep 300
	;send {2}
	while(i<17)
	{
		i++
		send {1}
		send {3}
		send {4}
		Send {click}
		send {click right}
		sleep 150
		if(v_E==0)
		{
			goto MYLbae2
		}
	}
	if(v_E==1)
	{
		goto MYLbael
	}
	MYLbae2:
	send {G up}
	send {x down}
}
return

mainBOSS()
{
	send {x up}
	send {G down}
	MYLbae3:
	i=0
	;sleep 300
	;send {2}
	while(i<17)
	{
		i++
		send {3}
		send {4}
		Send {click}
		send {click right}
		sleep 150
		if(v_E==0)
		{
			goto MYLbae4
		}
	}
	if(v_E==1)
	{
		goto MYLbae3
	}
	MYLbae4:
	send {G up}
	send {x down}
}
return
~wheeldown::
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
SetTimer, MouseLButton, off  
SetTimer, MouseRButton, off     
Send {x up}   
Send {G up}    ;�ɿ�ǿ���ƶ���x��
v_Enable=0
v_E=0
}
Return

~Tab::
;��Tab�鿴������ͣ����Զ��ָ�
{
If (v_Enable) 
{
v_Tab:=!v_Tab
If (v_Tab)
{
SetTimer, Label1, off  
SetTimer, Label2, off  
SetTimer, Label3, off  
SetTimer, Label4, off  
SetTimer, MouseLButton, off  
SetTimer, MouseRButton, off     
Send {x up} 
Send {G up}    ;�ɿ�ǿ���ƶ���x��
}
Else 
{
SetTimer, Label1, 600 ;600�ɸĶ�  
SetTimer, Label2, 600 ;600�ɸĶ�  
SetTimer, Label3, 600 ;600�ɸĶ� 
SetTimer, Label4, 600 ;600�ɸĶ�  
SetTimer, MouseLButton, 150 ;150�ɸĶ�  
SetTimer, MouseRButton, off ;�ּ��Ҽ��ֶ�    
Send {x down}  
Send {G down}    ;�ɿ�ǿ���ƶ���x��
}
}   
}
Return

~*LButton::  ;��ס���ֹͣǿ���ƶ�
If (v_Enable)
Send {x up}
Return

*LButton Up::  ;�ɿ�����ָ�ǿ���ƶ�
If (v_Enable)
Send {x down}
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

MouseLButton:
{
Click    ;�������������Ӧ��Ҫ����
IfWinNotActive,�����ƻ���III ;����������Ϸ�˴����л��رպ�
{
SetTimer, Label1, off 
SetTimer, Label2, off 
SetTimer, Label3, off 
SetTimer, Label4, off 
SetTimer, MouseLButton, off 
SetTimer, MouseRButton, off 
Send {x up} 
v_Enable=0
}
}
Return

MouseRButton:
{
Click Right ;�������Ҽ�����Ӧ�ּ׼���
IfWinNotActive,�����ƻ���III ;����������Ϸ�˴����л��رպ�
{
SetTimer, Label1, off 
SetTimer, Label2, off 
SetTimer, Label3, off 
SetTimer, Label4, off 
SetTimer, MouseLButton, off 
SetTimer, MouseRButton, off 
Send {x up} 
v_Enable=0
}
}
Return
