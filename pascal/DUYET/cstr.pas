uses math;
var res1:longint;
    res:string;
    st,st1,st2,s:string;
    d:array[0..100,0..100,0..100] of longint;
procedure nhap;
begin
 readln(st);
 readln(st1);
 readln(st2);
 res1:=101;  s:='';
end;
procedure duyet(i,fa,fb,fc:longint);
var j:char;
begin
 if i<=d[fa,fb,fc] then exit;
 d[fa,fb,fc]:=i;
 if max(max(fa,fb),fc)>res1 then exit;
 if i=length(St)+1 then
  begin
   if res1>max(max(fa,fb),fc) then
    begin
     res1:=max(max(fa,fb),fc);
     res:=s;
    end;
   exit;
  end;
 for j:='A' to 'Z' do
  begin
   s:=s+j;
   duyet(i+1,fa+ord(j<>st[i]),fb+ord(j<>st1[i]),fc+ord(j<>st2[i]));
   delete(s,length(s),1);
  end;
end;
begin
 assign(input,'cstr.inp');reset(input);
 assign(output,'cstr.out');rewrite(output);
 nhap;
 duyet(1,0,0,0);
 writeln(res);
 close(input); close(output);
end.
