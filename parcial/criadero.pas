un criadero de cerdos dispone de informacion sobre
partos registrados. de cada parto se conoce año, 
codigo de la madre (200 y 599) y cant de crias en
cada parto

a) realice un modulo que lea informacion de las 400 madres
y la almacene en una estructura adecuada.  de cada
madre se lee: codigo, año de nacimiento y raza. 
sin orden



b)realice un modulo que reciba la informacion de 
partos, la informacion de las madres, y un codigo
de madre, y retorne en una estructura adecuada 
la informacion de todos los partos de dicha madre,
en los que hayan parido al menos 4 crias y en la que
la edad de la madre en ese momento sea 2.
info ordenada por cantidad de crias.


c) realice un modulo que reciba la informacion 
de partos generada en b) e informe el promedio de
crias por parto de cada madre


program criadero3;
    const cant_madres = 599;
type
    rango_madres= 200..cant_madres;

    partos = record
        id_madre:rango_madres;
        cantidad_crias:integer;
    end;
|   vector_partos = array [rango_madres] of partos;
    madres = record
        codigo:rango_madres; 
        año_de_nacimiento:integer;
        raza:string;
    end;

    lista = ^nodo
    nodo = record
        dato:m;
        sig:lista
    end;

//inciso a
procedure leer_datos(m:madres);
begin
    for 
    with m do;
    read(codigo);
    read(año_de_nacimiento);
    read(raza);
end;
procedure agregar_adelante(var L:lista);
var
    aux:lista;
    m:madres;
begin
    new(aux);
    aux^.dato:=m;
    aux^.sig:=L;
    L:= aux;
end;
procedure cargar_lista (var L:lista);
var
    m:madres;
    i:rango_madres;
begin
    for i:=1 to cant_madres do
        leer_datos(m);
        agregar_adelante(L,m);
end;

procedure inicializar_vector(vec:vector_partos);
var
    i:rango_madres;
begin
    for i:=1 to cant_madres do
        read(v[i]);
    end;
end;

//inciso 2
procedure insertar_ordenado(L:lista; var lista_partos:lista);
var
    nue:lista;
    p:partos;
    ant, act:lista;
begin
    new (nue); 
    nue^.dato:= p; 
    act := L; {ubico act y ant al inicio de la lista}
    ant := L; 
    while(( act <> nil )AND(p.cantidad_crias > act^.dato.cantidad_crias))do 
        begin
            ant := act;
            act:= act^.sig;
        end;
        if (act = ant) then {al inicio o lista vacía}
            L:= nue; 
        end
        else {al medio o al final}
            ant^.sig:= nue;
            nue^.sig:= act; 
        end;
    end;
    L:=L^.sig;
    
end;

procedure cargar_lista_partos(var lista_partos:lista);
var
    L:lista
    p:partos;
    v:vector_partos;
begin
    while ( L <> NIL ) do begin
        if ((v[i].cantidad_crias = 4) AND ((2022 - L^.año_de_nacimiento) = 2 )) then
            insertar_ordenado(L,p)
        end;
    end;
end;

//inciso 3
function promedio(lista_partos:lista): integer;
var
    v:vector_partos;
    madre_actual:lista;
    cant_partos:integer;
begin
    cant_partos:= 0;
    while (L <> NIL ) do
        madre_actual := L^.dato.id_madre;
        while ( L^.dato.id_madre = actual) do
            cant_partos := cant_partos + 1;
        end;
        promedio := cant_partos / L^.dato.cantidad_crias;
        L:=L^.sig;
    end;
end;

program principal; 

var
L:lista
lista_partos:lista
partos:vector_partos

begin
cargar_lista(L,m)
inicializar_vector(partos);
cargar_lista_partos(lista_partos, p);
promedio(lista_partos);
end.



