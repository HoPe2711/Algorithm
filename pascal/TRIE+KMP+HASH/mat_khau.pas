{$H+}
uses math;
var n,m,cnt,tt,res:longint;
    st:String;
    next:array[0..300000,'a'..'z'] of longint;
    c2:array[0..300000] of boolean;
    f:Array[0..300000] of longint;
    s:Array[0..300] of string;
procedure add(s:String);
var i,u:longint;
begin
 u:=1;
 for i:=1 to length(s) do
  begin
   if next[u,s[i]]=0 then
    begin
     inc(cnt);
     next[u,s[i]]:=cnt;
    end;
   u:=next[u,s[i]];
  end;
 c2[u]:=true;
end;
procedure find(a,b:longint);
var i,u,j:longint;
begin
 if b>n then b:=n; u:=1;
 for i:=a to b do
  begin
   if next[u,st[i]]=0 then
    begin
     for j:=i to b do f[j]:=max(f[j],f[i-1]);
     exit;
    end;
   u:=next[u,st[i]];
   if c2[u] then f[i]:=max(f[i],f[a-1]+i-a+1);
  end;
end;
procedure nhap;
var i:longint;
begin
  readln(n,m);
  readln(st);
  cnt:=1;
  for i:=1 to m do
   begin
    readln(s[i]);
    add(s[i]);
    tt:=max(tt,length(s[i]));
   end;
end;
procedure xuli;
var i:longint;
begin
 for i:=0 to n do find(i+1,i+tt);
 res:=1000000000;
 for i:=1 to n do res:=min(res,n-f[i]);
 write(res);
end;
begin
 assign(input,'mat_khau.inp');reset(input);
 assign(output,'mat_khau.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.