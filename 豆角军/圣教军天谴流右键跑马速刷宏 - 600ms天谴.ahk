#IfWinActive,ahk_class D3 Main Window Class 

;ʥ�̾���Ǵ��������ˢAHK��
;��F2��������ͣ��
;������������޸ģ�ע����ע���ɸĶ��ĵط���Ҫ�ģ������ط����ֲ��伴��
;������Щ�������ò�����1��Ǵ2����3�ɷ�4��ʿxǿ���ƶ���������Ҽ��������ң������Ϸ��esc-ѡ��-�����󶨣��ɿ���������ָ�����1������2������1��Ӧ��ָ������Լ���ϰ�߰���������2��Ӧ��ָ�����1234x���У�������Ǵ�겻Ӱ����������ְҵҲ��Ӱ����֮ǰ�İ���ϰ��
;�ֶ��Ҽ�ս���棬��Ҫ��ס�Ҽ����������ɿ��Ҽ��ظ��Զ���Ǵ

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;�꿪�ر���
v_Tab=0     ;��Tab�鿴С��ͼ��ͣ����� 

$F2::   ;���ؼ�������в������ң����Խ�F2�����������Ӧ�Ĵ���XButton1��XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable=0) 
{
SetTimer, Label1, off  ;�رռ���1�����ʱ��
SetTimer, Label2, off  ;�رռ���2�����ʱ��
SetTimer, Label3, off  ;�رռ���3�����ʱ��
SetTimer, Label4, off  ;�رռ���4�����ʱ��
SetTimer, MouseLButton, off  ;�ر���������ʱ��
SetTimer, MouseRButton, off     ;�ر��Ҽ������ʱ��
Send {x up}    ;�ɿ�ǿ���ƶ���x��
}
Else 
{
SetTimer, Label1, 600  ;����������1��600�������㣬��Ӧ��Ǵ���ܣ�600�ɸĶ�
SetTimer, Label2, 600  ;����������2��600�������㣬��Ӧ���Ƽ��ܣ�600�ɸĶ�
SetTimer, Label3, 600  ;����������3��600�������㣬��Ӧ�ɷ����ܣ�600�ɸĶ�
SetTimer, Label4, 600  ;����������4��600�������㣬��Ӧ��ʿ���ܣ�600�ɸĶ�
SetTimer, MouseLButton, 150  ;������150�������㣬150�ɸĶ�
SetTimer, MouseRButton, off     ;����Ҽ�����رգ���ס�Ҽ��ֶ�����ս����
Send {x down}   ;�Զ���סǿ���ƶ���x���ر�ǿ���ƶ�down��up��down�ɸĶ�
}
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
v_Enable=0
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
}
Else 
{
SetTimer, Label1, 600 ;600�ɸĶ�  
SetTimer, Label2, 600 ;600�ɸĶ�  
SetTimer, Label3, 600 ;600�ɸĶ� 
SetTimer, Label4, 600 ;600�ɸĶ�  
SetTimer, MouseLButton, 150 ;150�ɸĶ�  
SetTimer, MouseRButton, off ;������Ǵ�Ҽ��ֶ�    
Send {x down}      
}
}   
}
Return

~*RButton::  ;��ס�Ҽ�������ͣ123��������㣬����ǿ���ƶ���������ʿ����
If (v_Enable)
{
SetTimer, Label1, off  
SetTimer, Label2, off  
SetTimer, Label3, off   
SetTimer, MouseLButton, off       
Send {x down}
}
Return

*RButton Up::  ;�ɿ��Ҽ�����ָ�123��������㣬����ǿ���ƶ���������ʿ����
If (v_Enable)
{
SetTimer, Label1, 600  
SetTimer, Label2, 600 
SetTimer, Label3, 600  
SetTimer, MouseLButton, 150       
Send {x down}
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
