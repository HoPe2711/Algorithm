{$H+}
uses math;
var st:string;
    n,m:longint;
    a:array[0..1000000] of longint;
    f:array[0..1000000,-2..2,-2..2,-2..2,0..1] of longint;
procedure nhap;
var i:longint;
begin
 readln(n);
 readln(m);
 readln(st);
 for i:=1 to n do
 begin
  if st[i]='L' then a[i]:=-1
  else a[i]:=1;
 end;
end;
function check(x,y,z:longint):boolean;
begin
 if (x>=-2) and (x<=2) and (x-y<=2) and (x-z>=-2) and (x-y>=-2) and (x-z<=2) then exit(true);
 exit(false);
end;
procedure xuli;
var i,j,low,high,new,tt,tt1,res,ok:longint;
begin
 f[0,0,2,-2,0]:=1;
 for i:=0 to n-1 do
  for j:=-2 to 2 do
   for low:=-2 to 2 do
    for high:=-2 to 2 do
    for ok:=0 to 1 do
     if f[i,j,low,high,ok]<>0 then
     begin
     if ok=1 then
     begin
      new:=j+1;
      if i>0 then tt:=min(low,new) else tt:=new;
      if i>0 then tt1:=max(high,new) else tt1:=new;
      if (check(new,low,high)) or (i=0) then f[i+1,new,tt,tt1,ok]:=(f[i,j,low,high,ok]+f[i+1,new,tt,tt1,ok]) mod m;

      new:=j-1;
      if i>0 then tt:=min(low,new) else tt:=new;
      if i>0 then tt1:=max(high,new) else tt1:=new;
      if (check(new,low,high)) or (i=0) then f[i+1,new,tt,tt1,ok]:=(f[i,j,low,high,ok]+f[i+1,new,tt,tt1,ok]) mod m;
     end
     else
      begin
       if (a[i+1]=-1) then
        begin
         new:=j-1;
         if i>0 then tt:=min(low,new) else tt:=new;
         if i>0 then tt1:=max(high,new) else tt1:=new;
         if (check(new,low,high)) or (i=0) then f[i+1,new,tt,tt1,ok]:=(f[i,j,low,high,ok]+f[i+1,new,tt,tt1,ok]) mod m;
        end
       else
        begin
          new:=j+1;
          if i>0 then tt:=min(low,new) else tt:=new;
          if i>0 then tt1:=max(high,new) else tt1:=new;
          if (check(new,low,high)) or (i=0) then f[i+1,new,tt,tt1,ok]:=(f[i,j,low,high,ok]+f[i+1,new,tt,tt1,ok]) mod m;

          new:=j-1;
          if i>0 then tt:=min(low,new) else tt:=new;
          if i>0 then tt1:=max(high,new) else tt1:=new;
          if (check(new,low,high)) or (i=0) then f[i+1,new,tt,tt1,1]:=(f[i,j,low,high,ok]+f[i+1,new,tt,tt1,1]) mod m;
        end;
      end;
     end;


 res:=0;
 for j:=-2 to 2 do
  for low:=-2 to 2 do
   for high:=-2 to 2 do
    for ok:=0 to 1 do res:=(res+f[n,j,low,high,ok]) mod m;
 write(Res);
end;
begin
 assign(input,'balstr.inp');reset(input);
 assign(output,'balstr.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
