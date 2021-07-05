var st:string;
    cnt,x:longint;
    c,c2:array[0..200001] of longint;
    next:array[0..200001,'a'..'z'] of longint;
procedure add(s:string);
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
  inc(c[u]);
 end;
 inc(c2[u]);
end;
function get(s:string):longint;
var i,u:longint;
begin
 u:=1;
 for i:=1 to length(s) do
  begin
   if next[u,s[i]]=0 then exit(0);
   u:=next[u,s[i]];
  end;
 exit(c2[u]);
end;
function find(s:string):longint;
var i,u,kq:longint;
begin
 kq:=0;
 u:=1;
 for i:=1 to length(s) do
  begin
   if (next[u,s[i]]=0) or (c[next[u,s[i]]]=0) then exit(kq);
   u:=next[u,s[i]];
   if c[u]>0 then kq:=i;
  end;
 exit(kq);
end;
procedure del(s:string);
var i,u:longint;
begin
 u:=1;
 for i:=1 to length(s) do
  begin
   u:=next[u,s[i]];
   dec(c[u]);
  end;
 dec(c2[u]);
end;
procedure nhap;
var x,y:longint;
begin
 cnt:=1;
 while not seekeof do
  begin
   readln(st);
   val(st[1],x,y);
   delete(st,1,2);
   if x=0 then add(st);
   if x=1 then del(st);
   if x=2 then writeln(get(st));
   if x=3 then writeln(find(st));
  end;
end;
begin
 assign(input,'trie.inp');reset(input);
 assign(output,'trie.out');rewrite(output);
 nhap;
 close(input);
 close(output);
end.
