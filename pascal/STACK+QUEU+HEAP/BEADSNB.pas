uses math;
var n,top1,top2:longint;
    res:int64;
    a,s,s1:array[1..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
Function Find1(x:longint):longint;
Var
  l,r,mid,kq:longint;
  Begin
    kq:=top1;
    l:=1;
    r:=top1;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if s[mid]=x then exit(mid);
      if s[mid]>x  then
       begin
        kq:=min(kq,mid);
        r:=mid-1;
       end
      else l:=mid+1;
    End;
    exit(kq);
  End;
procedure xuli1(i:longint);
var j:longint;
begin
 fillchar(s,sizeof(s),0);
 top1:=1;
 s[1]:=a[i];
 for j:=i+1 to n do
  if (a[j]>s[top1]) then
   begin
    inc(top1);
    s[top1]:=a[j];
   end
  else
  if a[j]>s[1] then s[find1(a[j])]:=a[j];
end;
Function Find2(x:longint):longint;
Var
  l,r,mid,kq:longint;
  Begin
    kq:=top2;
    l:=1;
    r:=top2;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if s1[mid]=x then exit(mid);
      if s1[mid]<x  then
       begin
        kq:=min(kq,mid);
        r:=mid-1;
       end
      else l:=mid+1;
    End;
    exit(kq);
  End;
procedure xuli2(i:longint);
var j:longint;
begin
 fillchar(s1,sizeof(s1),0);
 top2:=1;
 s1[1]:=a[i];
 for j:=i+1 to n do
  if a[j]<s1[top2] then
   begin
    inc(top2);
    s1[top2]:=a[j];
   end
  else
  if a[j]<s1[1] then s1[find2(a[j])]:=a[j];
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  begin
   xuli1(i);
   xuli2(i);
   res:=max(res,top1+top2-1);
  end;
 write(res);
end;
begin
 nhap;
 xuli;
end.
