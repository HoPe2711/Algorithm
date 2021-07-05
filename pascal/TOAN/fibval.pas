function xuli(u,v:longint):longint;
var dodai:longint;
begin
 dodai:=v-u+1;
 u:=u mod 16;
 v:=v mod 16;
 if u=0 then u:=16;
 if v=0 then v:=16;
 if dodai>=32 then exit((dodai div 16)*16)
 else if dodai>=9 then exit(2)
  else if ((u<=8) and (v>=9)) or ((u>=9) and (v<=8)) then exit(2)
   else exit(-1);
end;
procedure nhap;
var i,k,u,v:longint;
begin
 read(k);
 for i:=1 to k do
  begin
   read(u,v);
   writeln(xuli(u,v));
  end;
end;
begin
 assign(input,'fibval.inp');reset(input);
 assign(output,'fibval.out');rewrite(output);
 nhap;
 close(input); close(output);
end.