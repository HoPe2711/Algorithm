uses math;
var n :longint;
    f,t,r:array[1..60000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(t[i]);
 for i:=1 to n-1 do read(r[i]);
end;
procedure xuli;
var i:longint;
begin
 f[1]:=t[1];
 f[2]:=min(f[1]+t[2],r[1]);
 for i:=3 to n do f[i]:=min(f[i-1]+t[i],f[i-2]+r[i-1]);
 write(f[n]);
end;
begin
 assign(input,'ticket.inp');reset(input);
 assign(output,'ticket.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
