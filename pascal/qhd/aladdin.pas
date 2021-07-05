var a,kq:array[0..201,0..201] of longint;
    n:longint;
    ok:boolean;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   for j:=1 to n-1 do read(a[i,j]);
  end;
end;
function check(i:longint):boolean;
var j:longint;
begin
 for j:=2 to i-1 do
  begin
   kq[j,i]:=a[j-1,i-1]-kq[j-1,i]-kq[j,i-1]-kq[j-1,i-1];
   if (kq[j,i]<>0) and (kq[j,i]<>1) then exit(false);
  end;
 exit(true);
end;
function check1(i:longint):boolean;
var j:longint;
begin
 for j:=2 to i do
  begin
   kq[i,j]:=a[i-1,j-1]-kq[i-1,j]-kq[i,j-1]-kq[i-1,j-1];
   if (kq[i,j]<>0) and (kq[i,j]<>1) then exit(false);
  end;
 exit(true);
end;
procedure inkq;
var i,j:longint;
begin
 ok:=true;
 for i:=1 to n do
  begin
   for j:=1 to n do write(kq[i,j],' ');
   writeln;
  end;
end;
procedure duyet(i,k:longint);
begin
 if ok=true then exit;
 if (i=n+1) and (k=1) then inkq
 else
  begin
  if k=1 then
       begin
        kq[1,i]:=0;
        if check(i) then duyet(i,2);
        if ok=true then exit;
        kq[1,i]:=1;
        if check(i) then duyet(i,2);
        if ok=true then exit;
       end
  else
   begin
     kq[i,1]:=0;
     if check1(i) then duyet(i+1,1);
     if ok=true then exit;
     kq[i,1]:=1;
     if check1(i) then duyet(i+1,1);
     if ok=true then exit;
   end;
  end;
end;
procedure xuli;
var j:longint;
begin
 for j:=0 to 1 do
  begin
   kq[1,1]:=j;
   duyet(2,1);
   if ok=true then exit;
  end;
 write('No solution');
end;
begin
 nhap;
 xuli;
end.