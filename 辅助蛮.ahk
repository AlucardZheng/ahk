;#IfWinActive,ahk_class D3 Main Window Class 

;Ê¥½Ì¾üÌìÇ´Á÷ÊÖ¶¯¸Ö¼×³å²ãAHKºê
;°´F2Æô¶¯»òÔİÍ£ºê
;¹ØÓÚÄÄÀï¿ÉÒÔĞŞ¸Ä£¬×¢ÊÍÀï×¢Ã÷¿É¸Ä¶¯µÄµØ·½ĞèÒª¸Ä£¬ÆäËûµØ·½±£³Ö²»±ä¼´¿É
;¶ÔÓÚÄÇĞ©°´¼üÉèÖÃ²¢²»ÊÇ1ÌìÇ´2ÌôĞÆ3ÂÉ·¨4ÓÂÊ¿xÇ¿ÖÆÒÆ¶¯×ó¼ü»ØÄÜÓÒ¼ü¸Ö¼×µÄÍæ¼Ò£¬Çë½øÓÎÏ·°´esc-Ñ¡Ïî-°´¼ü°ó¶¨£¬¿É¿´µ½½çÃæÉÏÖ¸Áî¡¢°´¼ü1¡¢°´¼ü2£¬°´¼ü1¶ÔÓ¦µÄÖ¸ÁîÉè³É×Ô¼ºµÄÏ°¹ß°´¼ü£¬°´¼ü2¶ÔÓ¦µÄÖ¸ÁîÉè³É1234x¾ÍĞĞ£¬ÕâÑùÌìÇ´ºê²»Ó°ÏìÄãÍæÆäËûÖ°ÒµÒ²²»Ó°ÏìÄãÖ®Ç°µÄ°´¼üÏ°¹ß
;ÊÖ¶¯ÓÒ¼ü¸Ö¼×£¬°´Ò»ÏÂ´¥·¢

SetKeyDelay,20
SetMouseDelay,20

v_Enable=0  ;ºê¿ª¹Ø±äÁ¿
v_Tab=0     ;°´Tab²é¿´Ğ¡µØÍ¼ÔİÍ£ºê±äÁ¿ 
global vIndex=0

$F2::   ;¿ª¹Ø¼ü£¬Êó±êÓĞ²à¼üµÄÍæ¼Ò£¬¿ÉÒÔ½«F2»»³ÉÊó±ê²à¼ü¶ÔÓ¦µÄ´úÂëXButton1¡¢XButton2
{ 
v_Enable:=!v_Enable 
If (v_Enable=0) 
{
SetTimer, Label1, off  ;¹Ø±Õ¼¼ÄÜ1Á¬µã¼ÆÊ±Æ÷
SetTimer, Label2, off  ;¹Ø±Õ¼¼ÄÜ2Á¬µã¼ÆÊ±Æ÷
SetTimer, Label3, off  ;¹Ø±Õ¼¼ÄÜ3Á¬µã¼ÆÊ±Æ÷
SetTimer, Label4, off  ;¹Ø±Õ¼¼ÄÜ4Á¬µã¼ÆÊ±Æ÷
SetTimer, MouseLButton, off  ;¹Ø±Õ×ó¼üÁ¬µã¼ÆÊ±Æ÷
SetTimer, MouseRButton, off     ;¹Ø±ÕÓÒ¼üÁ¬µã¼ÆÊ±Æ÷
Send {x up}    ;ËÉ¿ªÇ¿ÖÆÒÆ¶¯¼üx£¬
SetTimer, Sound1, off
}
Else 
{
;SetTimer, Label1, 1000  ;¶¯×÷Ìõ¼¼ÄÜ1¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÌìÇ´¼¼ÄÜ£¬600¿É¸Ä¶¯
;SetTimer, Label2, 600  ;¶¯×÷Ìõ¼¼ÄÜ2¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÌôĞÆ¼¼ÄÜ£¬600¿É¸Ä¶¯
SetTimer, Label3, 3800  ;¶¯×÷Ìõ¼¼ÄÜ3¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÂÉ·¨¼¼ÄÜ£¬600¿É¸Ä¶¯
SetTimer, Label4, 3800  ;¶¯×÷Ìõ¼¼ÄÜ4¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÓÂÊ¿¼¼ÄÜ£¬600¿É¸Ä¶¯
;SetTimer, MouseLButton, 150  ;Êó±ê×ó¼ü150ºÁÃëÁ¬µã£¬150¿É¸Ä¶¯£¬Ö»ÓĞÕâÀïĞèÒª¸Ä¶¯
;SetTimer, MouseRButton, 600     ;Êó±êÓÒ¼ü600ºÁÃëÁ¬µã£¬¸Ö¼×ÊÖ¶¯´¥·¢£¬×Ô¶¯¸Ö¼×off»»³É600£¬off¿É¸Ä¶¯
Send {x down}   ;×Ô¶¯°´×¡Ç¿ÖÆÒÆ¶¯¼üx£¬¹Ø±ÕÇ¿ÖÆÒÆ¶¯down»»up£¬down¿É¸Ä¶¯
SetTimer, Sound1, 11000  ;		;11ÃëÒ»´Î¶ÜÇ½
}
} 
Return 

$`::
{
	
	vIndex:=!vIndex
	if(vIndex==0)
	{
		;Send {x up}
	}
	else{
		;Send {x down}
	}
}
return

~Enter::  
~T::     
~S::      
~I::      
~M::      
;»Ø³µ´ò×Ö¡¢°´T»Ø³Ç¡¢°´S²é¿´¼¼ÄÜ¡¢°´I²é¿´×°±¸¡¢°´M²é¿´ĞüÉÍ¹Ø±Õºê
{
SetTimer, Label1, off  
SetTimer, Label2, off  
SetTimer, Label3, off  
SetTimer, Label4, off  
SetTimer, MouseLButton, off  
SetTimer, MouseRButton, off     
Send {x up}   
SetTimer, Sound1, off
v_Enable=0
}
Return

~Tab::
;°´Tab²é¿´µØĞÎÔİÍ£ºêºÍ×Ô¶¯»Ö¸´
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
SetTimer, Sound1, off
Send {x up} 
}
Else 
{
;SetTimer, Label1, 1000  ;¶¯×÷Ìõ¼¼ÄÜ1¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÌìÇ´¼¼ÄÜ£¬600¿É¸Ä¶¯
;SetTimer, Label2, 600  ;¶¯×÷Ìõ¼¼ÄÜ2¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÌôĞÆ¼¼ÄÜ£¬600¿É¸Ä¶¯
SetTimer, Label3, 3800  ;¶¯×÷Ìõ¼¼ÄÜ3¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÂÉ·¨¼¼ÄÜ£¬600¿É¸Ä¶¯
SetTimer, Label4, 3800  ;¶¯×÷Ìõ¼¼ÄÜ4¼ü600ºÁÃëÁ¬µã£¬¶ÔÓ¦ÓÂÊ¿¼¼ÄÜ£¬600¿É¸Ä¶¯
;SetTimer, MouseLButton, 150  ;Êó±ê×ó¼ü150ºÁÃëÁ¬µã£¬150¿É¸Ä¶¯£¬Ö»ÓĞÕâÀïĞèÒª¸Ä¶¯
;SetTimer, MouseRButton, 600     ;Êó±êÓÒ¼ü600ºÁÃëÁ¬µã£¬¸Ö¼×ÊÖ¶¯´¥·¢£¬×Ô¶¯¸Ö¼×off»»³É600£¬off¿É¯    
Send {x down}  
SetTimer, Sound1, 11000  ;		;11ÃëÒ»?
}
}   
}
Return


Label1:
{
Send {1} ;¶¯×÷Ìõ¼¼ÄÜ1¼ü¶ÔÓ¦°´¼ü
Return
}

Label2:
{
Send {2} ;¶¯×÷Ìõ¼¼ÄÜ2¼ü¶ÔÓ¦°´¼ü
Return
}

Label3:
{
Send {3} ;¶¯×÷Ìõ¼¼ÄÜ3¼ü¶ÔÓ¦°´¼ü
Return
}

Label4:
{
Send {4}  ;¶¯×÷Ìõ¼¼ÄÜ4¼ü¶ÔÓ¦°´¼ü
Return
}


Sound1:
{
SoundPlay, .\dunqiang.wav
Return
}

MouseLButton:
{
Click    ;µã»÷Êó±ê×ó¼ü£¬¶ÔÓ¦Ö÷Òª¼¼ÄÜ
}
Return

MouseRButton:
{
Click Right ;µã»÷Êó±êÓÒ¼ü£¬¶ÔÓ¦¸Ö¼×¼¼ÄÜ
}
Return
