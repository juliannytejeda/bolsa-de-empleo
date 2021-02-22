from fastapi import FastAPI
import sqlite3
from starlette.middleware.cors import CORSMiddleware

counter=int()
def Connection():
    try:
        connection=sqlite3.connect("bolsaempleos.db")
        return connection
    except:
        return 0
    return connection

app=FastAPI()
app.add_middleware(CORSMiddleware,allow_origins=["*"],allow_credentials=True,allow_methods=["*"],allow_headers=["*"])

# METODOS OPERACIONALES

def InsertUsert(nombre,apellido,correo,password,edad,pais,telefono):
    try:
        sql = """INSERT INTO USUARIOS(NOMBRE,APELLIDO,CORREO,PASS,EDAD,PAIS,TELEFONO) VALUES (?,?,?,?,?,?,?)"""
        campos = (nombre,apellido,correo,password,edad,pais,telefono)
        connection = Connection()
        with connection:
            cursor = connection.cursor()
            cursor.execute(sql,campos)
            connection.commit()
            return 1
    except:
        return 0

def InicioSesion(email,password):
    try:
        sql="""SELECT * FROM USUARIOS WHERE CORREO='?' AND PASS='?'  """
        campos=(email,password)
        connection=Connection()
        with connection:
            cursor=connection.cursor()
            cursor.execute(sql,campos)
            cursor.fetchone()
            connection.commit()
        return 1
    except:
        return 0       

def RegistrarCategoria(nombre):
    try:
        sql = """INSERT INTO CATEGORIAS(NOMBRE) VALUES(?)"""
        campos = (nombre)
        connection = Connection()
        with connection:
            cursor = connection.cursor()
            cursor.execute(sql,campos)
            connection.commit()
            return 1
    except:
        return 0

def RegistrarPuesto(categoria,tipo,company,url,posicion,ubicacion,descripcion,email):
    try:
        sql = """INSERT INTO PUESTOS(CATEGORIA,TIPO,COMPANY,URL,POSICION,UBICACION,DESCRIPCION,EMAIL) VALUES(?,?,?,?,?,?,?,?)"""
        campos = (categoria,tipo,company,url,posicion,ubicacion,descripcion,email)
        connection = Connection()
        with connection:
            cursor = connection.cursor()
            cursor.execute(sql,campos)
            connection.commit()
            return 1
    except:
        return 0

def UpdatePuesto(id,categoria,tipo,company,url,posicion,ubicacion,descripcion,email):
    try:
        sql = """UPDATE PUESTOS SET CATEGORIA = ?, TIPO = ?, COMPANY = ?, URL = ?, POSICION = ?, UBICACION = ?, DESCRIPCION = ?, EMAIL = ? WHERE ID = ?"""
        campos = (categoria,tipo,company,url,posicion,ubicacion,descripcion,email,id)
        connection = Connection()
        with connection:
            cursor = connection.cursor()
            cursor.execute(sql,campos)
            connection.commit()
            return 1
    except:
        return 0

def DeletePuesto(id):
    try:
        sql = """DELETE FROM PUESTOS WHERE ID = ?"""
        campos = (id)
        connection = Connection()
        with connection:
            cursor = connection.cursor()
            cursor.execute(sql,campos)
            connection.commit()
            return 1
    except:
        return 0


# METODOS DE LA API

@app.post("/InsertarUsuarios/{nombre}/{apellido}/{correo}/{password}/{edad}/{pais}/{telefono}")
def Usuarios(nombre:str,apellido:str,correo:str,password:str,edad:int,pais:str,telefono:str):
    try:
        consulta = InsertUsert(nombre,apellido,correo,password,edad,pais,telefono)
        if(consulta != 0):
            return {"Mensaje": "Usuario insertado exitosamente" } 
        else:
            return "Fallo la operacion, intentelo de nuevo"
    except:
        return "Error en la base de datos"

@app.get("/logIn/{email}/{password}")
def logIn(email:str,password:str):
    try:
        sql="""SELECT * FROM USUARIOS WHERE CORREO=? AND PASS=? """
        values=(email,password)
        connection=Connection()
        with connection:
            _cursor=connection.cursor()
            _cursor.execute(sql,values)
            _result=_cursor.fetchone()
            _result=list(_result)
        return dict(Email=email,Password=password)
    except:
        return dict(Error="Error en la base de datos.")

@app.post("/RegistrarCategoria/{nombre}")
def RegistroCategoria(nombre:str):
    try:
        consulta = RegistrarCategoria(nombre)
        if(consulta != 0):
            return dict(Exito="Se registro categoria con exito")
        else:
            return dict(Error="Ocurrio un error, intentelo de nuevo")
    except:
        return dict(Error="Error en la base de datos.")
    
@app.post("/InsertarPuesto/{categoria}/{tipo}/{company}/{url}/{posicion}/{ubicacion}/{descripcion}/{email}")
def Puestos(categoria:str,tipo:str,company:str,url:str,posicion:str,ubicacion:str,descripcion:str,email:str):
    try:
        consulta = RegistrarPuesto(categoria,tipo,company,url,posicion,ubicacion,descripcion,email)
        if(consulta != 0):
            return dict(Categoria=categoria,Posicion=posicion)
        else:
            return dict(Error="Fallo la operacion")
    except:
        return dict(Error="Error en la base de datos.")


@app.get("/UpdatePuestos/{id}/{categoria}/{tipo}/{company}/{url}/{posicion}/{ubicacion}/{descripcion}/{email}")
def ActualizarPuesto(id:int,categoria:str,tipo:str,company:str,url:str,posicion:str,ubicacion:str,descripcion:str,email:str):
    try:
        consulta = UpdatePuesto(id,categoria,tipo,company,url,posicion,ubicacion,descripcion,email)
        if(consulta != 0):
            return dict(Mensaje="Usuario actualizado.")
        else:
            return dict(Error="Error en operacion.")
    except:
        return dict(Error="Error en la base de datos.")

@app.delete("/DeletePuesto/{id}")
def BorrarPuesto(id:int):
    try:
        consulta = DeletePuesto(id)
        if(consulta != 0):
            return dict(Mensaje="Puesto eliminado.")
        else:
            return dict(Error="Error en la ejecucion.")
    except:
        return dict(Error="Error en la base de datos.")

@app.get("/PuestosTrabajo")
def TodosLosTrabajos():
    try:
        global counter
        sql = """SELECT * FROM PUESTOS"""
        connection = Connection()
        with connection:
            cursor = connection.cursor()
            cursor.execute(sql)
            result = cursor.fetchall()
        dictionary = {}
        _dictionary = {}
        counter = 0
        for k in result:
            _dictionary = dict(ID=k[0],CATEGORIA=k[1],TIPO=k[2],COMPAÑIA=k[3],URL=k[4],POSICION=k[5],UBICACION=k[6],DESCRIPCION=k[7],EMAIL=k[8])
            dictionary.update({f"Puestos{counter}": _dictionary})
            counter+=1
        return dict(PuestosTrabajo=dictionary)
    except:
        return dict(Error="Fallo la ejecucion.")