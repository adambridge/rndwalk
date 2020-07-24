  10 MODE 2
  20 x0 = 650
  30 y0 = 500
  40 r_max = SQR(x0^2 + y0^2)
  50 x = x0
  60 y = y0
  70 scale = 100
  80 c_rst = 0.3
  90 c_col = 10
  95 t_max = 10000
  100 DIM colmap(6)
  110 PROCinitcols
  120 MOVE x0,y0
  130 FOR t=0 TO t_max
  140   x = FNnewpos(x,x0)
  150   y = FNnewpos(y,y0)
  160   GCOL 1,FNcol
  170   DRAW x,y
  180 NEXT t
  190 END
  200 
  210 DEF PROCinitcols
  220 FOR i=1 TO 6
  230   READ colmap(i)
  240 NEXT i
  250 DATA 1,3,2,6,4,5
  260 ENDPROC
  270 
  280 DEF FNnewpos(old,max)
  290 LOCAL rnd,rst,dpos
  300 rnd = (RND(1) - 0.5) * 2
  310 rst = c_rst * (max - old) / max
  320 dpos = scale * (rnd + rst)
  330 = old + dpos
  340 
  350 DEF FNcol
  360 LOCAL r,col_ind
  370 r = SQR((x-x0)^2 + (y-y0)^2)
  380 col_ind = 1 + c_col * r/r_max
  390 IF col_ind > 6 THEN col_ind = 6
  400 = colmap(col_ind)
