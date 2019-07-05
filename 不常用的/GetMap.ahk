
$F2:: 
{
arr := object()
WinGetPos,X,Y,Width, Height, A ;判断你的游戏窗口分辨率
i=0
j=0
while (i<4)
{
	j=0
	while (j<4)
	{
		PixelGetColor, color, Ceil(Width*0.8958+i*0.104), Ceil(Height*0.1759+j*0.139) ;寻找你“4”技能图标位置
		arr[i,j]:=color	;8958,1759
		j++		
	}	
	i++
}
adj=0
Pause
;PixelGetColor, color, Ceil(Width*0.4412), Ceil(Height*0.9574) ;寻找你“4”技能图标位置
;scolor := SubStr(color, 3, 1) ;“4”技能位置没有图标的时候，颜色坐标第三个字符是1

}
return

;0x1D2628	0x1E282A	0x1E282A	0x1E282A
;0x192223	0x1E282A	0x1E282A	0x1E282A
;0x192223	0x1E282A	0x1E282A	0x1E282A
;0x192223 	0x1E282A	0x1E282A	0x1E282A