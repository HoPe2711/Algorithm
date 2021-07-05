uses math;
var n,top,k:longint;
    a,s,f:array[1..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
Function Find(x:longint):longint;
Var
  l,r,mid,kq:longint;
  Begin
    kq:=top;
    l:=1;
    r:=top;
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
procedure xuli;
var i:longint;
begin
 top:=1;
 s[1]:=a[1];
 for i:=2 to n do
  if a[i]<s[top] then
   begin
    inc(top);
    s[top]:=a[i];
   end
  else s[find(a[i])]:=a[i];
 write(top);
end;
BEGIN
  assign(input,'daytang.inp');reset(input);
  assign(output,'daytang.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
