{$H+}
uses math;
var st:string;
    x,y,n,dem:longint;
    a,kq,res:array[0..5000000] of longint;
procedure nhap;
var i,tt,last:longint;
begin
 readln(N);
 readln(st);
 for i:=1 to n do
  begin
   if st[i]='L' then inc(a[1]);
   if st[i]='R' then inc(a[2]);
   if st[i]='D' then inc(a[3]);
   if st[i]='U' then inc(a[4]);
  end;
 readln(x,y);
 tt:=abs(x)+abs(y);
 if tt>n then
  begin
   write(-1);
   exit;
  end;
 if x>0 then
  begin
   if a[2]<x then
     begin
      write(-1);
      exit;
     end
   else
    begin
     for i:=1 to n do
     begin
      if st[i]='R' then
       begin
        inc(dem); kq[i]:=1;
       end;
      if dem=x then break;
     end;
    end;
  end;
 dem:=0;
 if x<0 then
  begin
   if a[1]<abs(x) then
     begin
      write(-1);
      exit;
     end
   else
    begin
     for i:=1 to n do
     begin
      if st[i]='L' then
       begin
        inc(dem); kq[i]:=1;
       end;
      if dem=abs(x) then break;
     end;
    end;
  end;

 dem:=0;
 if y<0 then
  begin
   if a[3]<abs(y) then
     begin
      write(-1);
      exit;
     end
   else
    begin
     for i:=1 to n do
     begin
      if st[i]='D' then
       begin
        inc(dem); kq[i]:=1;
       end;
      if dem=abs(y) then break;
     end;
    end;
  end;
 dem:=0;
 if y>0 then
  begin
   if a[4]<abs(y) then
     begin
      write(-1);
      exit;
     end
   else
    begin
     for i:=1 to n do
     begin
      if st[i]='U' then
       begin
        inc(dem); kq[i]:=1;
       end;
      if dem=abs(y) then break;
     end;
    end;
  end;
// last:=0;
 for i:=1 to n do
   if kq[i]=1 then
    begin
     if st[i]='L' then res[1]:=i;
     if st[i]='R' then res[3]:=i;
     if st[i]='D' then res[4]:=i;
     if st[i]='U' then res[2]:=i;
    end;
 for i:=1 to 4 do write(res[i],' ');
end;
begin
 assign(input,'robot.inp');reset(input);
 assign(output,'robot.out');rewrite(output);
 nhap;
 close(input);
 close(output);
end.