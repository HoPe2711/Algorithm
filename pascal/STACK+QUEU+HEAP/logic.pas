var  top,top1,dem,n,t,md:longint;
     st,st1,hailong,ok:string;
     stack1,x1,tt,free,free1,tungduong,pack:array[0..260] of longint;
     stack:array[0..260] of char;
procedure push(x:char);
begin
 inc(top);
 stack[top]:=x;
end;
function pop:char;
begin
 pop:=stack[top];
 dec(top);
end;
procedure push1(x:longint);
begin
 inc(top1);
 stack1[top1]:=x;
end;
function pop1:longint;
begin
 pop1:=stack1[top1];
 dec(top1);
end;

procedure tinh(x:char);
var a,b:longint;
begin
 if (ord(x)>=97) and (ord(x)<=122) then push1(x1[tt[ord(x)]])
 else
  if x='~' then
  begin
   a:=pop1;
   a:=not(a);
   push1(a);
  end
 else
  begin
   a:=pop1; b:=pop1;
   if x='|' then a:=b or a;
   if x='^' then a:=b xor a;
   if x='&' then a:=b and a;
   push1(a);
  end;
end;

function gt(x:char):longint;
begin
 if (x='(') then exit(0);
 if (x='|') then exit(1);
 if (x='^') then exit(2);
 if (x='&') then exit(3);
 //if (x='~') then exit(4);
end;

procedure bd(x:char;i:longint);
begin
 if (ord(x)>=97) and (ord(x)<=122) then
  begin
   hailong:=hailong+x;
   while tungduong[i]<>0 do
    begin
     dec(tungduong[i]);
     hailong:=hailong+'~';
    end;
  end
 else
  begin
   if x='(' then
    begin
     push(x);
     inc(md);
     inc(pack[md],tungduong[i]);
    end else
   if x=')' then
   begin
    repeat
     x:=pop;      //dec(i);
     if x<>'(' then hailong:=hailong+x;
    until x='(';
    while pack[md]<>0 do
     begin
      dec(pack[md]);
      hailong:=hailong+'~';
     end;
    dec(md);
   end
   else if x<>'~' then
    begin
     while (top<>0) and (gt(x)<=gt(stack[top])) do hailong:=hailong+pop;
     push(x);
    end
   else tungduong[i+1]:=tungduong[i]+1;
  end;
end;
procedure xuli;
var i,kq:longint;
begin
 hailong:=''; top:=0; top1:=0;  md:=0;
 fillchar(tungduong,sizeof(tungduong),0);
 fillchar(pack,sizeof(pack),0);
 for i:=1 to length(st) do bd(st[i],i);
 while (top<>0) do hailong:=hailong+pop;
 for i:=1 to length(hailong) do tinh(hailong[i]);
 kq:=stack1[top1];
 top:=0; top1:=0; hailong:='';  md:=0;
 fillchar(pack,sizeof(pack),0);
 fillchar(tungduong,sizeof(tungduong),0);
 for i:=1 to length(st1) do bd(st1[i],i);
 while (top<>0) do hailong:=hailong+pop;
 for i:=1 to length(hailong) do tinh(hailong[i]);
 if kq<>stack1[top1] then ok:='diferite';
end;

procedure duyet(i:longint);
var j:longint;
begin
 if i=dem+1 then xuli
 else
  for j:=0 to 1 do
   begin
    x1[i]:=j;
    duyet(i+1);
   end;
end;
procedure nhap;
var i:longint;
begin
 readln(st);
 readln(st1);
 if st[length(st)]=' ' then delete(st,length(st),1);
 if st1[length(st1)]=' ' then delete(st1,length(st1),1);
 dem:=0;
 ok:='egale';
 fillchar(tt,sizeof(tt),0);
 fillchar(free,sizeof(free),0);
 for i:=1 to length(st) do
  if (ord(st[i])>=97) and (ord(st[i])<=122) then
  if free[ord(st[i])]=0 then
   begin
    inc(dem);
    tt[ord(st[i])]:=dem;
    free[ord(st[i])]:=1;
   end;
 fillchar(free1,sizeof(free1),0);
 for i:=1 to length(st1) do
  if (ord(st1[i])>=97) and (ord(st1[i])<=122) then
  if free1[ord(st1[i])]=0 then free1[ord(st1[i])]:=1;
 for i:=97 to 122 do
  if (free[i]<>free1[i]) then
   begin
    writeln('diferite');
    exit;
   end;
 duyet(1);
 writeln(ok);
end;
begin
 assign(input,'logic.in');reset(input);
 assign(output,'logic.out');rewrite(output);
 readln(n);
 for t:=1 to n do nhap;
 close(input); close(output);
end.