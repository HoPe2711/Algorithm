{$H+}
var st,st1:string;
    stackl,stackr:array[1..300000] of char;
    topl,l,l1,topr,tt:longint;
procedure nhap;
begin
 readln(st);
 l:=length(st);
 readln(st1);
 l1:=length(st1);
end;
procedure tangl(x:char);
var tg:string;
    i:longint;
begin
 tg:='';
 inc(topl);
 stackl[topl]:=x;
 if topl>=l then
  for i:=topl-l+1 to topl do tg:=tg+stackl[i];
 if tg=st then
  begin
   topl:=topl-l;
   tt:=1-tt;
  end;
end;
procedure tangr(x:char);
var tg:string;
    i:longint;
begin
 tg:='';
 inc(topr);
 stackr[topr]:=x;
 if topr>=l then
  for i:=topr downto topr-l+1 do tg:=tg+stackr[i];
 if tg=st then
  begin
   topr:=topr-l;
   tt:=1-tt;
  end;
end;
procedure xuli;
var h,r,i:longint;
begin
 h:=1;
 r:=l1;
 while h<=r do
  if tt=0 then
   begin
    tangl(st1[h]);
    inc(h);
   end
  else
  begin
   tangr(st1[r]);
   dec(r);
  end;
 for i:=topr downto 1 do tangl(stackr[i]);
 for i:=1 to topl do write(stackl[i]);
end;
BEGIN
  assign(input,'letter.inp');reset(input);
  assign(output,'letter.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
