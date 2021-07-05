{$H+}
uses math;
const base=1337377;
VAR  st:string;
     l,tt,cnt,n:longint;
     next:array[0..300000,'a'..'z'] of longint;
     c2:Array[0..300000] of boolean;
     s:array[0..4000] of string;
     f:Array[0..300000] of longint;
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
var i,u:longint;
begin
 if b>l then b:=l;
 u:=1;
 for i:=a to b do
  begin
   if next[u,st[i]]=0 then exit;
   u:=next[u,st[i]];
   if c2[u] then f[i]:=(f[i]+f[a-1]) mod base;
  end;
end;
PROCEDURE nhap;
var i:longint;
begin
 readln(st);  l:=length(st);
 cnt:=1;
 readln(n);
 for i:=1 to n do
  begin
   readln(s[i]);
   add(s[i]);
   tt:=max(tt,length(s[i]));
  end;
end;
procedure xuli;
var i,j:longint;
begin
 f[0]:=1;
 for i:=0 to l do find(i+1,i+tt);
 write(f[l]);
end;
begin
 assign(input,'tach_tu.inp');reset(input);
 assign(output,'tach_tu.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.