uses math;
var m,n,t,minx,miny:longint;
    f,dd:Array[0..1000,0..1000] of longint;
    x,y:array[0..1000] of longint;
procedure nhap;
var i:longint;
begin
 read(m,n);
 read(t);   minx:=601; miny:=601;
 for i:=1 to t do
  begin
   read(x[i],y[i]);
   minx:=min(minx,x[i]);
   miny:=min(miny,y[i]);
  end;
end;
function cal(u,v:longint):longint;
var tg,i:longint;
begin
 if dd[u,v]=1 then exit(F[u,v]);
 dd[u,v]:=1;
 for i:=1 to t do
  if (u=x[i]) and (v=y[i]) then
   begin
    f[u,v]:=0;
    exit(0);
   end;
 tg:=u*v;
 if (u<minx) or (v<miny) then
  begin
   f[u,v]:=tg;
   exit(tg);
  end;
 for i:=1 to u-1 do tg:=min(tg,cal(i,v)+cal(u-i,v));
 for i:=1 to v-1 do tg:=min(tg,cal(u,i)+cal(u,v-i));
 f[u,v]:=tg;
 exit(tg);
end;
begin
 assign(input,'marble.inp');reset(input);
 assign(output,'marble.out');rewrite(output);
 nhap;
 write(cal(m,n));
 close(input); close(output);
end.
