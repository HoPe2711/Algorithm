uses math;
var n,res,kq:qword;
    l1,sum,p,time,tt:longint;
    f:Array[1..20,0..1,0..171,0..1,0..171] of qword;
    dd:Array[1..20,0..1,0..171,0..1,0..171] of longint;
    a:array[1..20] of longint;
    st:string;
function col(i,ok,s,xh,p:longint):qword;
var j,okt,last,xht,pt:longint;
    ff:qword;
begin
  if s > sum then exit(0);
 if dd[i,ok,s,xh,p] = time then exit(f[i,ok,s,xh,p]);
 dd[i,ok,s,xh,p]:=time;
 ff := 0;
 if i=l1+1 then
  begin
   if (p =0) and (s=sum) then ff:=1;
  end
 else
 if s = sum then ff := 1
 else
 begin
    if ok=0 then last:=a[i]
    else last:=9;
    for j:=0 to last do
      begin
        if (ok=0) and (j=a[i]) then okt:=0
          else okt:=1;
        if (xh=0) and (j=0) then xht:=0
          else xht:=1;
        if xht=1 then ff:=ff+col(i+1,okt,s+j,xht,p*j mod sum)
        else ff:=ff+col(i+1,okt,s+j,xht,1);
      end;
  end;
 f[i,ok,s,xh,p] := ff;
 exit(ff);
end;
procedure xuli;
var l,r,mid:qword;
    i:longint;
begin
 l := 1; r:=high(longint);
 while l <= r do
  Begin
   mid:=(l+r) div 2;
   res:=0;
   st:='';
   str(mid,st);
   l1:=length(st);
   for i:=1 to l1 do a[i]:=ord(st[i])-48;
   for sum:=1 to 9*l1 do
     begin
      inc(time);
      res:=res+col(1,0,0,0,1);
     end;
   if res>=n then
    begin
     if res=n then kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
end;
BEGIn
  assign(input,'pds.inp');reset(input);
  assign(output,'pds.out');rewrite(output);
  read(n);
  xuli;
  writeln(kq);
  close(input);close(output);
END.
