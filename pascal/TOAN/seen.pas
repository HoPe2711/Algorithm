{$H+}
uses math;
const oo=1000000000;
var r,c,h,w,dem,dem1:longint;
    res:int64;
    st,st1:string;
    pp,tt:array[0..100005] of longint;
procedure nhap;
var i:longint;
begin
 readln(r,c);
 readln(h,w);
 readln(st);
 readln(st1);
 for i:=1 to length(st1) do
  begin
   inc(dem);
   tt[dem]:=0 xor (ord(st1[i])-48);
  end;
end;
procedure xuli;
var last,i:longint;
    sum:int64;
begin
 last:=1;     dem1:=1;
 for i:=1 to dem do
 if i<=w then pp[1]:=pp[1]+tt[i]
 else
  begin
   inc(dem1);
   pp[dem1]:=pp[dem1-1]+tt[i]-tt[last];
   inc(last);
  end;
// qsort(1,dem1);
 pp[0]:=oo;
 for i:=1 to dem1 do
  begin
   pp[0]:=min(pp[0],pp[i]);
   pp[dem1+1]:=max(pp[dem1+1],pp[i]);
  end;
 last:=0;       sum:=0;
 for i:=1 to length(st) do
  if i<h then sum:=sum+ord(st[i])-48
  else
   begin
    if last<>0 then sum:=sum+ord(st[i])-ord(st[last])
    else sum:=sum+ord(st[i])-48;
    if i-last-2*sum>0 then res:=max(res,w*h-pp[0]*(i-last-2*sum)-w*sum)
    else  if pp[dem1+1]*(i-last-2*sum)+w*sum>=0 then  res:=max(res,w*h-pp[dem1+1]*(i-last-2*sum)-w*sum);
    inc(last);
   end;
 write(res);
end;
begin
 assign(input,'seen.inp');reset(input);
 assign(output,'seen.out');rewrite(output);
 nhap;
 xuli;
 closE(input); close(output);
end.
