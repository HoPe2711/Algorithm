var st:string;
    l,y:longint;
    n:int64;
    a:array[1..16] of longint;
    prime:array[0..200] of boolean;
    dd:array[1..17,0..200,0..1] of boolean;
    f:array[1..17,0..200,0..1] of int64;
procedure nhap;
var i:longint;
begin
 readln(st);
 l:=length(st);
 for i:=1 to l do a[i]:=ord(st[i])-48;
 val(st,n,y);
end;
procedure nguyento;
 var i:longint;
     j:int64;
 begin
  fillchar(prime,sizeof(prime),true);
  prime[0]:=false;
  prime[1]:=false;
  for i:=2 to trunc(sqrt(200)) do
   if prime[i] then
    begin
     j:=i*i;
     while j<=200 do
      begin
       prime[j]:=false;
       j:=j+i;
      end;
    end;
 end;
function col(i,s,ok:longint):int64;
var j,last,okt:longint;
begin
 if dd[i,s,ok] then exit(f[i,s,ok]);
 dd[i,s,ok]:=true;
 if i=l+1 then
  begin
   if prime[s] then f[i,s,ok]:=1;
   exit(f[i,s,ok]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
   begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    f[i,s,ok]:=f[i,s,ok]+col(i+1,s+j,okt) ;
   end;
 exit(f[i,s,ok]);
end;
BEGIN
  assign(input,'bai1.inp');reset(input);
  assign(output,'bai1.out');rewrite(output);
  nhap;
  nguyento;
  write(col(1,0,0));
  close(input);close(output);
END.