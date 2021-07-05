{$H+}
uses math;
type node=record
     t,d1:int64;
end;
var st:string;
    n,tt,amax:longint;
    res:int64;
    d:array[0..200000] of longint;
    c:array[0..200000] of char;
    a:array[0..200000] of node;
    trc1:array['a'..'z'] of longint;
    dd:Array['a'..'z','a'..'z'] of longint;
    trc,trc2:array[0..100000,'a'..'z','a'..'z'] of longint;
procedure nhap;
var i:longint;
    last:char;
begin
 readln(st);
 n:=length(st);
 last:='0';
 for i:=1 to n do
  if st[i]<>last then
   begin
    inc(tt);
    d[tt]:=1;
    c[tt]:=st[i];
    last:=st[i];
   end
  else inc(d[tt]);
end;

procedure doicho(var x,y:node);
var
 tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid,p:longint;
begin
        i:=l;
        j:=r;
        p:=l+random(r-l+1);
        mid:=a[p].t;
        repeat
         while (a[i].t>mid) do inc(i);
         while (a[j].t<mid) do dec(j);
         if i<=j then
          begin
           doicho(a[i],a[j]);
           inc(i);
           dec(j);
          end;
        until i>j;
        if l<j then qsort(l,j);
        if i<r then qsort(i,r);
end;

procedure xuli;
var i,dem:longint;  ch,ch1:char;
begin
 for i:=1 to tt do
 if d[i]>=trc1[c[i]] then
  begin
   res:=res+d[i]-trc1[c[i]];
   trc1[c[i]]:=d[i];
  end;
 for i:=1 to tt-1 do
  begin
   inc(dd[c[i],c[i+1]]);
   trc[dd[c[i],c[i+1]],c[i],c[i+1]]:=d[i];
   trc2[dd[c[i],c[i+1]],c[i],c[i+1]]:=d[i+1];
  end;
 for ch:='a' to 'z' do
  for ch1:='a' to 'z' do
   if dd[ch,ch1]<>0 then
   begin
    dem:=0;
    for i:=1 to dd[ch,ch1] do
     begin
      inc(dem);
      a[dem].t:=trc[i,ch,ch1];
      a[dem].d1:=trc2[i,ch,ch1];
     end;
    qsort(1,dem);
    res:=res+a[1].t*a[1].d1;
    amax:=a[1].d1;
    for i:=2 to dd[ch,ch1] do
     if (a[i].d1>amax) then
      begin
       res:=res+a[i].t*(a[i].d1-amax);
       amax:=max(amax,a[i].d1);
      end;
   end;
 write(res);
end;
begin
 assign(input,'specstr.inp');reset(input);
 assign(output,'specstr.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.