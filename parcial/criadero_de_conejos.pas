un criadero de conejos esta analizando ciclos de reproduccion. el
criadero cuenta con conejas reproductoras y dispone de una estructira
que contiene, para cada coneja, su codigo, año de nacimiento, nombre,
cantidad de partos (entre 1 y 10) y cantidad de crias que tuvo en cada
parto

a) realizar un modulo que reciba la informacion de las conejas y retorne
en una estructura adecuada el codigo, el nombre y el año de nacimiento
de las conejas que tuvieron en promedio mas de 5 crias
b) realice un modulo que reciba la estructura generada en a) e imprima
los nombres de las conejas con codigo par, nacidas antes del 2016
c) realice una funcion que reciba la informacion de las conejas y un
codigo de coneja, y retorne la cantidad maxima de crias quye tuvo
la coneja con dicho codigo en alguno de sus partos. retornar -1 si
la coneja no se encuentra en la estructura


program parcialTurbio;

    const cant_partos = 10
type 

    rango_partos: 1..cant_partos;
    vector_partos = array[rango_partos] of integer;

    conejas = record
        codigo:integer;
        año_de_nacimiento: integer;
        nombre:string;
        cantidad_de_partos:rango_partos ;
        cantidad_de_crias:vector_partos;
    end

    lista = ^nodo
    nodo = record
        datos: conejas:
        sig:lista;
    end

a) realizar un modulo que reciba la informacion de las conejas y retorne
en una estructura adecuada el codigo, el nombre y el año de nacimiento
de las conejas que tuvieron en promedio mas de 5 crias



procedure leerDatos (c:conejas);
begin
    with c;
    read(c.codigo);
    read(c.nombre);
    read(c.año_de_nacimiento);
end;

procedure agregarAdelante (var L:lista; c:conejas;);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=c;
    aux^.sig:=L;
    L:= aux;
end;

procedure cargarLista (var L:lista);
var
    c:conejas
begin    
    read(c.cantidad_de_crias);
    if (c.cantidad_de_crias >= 5) then
        leerDatos(c)
        agregarAdelante(L,c)
    end;
end;

b) realice un modulo que reciba la estructura generada en a) e imprima
los nombres de las conejas con codigo par, nacidas antes del 2016

procedure procesar_e_imprimir (L:lista; c:conejas) 

begin
    while( L <> NIL ) do begin
        if ((L^.dato.codigo mod 2 = 0 ) AND (L^.dato.año_de_nacimiento < 2016)) then
            write (L^.dato.nombre);
        L:=L^.sig;
    end;
end;


c) realice una funcion que reciba la informacion de las conejas y un
codigo de coneja, y retorne la cantidad maxima de crias quye tuvo
la coneja con dicho codigo en alguno de sus partos. retornar -1 si
la coneja no se encuentra en la estructura



procedure inicializarVector(v:vector_partos);
var
    i:rango_partos;
begin
    for i:=1 to cant_partos do begin
        v[i]:= 0;
    end;
end;

function cant_max_crias (L:lista; var cant_max; vec:vector_partos): integer;
var
    vec:vector_partos;
    cant_max: integer;
    actual: lista;
    i:rango_partos;

begin
    cant_max:=-1;
    inicializarVector(vec);
    actual:= L^.dato.codigo;
    while ( L <> NIL ) do
        while (L^.dato.codigo = actual) do begin
            for i:= 1 to cant_partos do
                if ( vec[i] > cant_max ) then
                    cant_max := vec[i];
                end;
                else 
                    cant_max_crias := -1;
                end;
            end;   
        end;
        L:= L^.sig;
    end;
    cant_max_crias:= cant_max;
end;


program principal;


begin
cargarLista(L)
procesar_e_imprimir(L,c)
cant_max_crias(c);
end.