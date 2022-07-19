Un establecimiento canino dispone de información sobre los partos registrados. 
De cada parto se conoce: nro de identificación, año, código de la madre (entre 100 y 499) y 
cantidad de crías nacidas. Una madre puede parir más de una vez. La estructura se encuentra ordenada 
por año de manera ascendente.

a) Realice un módulo que lea información de las 400 madres y la almacene en una estructura adecuada. 
De cada madre se lee: código y raza. La información se ingresa sin orden.

b) Realice un módulo que reciba la información de los partos y la información de las madres y 
retorne una nueva estructura con los nro de identificación de los partos de madres de raza "doberman"
 que se produjeron antes del año 2000.








program canines;

const cant_madres = 499;

type
    rango_madres = 100..cant_madres;

    vector_partos = array [rango_madres] of partos;
    
    partos = record
        id:integer;
        año:integer;
        codigo_madre:rango_madres;
    end;

    madres = record
        codigo_madre:rango_madres;
        raza:string;
    end;

    lista:^nodo
    nodo = record
        dato:partos;
        sig:lista;
    end;



//inciso a
procedure leer_datos ( m:madres );
begin
    read(m.codigo_madre);
    read(m.raza);
end;

procedure agregar_adelante ( var L:lista );
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=m;
    nue^.sig:=L;
    L:= nue;
end;

procedure cargar_lista_madres ( var L:lista );
var
    m:madres;
    i:rango_madres;
begin
    for i:= 100 to cant_madres;
        leer_datos(m);
        agregar_adelante(L,m);
    end;
end;

procedure procesar_datos(L:lista; var L2:lista);
var
    m:madres;
    p:partos;
    
begin
    L2:=NIL;
    while ( L <> NIL) do begin
        p:= L^.dato.id;
        if ((L2^.dato.raza = doberman) and (L^.dato.año < 2000)) then
            agregar_adelante(L2,p);
        end;
        L2:=L2^.sig;
    end;
end;

var
    L:lista;
    L2:lista;
    vec:vector_partos;
    m:madres;
    p:partos
begin
    cargar_lista_partos(L,p); //se dispone
    cargar_lista_madres(L,m);
    procesar_datos(L,L2);
    
end.