uses math;
const base=1000000007;
var lab:Array[0..200000] of longint;
    sum,tt,dd,dd1:Array[0..200000] of int64;
    res,tg:int64;
    n,dem:longint;
function getrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=getrout(lab[u]);
 exit(lab[u]);
end;
procedure nhap;
var i,u,v,p,q:longint; ch,ch1:char;
begin
 readln(n);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to n-1 do
  begin
   read(u,v);
   readln(ch1,ch);
   if ch='b' then
    begin
     p:=getrout(u); q:=getrout(v);
     if p<>q then
     lab[lab[u]]:=lab[v];
    end;
  end;
 for i:=1 to n do inc(dd[getrout(i)]);
 for i:=1 to n do
  if dd[i]<>0 then
   begin
    inc(Dem);
    dd1[dem]:=dd[i];
   end;
 dd:=dd1;
 for i:=dem downto 1 do sum[i]:=(sum[i+1]+dd[i]) mod base;
 for i:=dem downto 1 do tt[i]:=(dd[i]*sum[i+1] mod base+tt[i+1]) mod base;
 for i:=dem-2 downto 1 do res:=(res+dd[i]*tt[i+1] mod base) mod base;
 write(Res);
end;
begin
 assign(input,'treecolor.inp');reset(input);
 assign(output,'treecolor.out');rewrite(output);
 nhap;
 close(input); close(output);
end.