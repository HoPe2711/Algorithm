{$H+}
var n,res:longint;
    st:string;
    a:array[0..2,0..10001] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(n);
 for i:=1 to 2 do
  begin
   readln(st);
   for j:=1 to n do a[i,j]:=ord(st[j])-48;
  end;
end;
procedure forward1;
begin
 if (a[1,2]=0) and (a[2,2]=0) then
   if (a[1,1]<>0) or (a[2,1]<>0) then
    begin
     a[1,1]:=0;
     a[2,1]:=0;
     inc(res);
    end;
 if (a[1,n-1]=0) and (a[2,n-1]=0) then
   if (a[1,n]<>0) or (a[2,n]<>0) then
    begin
     a[1,n]:=0;
     a[2,n]:=0;
     inc(res);
    end;
end;
procedure forward2;
var i:longint;
begin
 for i:=2 to n-1 do
 if (a[1,i-1]=a[1,i+1]) and (a[2,i-1]=a[2,i+1]) then
 if (a[1,i]<>a[1,i-1]) or (a[2,i]<>a[2,i-1]) then
  begin
   a[1,i]:=a[1,i-1];
   a[2,i]:=a[2,i-1];
   inc(res);
  end;
end;
procedure forward3;
var i:longint;
begin
 for i:=1 to n do
 begin
  if (a[1,i]=1) and (a[1,i+1]=0) then inc(res);
  if (a[2,i]=1) and (a[2,i+1]=0) then inc(Res);
 end;
 write(res);
end;
begin
 assign(input,'lamp.inp');reset(input);
 assign(output,'lamp.out');rewrite(output);
 nhap;
 forward1;
 forward2;
 forward3;
 close(input); close(output);
end.