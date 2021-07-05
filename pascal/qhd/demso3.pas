{$H+}
uses math;
var  a,b:int64;
     n,m,d,kk:longint;
     st,st1:string;
     dd,dd1:array[0..20,0..1,0..20,0..20,0..1] of boolean;
     f,f1:array[0..20,0..1,0..20,0..20,0..1] of longint;
function cal(i,ok,j,check,p:longint):int64;
var okt,k,last,pp:longint;
begin
 if dd[i,ok,j,check,p] then exit(F[i,ok,j,check,p]);
 dd[i,ok,j,check,p]:=true;
 if i=n+1 then
  begin
   f[i,ok,j,check,p]:=1;
   exit(1);
  end;
 if ok=1 then last:=9 else last:=ord(st[i])-48;
 for k:=0 to last do
  begin
   if (ok=0) and (k=last) then okt:=0 else okt:=1;
   if (k=0) and (p=0) then pp:=0 else pp:=1;
   if (abs(k-j)<=d) or (p=0) then f[i,ok,j,check,p]:=f[i,ok,j,check,p]+cal(i+1,okt,k,check,pp);
   if check<kk then
    if (p<>0) and (abs(k-j)>d) then f[i,ok,j,check,p]:=f[i,ok,j,check,p]+cal(i+1,okt,k,check+1,pp);
  end;
 exit(f[i,ok,j,check,p]);
end;

function cal1(i,ok,j,check,p:longint):int64;
var okt,k,last,pp:longint;
begin
 if dd1[i,ok,j,check,p] then exit(F1[i,ok,j,check,p]);
 dd1[i,ok,j,check,p]:=true;
 if i=m+1 then
  begin
   f1[i,ok,j,check,p]:=1;
   exit(1);
  end;
 if ok=1 then last:=9 else last:=ord(st1[i])-48;
 for k:=0 to last do
  begin
   if (ok=0) and (k=last) then okt:=0 else okt:=1;
   if (k=0) and (p=0) then pp:=0 else pp:=1;
   if (k-j<=d) or (p=0) then f1[i,ok,j,check,p]:=f1[i,ok,j,check,p]+cal1(i+1,okt,k,check,pp);
   if check<kk then
    if (p<>0) and (k-j>d) then f1[i,ok,j,check,p]:=f1[i,ok,j,check,p]+cal1(i+1,okt,k,check+1,pp);
  end;
 exit(f1[i,ok,j,check,p]);
end;

procedure nhap;
begin
 read(a,b,d,kk);
 str(b,st);  n:=length(st);
 str(a-1,st1); m:=length(st1);
 write(cal(1,0,0,0,0)-cal1(1,0,0,0,0))
end;
begin
 assign(input,'demso.inp');reset(input);
 assign(output,'demso.out');rewrite(output);
 nhap;
 close(input); close(output);
end.