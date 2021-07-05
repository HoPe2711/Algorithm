var h,t,n:longint;
    res:boolean;
    f1,f2,a:array[0..501,0..501] of longint;
    f,dd:array[0..501,0..501] of boolean;
procedure nhap;
var i,j:longint;
begin
 fillchar(dd,sizeof(dd),false);
 fillchar(f1,sizeof(f1),0);
 fillchar(f2,sizeof(f2),0);
 read(n);
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(a[i,j]);
    f1[i,j]:=f1[i-1,j]+a[i,j];
    f2[i,j]:=f2[i,j-1]+a[i,j];
   end;
end;
function cal(i,j:longint):boolean;
begin
 if (i=0) or (j=0) then exit(false);
 if dd[i,j] then exit(f[i,j]);
 dd[i,j]:=true;
 cal:=false;
 if f1[i,j] mod 2=0 then
  if cal(i,j-1)=false then cal:=true;
 if f2[i,j] mod 2=0 then
  if cal(i-1,j)=false then cal:=true;
 f[i,j]:=cal;
end;
procedure xuli;
begin
 res:=cal(n,n);
 if res=true then writeln('YES')
 else writeln('NO');
end;
begin
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
end.
