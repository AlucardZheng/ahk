#IfWinActive,ahk_class D3 Main Window Class 

;ʥ�̾���Ǵ���ֶ��ּ׳��AHK��
;��F2��������ͣ��
;������������޸ģ�ע����ע���ɸĶ��ĵط���Ҫ�ģ������ط����ֲ��伴��
;������Щ�������ò�����1��Ǵ2����3�ɷ�4��ʿxǿ���ƶ���������Ҽ��ּ׵���ң������Ϸ��esc-ѡ��-�����󶨣��ɿ���������ָ�����1������2������1��Ӧ��ָ������Լ���ϰ�߰���������2��Ӧ��ָ�����1234x���У�������Ǵ�겻Ӱ����������ְҵҲ��Ӱ����֮ǰ�İ���ϰ��
;�ֶ��Ҽ��ּף���һ�´���

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;�꿪�ر���
v_Enable1=0 
v_Enable2=0 
v_Tab=0     ;��Tab�鿴С��ͼ��ͣ����� 

$F2::   ;���ؼ�������в������ң����Խ�F2�����������Ӧ�Ĵ���XButton1��XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable==0) 
{
Send {click up} 
SetTimer, Label2, off  ;�رռ���2�����ʱ��
SetTimer, Label3, off  ;�رռ���3�����ʱ��
SetTimer, Label4, off  ;�رռ���4�����ʱ��
}
Else 
{
Send {click down}
SetTimer, Label2, 600  ;����������2��600�������㣬��Ӧ���Ƽ��ܣ�600�ɸĶ�
SetTimer, Label3, 600  ;����������3��600�������㣬��Ӧ�ɷ����ܣ�600�ɸĶ�
SetTimer, Label4, 600  ;����������4��600�������㣬��Ӧ��ʿ���ܣ�600�ɸĶ�
}
} 
Return 

$Z:: ;ʰȡ��Ʒ
{
v_Enable1:=0
v_Enable2:=!v_Enable2
If(v_Enable2==0)
{
SetTimer, MouseLButton, off  ;������150�������㣬150�ɸĶ���ֻ��������Ҫ�Ķ�
Send {click down}
Send {x down}   ;�Զ���סǿ���ƶ���x���ر�ǿ���ƶ�down��up��down�ɸĶ�
}
Else
{
SetTimer, Label1, off  ;�رռ���1�����ʱ��
SetTimer, MouseLButton, 150  ;������150�������㣬150�ɸĶ���ֻ��������Ҫ�Ķ�
Send {x down}   ;�Զ���סǿ���ƶ���x���ر�ǿ���ƶ�down��up��down�ɸĶ�
}
} 
Return

$LCtrl:: ;�ͷŽ�����
{
v_Enable1:=!v_Enable1
v_Enable2:=0
If (v_Enable1==0) 
{
Send {click down}
SetTimer, Label1, off  ;�رռ���1�����ʱ��
Send {x up}    ;�ɿ�ǿ���ƶ���x��
}
Else
{
SetTimer, MouseLButton, off  ;�ر���������ʱ��
Send {click up} 
SetTimer, Label1, 150  ;����������1��600�������㣬��Ӧ��Ǵ���ܣ�600�ɸĶ�
Send {x down}   ;�Զ���סǿ���ƶ���x���ر�ǿ���ƶ�down��up��down�ɸĶ�
}
}
Return

$MouseRButton:
{

Send {click down}
SetTimer, MouseLButton, off  ;�ر���������ʱ��
SetTimer, Label1, off  ;�رռ���1�����ʱ��
Send {x up}    ;�ɿ�ǿ���ƶ���x��

Click Right ;�������Ҽ�����Ӧ�ּ׼���

SetTimer, Label1, 150  ;����������1��600�������㣬��Ӧ��Ǵ���ܣ�600�ɸĶ�
Send {x down}   ;�Զ���סǿ���ƶ���x���ر�ǿ���ƶ�down��up��down�ɸĶ�
}
Return
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
Send {click up} 
v_Enable=0
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