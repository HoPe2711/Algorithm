{$H+}
var s,st:string;
    l,l1:longint;
    next:array[0..1000000] of longint;
procedure nhap;
begin
 readln(st);
 readln(s);
end;
procedure pack(s:String);
var i,j:longint;
begin
 j:=0;
 next[1]:=0;
 for i:=2 to l1 do
  begin
   while (j>0) and (s[j+1]<>s[i]) do j:=next[j];
   if s[j+1]=s[i] then
    begin
     next[i]:=j+1;
     inc(j);
    end
   else next[i]:=0;
  end;
end;
procedure find(s,st:string);
var i,j:longint;
begin
 j:=0;
 for i:=1 to l do
  begin
   while (j<>0) and (st[i]<>s[j+1]) do j:=next[j];
   if st[i]=s[j+1] then inc(j);
   if j=l1 then
    begin
     write(i-l1+1,' ');
     j:=next[j];
    end;
  end;
end;
procedure xuli;
begin
 l:=length(st);
 l1:=length(s);
 pack(s);
 find(s,st);
end;
begin
 //assign(input,'KMP.inp');reset(input);
 //assign(output,'KMP.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.
