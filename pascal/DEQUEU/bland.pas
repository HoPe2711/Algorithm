uses math;
const oo=maxlongint div 2;
VAR queu,queu1,hmax,hmin,pp:array[0..1000] of longint;
    m,n,k,f,r,f1,r1:longint;
    a,twohang,twocot:array[0..300,0..300] of longint;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
procedure push1(x:longint);
begin
 inc(r1);
 queu1[r1]:=x;
end;
PROCEDURE NHAP;
VAR i,j:longint;
BEGIN
 read(m,n,k);
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
END;


function hang:longint;
var i,j,last,t:longint;
begin
 hang:=0;
 for i:=1 to m do pp[i]:=0;
 for i:=1 to m do
  begin
   for j:=1 to n do
    begin
     hmax[j]:=-oo; hmin[j]:=oo;
    end;
   for j:=i to m do
    begin
     f:=1; f1:=1; r:=0; r1:=0;  last:=1;
     for t:=1 to n do
      begin
       hmax[t]:=max(hmax[t],a[j,t]);
       hmin[t]:=min(hmin[t],a[j,t]);
      end;
     for t:=1 to n do
      begin
       while (f<=r) and (hmax[t]>=hmax[queu[r]]) do dec(r);
       while (f1<=r1) and (hmin[t]<=hmin[queu1[r1]]) do dec(r1);
       push(t); push1(t);
       while (f<=r) and (f1<=r1) and (hmax[queu[f]]-hmin[queu1[f1]]>k) do
        begin
          inc(last);
          while (f<=r) and (queu[f]<last) do inc(f);
          while (f1<=r1) and (queu1[f1]<last) do inc(f1);
        end;
       if t>=last then twohang[i,j]:=max(twohang[i,j],(j-i+1)*(t-last+1));
      end;
    end;
  end;
 for i:=1 to m do
 begin
  pp[i]:=pp[i-1];
  for j:=1 to i do pp[i]:=max(pp[i],twohang[j,i]);
 end;
 for i:=1 to m do
  for j:=i to m do hang:=max(hang,pp[i-1]+twohang[i,j]);
end;

function cot:longint;
var i,j,last,t:longint;
begin
 cot:=0;
 for i:=1 to n do pp[i]:=0;
 for i:=1 to n do
  begin
   for j:=1 to m do
    begin
     hmax[j]:=-oo; hmin[j]:=oo;
    end;
   for j:=i to n do
    begin
     f:=1; f1:=1; r:=0; r1:=0;  last:=1;
     for t:=1 to m do
      begin
       hmax[t]:=max(hmax[t],a[t,j]);
       hmin[t]:=min(hmin[t],a[t,j]);
      end;
     for t:=1 to m do
      begin
       while (f<=r) and (hmax[t]>=hmax[queu[r]]) do dec(r);
       while (f1<=r1) and (hmin[t]<=hmin[queu1[r1]]) do dec(r1);
       push(t); push1(t);
       while (f<=r) and (f1<=r1) and (hmax[queu[f]]-hmin[queu1[f1]]>k) do
        begin
          inc(last);
          while (f<=r) and (queu[f]<last) do inc(f);
          while (f1<=r1) and (queu1[f1]<last) do inc(f1);
        end;
       if t>=last then twocot[i,j]:=max(twocot[i,j],(j-i+1)*(t-last+1));
      end;
    end;
  end;
 for i:=1 to n do
 begin
  pp[i]:=pp[i-1];
  for j:=1 to i do pp[i]:=max(pp[i],twocot[j,i]);
 end;
 for i:=1 to n do
  for j:=i to n do cot:=max(cot,pp[i-1]+twocot[i,j]);
end;


begin
// assign(input,'bland.inp'); reset(input);
// assign(output,'bland.out'); rewrite(output);
 nhap;
 write(max(hang,cot));
// close(input); close(output);
end.
