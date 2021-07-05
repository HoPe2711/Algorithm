uses math;
const oo=100;
var n,m,res,tt:longint;
    a,tp,p,p1,x:array[0..5000] of longint;
    free:Array[0..100,0..100] of longint;
    st:String;
procedure nhap;
var u,v,i:longint;
begin
 readln(n);
 readln(St);
 for i:=1 to n do
  if st[i]='R' then a[i]:=1 else
  if st[i]='G' then a[i]:=2 else
  a[i]:=3;
 readln(m);
 for i:=1 to m do
  begin
   readln(u,v);
   free[u,v]:=1;
  end;
 res:=oo;
end;

procedure xuli;
var i,dem,dem1,j:longint;
begin
 dem:=0; dem1:=0;
 for i:=1 to 3 do tp[i]:=0;
 for i:=1 to n do
  if x[i]=1 then
   begin
    inC(Dem);
    p[dem]:=i;
    if tp[a[i]]=2 then exit;
    tp[a[i]]:=1;
   end
  else
  if x[i]=2 then
   begin
    inc(dem1);
    p1[dem1]:=i;
    if tp[a[i]]=1 then exit;
    tp[a[i]]:=2;
   end;
 for i:=1 to dem-1 do
  for j:=i+1 to dem do
   if free[p[i],p[j]]=1 then exit;
 for i:=1 to dem1-1 do
  for j:=i+1 to dem1 do
   if free[p1[i],p1[j]]=1 then exit;
 res:=min(res,tt);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if tt>res then exit;
 if i=n+1 then xuli
 else
  for j:=0 to 2 do
   begin
    x[i]:=j;
    if x[i]=0 then inc(tt);
    duyet(i+1);
    if x[i]=0 then dec(tt);
   end;
end;
begin
 assign(input,'voi.inp');reset(input);
 assign(output,'voi.out');rewrite(output);
 nhap;
 duyet(1);
 write(Res);
 close(input); close(output);
end.
