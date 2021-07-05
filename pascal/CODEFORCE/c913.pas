uses math;
const oo=high(int64);
var n,l:longint;   res:int64;
    c,free:Array[0..50] of longint;
procedure nhap;
var i:longint;
begin
 read(n,l);
 for i:=1 to n do read(c[i]);
end;
procedure xuli;
var i,j:longint;  tg,tmp,kq,pp:int64;
begin
 res:=oo;
 for i:=n downto 1 do
 begin
  tmp:=1;
  for j:=i+1 to n do
   begin
    tmp:=tmp*2;
    if tmp<c[j]/c[i] then free[j]:=1;
   end;
 end;
 kq:=l;       tg:=0;
 for i:=n downto 1 do
 if free[i]=0 then
  begin
   tmp:=kq div (2**(i-1));
   if kq mod (2**(i-1))=0 then pp:=0 else pp:=1;
   res:=min(res,(tmp+pp)*c[i]+tg);
   kq:=kq-tmp*(2**(i-1));
   if kq=0 then break;
   tg:=tg+tmp*c[i];
  end;
 write(reS);
end;
begin
 //assign(input,'c913.inp'); reset(input);
 //assign(output,'c913.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(outpUT);
end.