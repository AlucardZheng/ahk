
$F2:: 
{
arr := object()
WinGetPos,X,Y,Width, Height, A ;�ж������Ϸ���ڷֱ���
i=0
j=0
while (i<4)
{
	j=0
	while (j<4)
	{
		PixelGetColor, color, Ceil(Width*0.8958+i*0.104), Ceil(Height*0.1759+j*0.139) ;Ѱ���㡰4������ͼ��λ��
		arr[i,j]:=color	;8958,1759
		j++		
	}	
	i++
}
adj=0
Pause
;PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;Ѱ���㡰4������ͼ��λ��
;scolor := SubStr(color, 3, 1) ;��4������λ��û��ͼ���ʱ����ɫ����������ַ���1

}
return

;0x1D2628	0x1E282A	0x1E282A	0x1E282A
;0x192223	0x1E282A	0x1E282A	0x1E282A
;0x192223	0x1E282A	0x1E282A	0x1E282A
;0x192223 	0x1E282A	0x1E282A	0x1E282A