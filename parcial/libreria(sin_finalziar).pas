una editorial vende libros de apoyo escolar para varias materias, codificadas de la siguiente
 forma: 1) Historia 2) geografia 3) matematica 4) biologia 5) fisica 6) quimica y 7) lengua. 
 el ctaalogo de la editorial consta de 5000 libros con la siguiente informacion. 
 codigo de libro (1..5000), codigo de materia (entre 1 y 7), titulo, año de edicion, 
 precio de venta y apellido del autor

la editorial dispone de una estructura de datos con informacion de todas las ventas realizadas.
 de cada venta se conoce el codigo del libro, el dni, el mes y año de venta.

realizar un programa que 
1) lee y almacene la info de todos los libros del catalogo de la editorial. los libros son
 ingresados sin ningun ordenen en particular. 


2) una vez leido y almacenado el catalogo de libros, procese la informacion de las ventas 
( que dispone la editorial), calcule e informe:
a- las dos materias con mayor cantidad de libros vendidos
b- para las ventas con clientes con dni sin digitos pares, en las cuales el libro vendido 
fue editado entre los años 2011 y 2017, informar el año de la venta y el titulo del libro vendido

procedure procesar_datos(L:lista);
var
    materias:vector_materias
    aux:lista;
begin
    L:=NIL;
    inicializar_vector_contador(materias);
    while (L <> NIL ) do 
    begin
        aux:=L^.dato;
        materias[L^.dato.codigo_materia] := materias[L^.dato.codigo_materia] + 1;
        L:= aux.sig;
    end;
    write(maximos(materias));
    if (cumple_condiciones(aux.dni,aux.año_edicion) = true) then
        write(aux.año);
        write(aux.titulo);
    end;
end;

function no_tiene_ceros(num:integer):boolean;
var
    dig:integer;
    num:integer;
    tiene:boolean;
begin
    tiene:=false;
    while (num <> 0) AND (not tiene) do 
    begin
        dig := num MOD 10;
        if ( dig = 0 ) then
            tiene:= true;
        else
            num := num DIV 10;
        end;
    end;
    no_tiene_ceros := tiene;
end;

function cumple_condiciones(L:lista):boolean;
var
    i:integer;
    cumple_boolean
begin
    cumple:=false;
    if (no_tiene_ceros( L^.dato.dni,0) = 0) AND (L^.dato.año_edicion >= 2011 AND <=2017) do
        cumple:=true;
    else 
        cumple:=false
end;






program librearia ;

const
    cant_libros = 5000;

type 
    rango_codigo = 1..cant_libros;
    rango_materias = 1..7;
    vector_materias = array [rango_materias] of integer;

    libros = record 
        codigo_libro:rango_codigo;
        codigo_materia:rango_materias;
        titulo:string;
        año_edicion:integer;
        precio:real;
        apellido_autor:string;
    end;

    ventas = record
        codigo_libro:rango_codigo;
        dni:integer;
        mes:integer;
        año:integer;
    end;

    lista = ^nodo
    nodo = record
        dato:ventas;
        sig:lista;
    end;


procedure leer_datos (l:libros);
begin
    with l do;
    read(codigo_libro);
    read(codigo_materia);
    read(titulo);
    read(año_edicion);
    read(precio);
    read(apellido_autor);
end;

procedure agregar_adelante(var L:lista; l:libros);
var 
    aux:lista;
begin
    new(aux);
    aux^.dato:=l;
    aux^.sig:=L;
    L:= aux;
end;

procedure cargar_lista_libros(var L:lista);
var
    i:rango_codigo;
    l:libros;
begin
    for i:=1 to cant_libros do
        leer_datos(l);
        agregar_adelante(L,l);
    end;
end;

procedure inicializar_vector_contador (v:vector_materias);
var
    i:rango_materias;
begin
    for i:= 1 to 7;
     v[i]:= 0;
end;



