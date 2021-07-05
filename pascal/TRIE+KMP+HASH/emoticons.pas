var
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
procedure nhap;
var
begin
 readln(n,m);
 for i:=1 to n do
  begin
   readln(st);
   add(st);
  end;
end;
procedure xuli;
var
begin
 pack;
 for i:=1 to m do
  begin
   readln(st);

  end;
end;
begin
 assign(input,'emoticons.inp');reset(input);
 assign(output,'emoticons.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
