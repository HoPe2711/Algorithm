uses math;
var n,k,t,h:longint;
    free,vt,f,g,val:Array[0..2000000] of longint;
procedure nhap;
var res,i,dot:longint;
begin
 read(n,k);
 for i:=1 to 1000000 do
  begin
   free[i]:=0;
   f[i]:=0; g[i]:=0;
  end;
 dot:=0;
 for i:=1 to n do
  begin
   read(vt[i]);
   dot:=max(dot,vt[i]);
  end;
 for i:=1 to n do read(val[i]);
 for i:=1 to n do
  if free[vt[i]]=0 then free[vt[i]]:=i
  else if val[i]>val[free[vt[i]]] then free[vt[i]]:=i;
 f[0]:=0; g[0]:=0;
 for i:=1 to dot do
 if free[i]<>0 then
  begin
   f[i]:=g[max(0,i-k)]+val[free[i]];
   g[i]:=max(g[i-1],f[i]);
  end
 else g[i]:=g[i-1];
 res:=0;
 for i:=1 to n do res:=max(res,f[vt[i]]);
 writeln(res)
end;
begin
 assign(input,'radars.inp');reset(input);
 assign(output,'radars.out');rewrite(output);
 read(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.