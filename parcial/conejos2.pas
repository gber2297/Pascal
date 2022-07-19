un criadero de conejos esta analizando ciclos de 
reproduccion. el criadero cuenta con conejas 
reproductoras y dispone de una estructura que 
contiene para cada coneja: nro de identeficacion,
año de nacimiento, raza, cantidad de partos (1 y 20)
y cantidad de crias que tuvo en cada parto

a) realice un modulo que reciba la informacion de
las conejas y retorne en una estructura adecuada el
nro de identificacion, raza y año de nacimiento 
de las que tuvieron algun parto con mas de 8 crias.

b) realice un modulo que reciba la estructura de a)
e imprima la cantidad de conejas nacidas en 2018
cuyo codigo termina en 0;



c) realice una funcion que reciba la informacion 
de las conejas y un codigo de coneja, y retorne el
promedio que tuvo de crias por parto dicha coneja
o -1 si la coneja no se encuentra en la estructura

program turbio2;

const cant_partos= 20;

type 
    rango_partos: 1..cant_partos;
    vector_partos = array [rango_partos] of integer;
    
    conejas = record
        nro_id:integer;
        año_de_nacimiento:integer;
        raza:string;
        cantidad_de_partos:rango_partos;
        cantidad_de_crias:integer;
    end;

    lista = ^nodo
    nodo = record;
        dato:c;
        sig:lista;
    end;

procedure leerDatos(c:conejos); //inciso 1 
begin
    read (c.nro_id);
    read (c.raza);
    read (año_de_nacimiento);
end;
procedure agregarAdelante(var L:lista);
var
   aux:lista;
begin
    new(aux);
    aux^.dato:=c;
    aux^.sig:=L;
    L:= aux;
end;
procedure cargarLista(var L:lista);
var 
    c:conejos;
begin
    read(c);
    if (c.cantidad_de_crias > 8) then
        leerDatos(c);
        agregarAdelante(L,c)
    end;    
end;

function es_cero (num:integer):boolean;
var   
    L:lista; 
    aux:integer;
    dig:integer;
begin
    es_cero:= false
    dig := L^.dato.nro_id MOD 10;
    if (dig = 0) then
        es_cero:=true;
    end;
    else
        es_cero:= false;
end;

function procesar_conejas_e_imprimir(L:lista, c:conejas; var cantidad:integer; var es_cero:boolean): integer;
var
    cantidad:integer;
    cant:integer;
begin
    cant:= 0;
    while ( L <> NIL) do
        if (( L^.dato.año_de_nacimiento = 2018 ) AND (es_cero(L^.dato.nro_id)= true) then
            cant := cant + 1
            L:= L^.sig;
        end;
        L:= L^.sig;
    end;
    cantidad:= cant; 
end;

procedure inicializarVector (var v:vector_partos);
var
    i:rango_partos;
begin
    for i:= 1 to cant_partos do
        read(v[i]) ;
end;

function promedio_conejas (L:lista): real;
var
    actual:lista;
    i:rango_partos;
    v:vector_partos;
    promedio: real;
begin
    inicializarVector(v);
    while (L <> NIL) do begin
        actual:= L^.dato.nro_id;
        if ( L^.dato.nro_id = actual ) then
            promedio := v[i].cantidad_de_crias / v[i].cantidad_de_partos;
            promedio_conejas := promedio;
            L:=L^.sig;
        end;
        else 
            promedio_conejas := -1;
            L:=L^.sig;
        end;
        
    end;
end;


var 
    L:lista
    c:conejos;
    vec:vector_partos;
begin
    L:= NIL;
    cargarLista(L);
    procesar_e_imprimir(L,c);
    promedio_conejas(L,vec);
end.








