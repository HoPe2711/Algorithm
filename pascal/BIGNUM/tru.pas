{$H+}
var st1,st2:string;
function sosanh(a,b:string):longint;
begin
 while length(a)<length(b) do a:='0'+a;
 while length(b)<length(a) do b:='0'+b;
 if a=b then exit(0);
 if a>b then exit(1);
 exit(-1);
end;
procedure nhap;
begin
 readln(st1);
 readln(st2);
end;
function tru(a,b:string):string;
var c:string;
    hieu,nho,i:longint;
begin
 nho:=0;
 c:='';
 while length(a)<length(b) do a:='0'+a;
 while length(b)<length(a) do b:='0'+b;
 for i:=length(a) downto 1 do
  begin
   hieu:=ord(a[i])-ord(b[i])-nho;
   if hieu<0 then
    begin
     hieu:=hieu+10;
     nho:=1;
    end
   else nho:=0;
   c:=chr(hieu+48)+c;
  end;
  while (length(c)>1) and (c[1]='0') do delete(c,1,1);
  exit(c);
end;
begin
  assign(input,'tru.inp');reset(input);
  assign(output,'tru.out');rewrite(output);
  nhap;
  if sosanh(st1,st2)=1 then write(tru(st1,st2))
  else if sosanh(st1,st2)=0 then write(0)
  else
   begin
    write('-');
    write(tru(st2,st1));
   end;
  close(input);close(output);
end.
