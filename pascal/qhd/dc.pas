{$H+}
uses math;
const base=1000000007;
var st:string;
    n:longint;
    f,g:array[0..5001,0..5001] of longint;
procedure nhap;
begin
 readln(n);
 readln(st);
end;
function check(x,y,l:longint):boolean;
var s,s1:string;
begin
 s:=copy(st,x-l-1,l);
 s1:=copy(st,y-l-1,l);
 if s<=s1 then exit(true);
 exit(true);
end;
procedure xuli;
var i,j,last:longint;
begin
 f[1,1]:=1;
 g[1,1]:=1;
 for i:=2 to n do
  begin
   for j:=1 to i-1 do
    begin
     last:=i-j;
     if st[i]<>'0' then
      begin
       f[i,j]:=g[last,j-1];
       if check(last,i,j) then f[i,j]:=(f[i,j]+f[last,j]) mod base;
      end;
     g[i,j]:=(g[i,j-1]+f[i,j]) mod base;
    end;
   f[i,i]:=1;
   g[i,i]:=(g[i,i-1]+f[i,i]) mod base;
  end;
 writeln(g[n,n]);
end;
begin
 assign(input,'dc.inp');reset(input);
 assign(output,'dc.out'); rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.