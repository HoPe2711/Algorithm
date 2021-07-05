uses math;
var n,m,res:longint;
    st,st1:string;
    a,b,x,a1:array[0..400] of longint;
procedure nhap;
var i:longint;
begin
 readln(N,m);
 readln(st);
 readln(st1);
 for i:=1 to n do a[i]:=ord(st[i])-48;
 for i:=1 to n do b[i]:=ord(St1[i])-48;
end;
procedure check(p:longint);
var i,cnt,tg,tmp,k:longint;
begin
 cnt:=0;                     tmp:=0;
 a1:=a;
 for i:=1 to m-1 do cnt:=cnt+x[i];
 for i:=m to n do
  begin
   if (i+p-1) mod n<>0 then
   begin
    if a[i]<>b[(i+p-1) mod n] then x[i]:=1
    else x[i]:=0;
   end
   else
    if a[i]<>b[n] then x[i]:=1
    else x[i]:=0;
   if x[i]=1 then
    for k:=i to i+m-1 do
      if k mod n <>0 then a[k mod n]:=1-a[k mod n]
      else a[n]:=1-a[n];
   tmp:=tmp+x[i];
  end;
 for i:=1 to n do
 if (i+p-1) mod n <>0 then
 begin
  if b[(i+p-1) mod n]<>a[i] then
   begin
    a:=a1;
    exit;
   end
 end
 else if b[n]<>a[i] then
  begin
   a:=a1;
   exit;
  end;
 a:=a1;
 res:=min(Res,tmp+cnt);
end;
procedure duyet(i,p:longint);
var j,k:longint;
begin
 if i=m then check(p)
 else
  for j:=0 to 1 do
   begin
    x[i]:=j;
    if j=1 then
     for k:=i to i+m-1 do
      if k mod n <>0 then a[k mod n]:=1-a[k mod n]
      else a[n]:=1-a[n];
    duyet(i+1,p);
   { x[i]:=0; }
    if j=1 then
     for k:=i to i+m-1 do
      if k mod n <>0 then a[k mod n]:=1-a[k mod n]
      else a[n]:=1-a[n];
   end;
end;
procedure xuli;
var i:longint;
begin
 res:=500;
 for i:=1 to n do duyet(1,i);
 write(Res);
end;

begin
 assign(input,'latco.inp');reset(input);
 assign(output,'latco.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
