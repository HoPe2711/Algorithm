{$H+}
uses math;
var  st:string;
     l,tt,res,cnt,n:longint;
     next:array[0..500000,#0..#255] of longint;
     c2:Array[0..500000] of boolean;
     s:array[0..100] of string;
procedure add(S:String);
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
function find(s:string):boolean;
var i,u:longint;
begin
 u:=1;
 for i:=1 to length(S) do
  begin
   if next[u,s[i]]=0 then exit(false);
   u:=next[u,s[i]];
  end;
 exit(c2[u]);
end;
procedure nhap;
var i:longint;
begin
 readln(st);
 l:=length(st);
 cnt:=1;
 readln(n);
 for i:=1 to n do
  begin
   readln(s[i]);
   add(s[i]);
   tt:=max(tt,length(s[i]));
  end;
end;
function check(x,y:longint):boolean;
var stt:String;
begin
 stt:=copy(st,x,y);
 if find(stt) then exit(true);
 exit(false);
end;
procedure xuli;
var i,j:longint;
begin
  for i:=0 to l do
   for j:=1 to tt do
    if i+j<=l then
     if check(i+1,j) then inc(res);
  write(res);
end;
begin
 assign(input,'find_patterns.inp');reset(input);
 assign(output,'find_patterns.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.