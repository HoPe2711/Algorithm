var t,tong,l,l1,q:longint;
    n,k:int64;
    a,b,kq:array[0..19] of longint;
    f:array[0..20,0..171,0..1,0..2,0..20] of int64;
    dd:array[0..20,0..171,0..1,0..2,0..20] of boolean;
    dd1,d:array[0..20,0..171,0..2] of boolean;
    f1,ff:array[0..20,0..171,0..2] of int64;
function cal(i,sum,ok,ss,le:longint):int64;
var first,last,j,okt,sst,let:longint;
begin
 if dd[i,sum,ok,ss,le] then exit(f[i,sum,ok,ss,le]);
 dd[i,sum,ok,ss,le]:=true;
 if i=l+1 then
 if (sum<tong) or ((sum=tong) and (ss<>2)) then
  begin
    f[i,sum,ok,ss,le]:=1;
    exit(1);
  end
 else
  begin
   f[i,sum,ok,ss,le]:=0;
   exit(0);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
  begin
   if (j=a[i]) and (ok=0) then okt:=0 else okt:=1;
   if le=0 then
    begin
     if j=0 then
      begin
       sst:=0; let:=0;
      end
     else
      begin
       let:=le+1;
       if j>b[let] then sst:=2;
       if j=b[let] then sst:=0;
       if j<b[let] then sst:=1;
      end;
    end
   else
   if ss=0 then
    begin
      let:=le+1;
      if j>b[let] then sst:=2;
      if j=b[let] then sst:=0;
      if j<b[let] then sst:=1;
    end
   else sst:=ss;
   f[i,sum,ok,ss,le]:=f[i,sum,ok,ss,le]+cal(i+1,sum+j,okt,sst,let);
  end;
 exit(f[i,sum,ok,ss,le]);
end;

function call(i,sum,ok:longint):int64;
var j,okt,first:longint;
begin
 if d[i,sum,ok] then exit(ff[i,sum,ok]);
 d[i,sum,ok]:=true;
 if (i=l) and (ok=2) then
  if sum=tong then
   begin
    ff[i,sum,ok]:=1;
    exit(1);
   end
  else
   begin
    ff[i,sum,ok]:=0;
    exit(0)
   end;
 if (i=l+1)   then
 if (sum=tong) and (ok<>2) then
  begin
   ff[i,sum,ok]:=1;
   exit(1);
  end
 else
  begin
   ff[i,sum,ok]:=0;
   exit(0);
  end;
 if tong=sum then ff[i,sum,ok]:=1;
 if ok=2 then
 begin
  for j:=0 to 9 do ff[i,sum,ok]:=ff[i,sum,ok]+call(i+1,sum+j,ok);
 end;
 if i=1 then first:=1 else first:=0;
 for j:=first to 9 do
  if ok<>2 then
   begin
    if (ok=0) then
    if (j=a[i]) then okt:=0 else if j<a[i] then okt:=1 else okt:=2;
    if ok=1 then okt:=1;
    ff[i,sum,ok]:=ff[i,sum,ok]+call(i+1,sum+j,okt);
   end;
 exit(ff[i,sum,ok]);
end;

procedure trace;
var i,j,ok,t,last,okt:longint;    ss:int64;
begin
 fillchar(dd1,sizeof(dd1),false);
 fillchar(f1,sizeof(f1),0);
 f1[0,0,0]:=1;
 for i:=0 to l-1 do
  for j:=0 to 9*l do
   for ok:=0 to 1 do
   if f1[i,j,ok]<>0 then
    begin
     if ok=0 then last:=a[i+1] else last:=9;
     for t:=0 to last do
      begin
       if (ok=0) and (t=last) then okt:=0 else okt:=1;
       f1[i+1,j+t,okt]:=f1[i+1,j+t,okt]+f1[i,j,ok];
      end;
    end;
 ss:=0;
 for j:=1 to 9*l do
  begin
   ss:=f1[l,j,0]+f1[l,j,1];
   if ss>=k then
    begin
     tong:=j;
     break;
    end
   else dec(k,ss);
  end;
 fillchar(d,sizeof(d),false);
 fillchar(ff,sizeof(ff),0);
 call(1,0,0);
end;


procedure nhap;
var  i,j,t,s,ok,okt,hh:longint; st:string;   okk:boolean;
begin
 read(q);
 for i:=1 to q do
  begin
   read(t,n,k);
   str(n,st);
   l:=length(st);
   for j:=1 to l do a[j]:=ord(st[j])-48;
   if t=1 then
    begin
     for j:=1 to l do kq[j]:=-1;
     trace;                 s:=0;   ok:=0;
     for j:=1 to l do
     if k<>0 then
     begin
      if (s=tong) then
      if k>1 then dec(k)
      else
       begin
        ok:=2; break;
       end;
      for t:=0 to 9 do
      begin
       if ok=0 then
        begin
         if a[j]>t then okt:=1;
         if a[j]=t then okt:=0;
         if a[j]<t then okt:=2;
        end;
       if ok=1 then okt:=1;
       if ok=2 then okt:=2;
       if ff[j+1,s+t,okt]>=k then
        begin
         kq[j]:=t;
         ok:=okt;
         s:=s+t;
         break;
        end
       else dec(k,ff[j+1,s+t,okt]);
      end;
     end;
     if (k<>0) and (ok<>2) then
      begin
       for j:=1 to l do
        if kq[j]<>-1 then hh:=j;
        inc(hh);
        while k>0 do
         begin
          kq[hh]:=0;
          inc(hh);
          dec(k);
         end;
      end;
     okk:=false;
     for j:=1 to l do
     begin
      if kq[j]<>0 then okk:=true;
      if (kq[j]<>-1) and (okk=true) then  write(kq[j]);
     end;
     writeln;
    end
   else
    begin
    fillchar(dd,sizeof(dd),false);
    fillchar(f,sizeof(F),0);
    str(k,st);
    l1:=length(st);
    tong:=0;
    for j:=1 to l do b[j]:=-1;
    for j:=1 to l1 do
     begin
      b[j]:=ord(St [j])-48;
      tong:=tong+b[j];
     end;
     writeln(cal(1,0,0,0,0)-1);
    end;
  end;
end;


begin
 assign(input,'vo17bach.inp');reset(input);
 assign(output,'vo17bach.out');rewrite(output);
 nhap;
 close(input); close(output);
end.