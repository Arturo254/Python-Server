![1000090648](https://github.com/Arturo254/Python-Server/assets/87346871/bb766da2-14c5-47a3-8f6a-8e9a37084ad8)


# Python-Server
Crea un servirdor local usando python


![1000090654](https://github.com/Arturo254/Python-Server/assets/87346871/0c457648-6dfa-43f8-9a64-750cbb39ef84)


# IMPORTANTE

para que el servidor funcione debes ejecutar el comando
Dentro de la carpeta que contiene la página web  o la carpeta
Que quieras acceder

### URL de acceso público :

Para poder compartir tu página o archivos utiliza Cloudfared 
(repositorio en mi perfil) 

Solo ejecutas el script e ingresas el puerto (8080) y listo. 😃


# REQUISITOS PREVIOS

<li> python
<li> pip
<li> bash
<li> grep

El funcionamiento de la herramienta es igual tanto
En linux como en termux

# INSTALACIÓN


```

git clone https://github.com/Arturo254/Python-Server

cd Python-Server

chmod 777 *

bash install.sh

``` 


# USO 
```
pyserver 

``` 

# DOCUMENTACIÓN 

Este módulo define clases para implementar servidores HTTP.

> [!CAUTION]
> Advertencia http.server is not recommended for production. It only implements basic security checks.


Una clase, HTTPServer, es una subclase socketserver.TCPServer. Crea y escucha en el socket HTTP, enviando las peticiones a un handler. El código para crear y ejecutar el servidor se ve así:

<code>def run(server_class=HTTPServer, handler_class=BaseHTTPRequestHandler):
    server_address = ('', 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()
class http.server.HTTPServer(server_address, RequestHandlerClass)</code>


### Esta clase se basa en la clase TCPServer almacenando la dirección del servidor como variables de instancia llamadas nombre_del_servidor y puerto_del_servidor. El servidor es accesible por el handler, típicamente a través de la variable de instancia servidor del handler.

<code>class http.server.ThreadingHTTPServer(server_address, RequestHandlerClass)</code>


<p>Esta clase es idéntica a HTTPServer, pero utiliza subprocesos para controlar las solicitudes mediante el uso de ThreadingMixIn. Esto es útil para controlar los sockets de pre-apertura de los navegadores web, en los que HTTPServer esperaría indefinidamente.</p>

Nuevo en la versión 3.7.

El HTTPServer y ThreadingHTTPServer deben recibir un RequestHandlerClass en la creación de instancias, de los cuales este módulo proporciona tres variantes diferentes:

<code>class http.server.BaseHTTPRequestHandler(request, client_address, server)</code>


Esta clase se utiliza para controlar las solicitudes HTTP que llegan al servidor. Por sí mismo, no puede responder a ninguna solicitud HTTP real; debe ser subclase para manejar cada método de solicitud (por ejemplo, GET o POST). BaseHTTPRequestHandler proporciona una serie de variables de clase e instancia, y métodos para su uso por subclases.

El controlador analizará la solicitud y los encabezados y, a continuación, llamará a un método específico del tipo de solicitud. El nombre del método se construye a partir de la solicitud. Por ejemplo, para el método de solicitud SPAM, se llamará al método do_SPAM() sin argumentos. Toda la información relevante se almacena en variables de instancia del controlador. Las subclases no deben tener que reemplazar o extender el método __init__().

BaseHTTPRequestHandler tiene las siguientes variables de instancia:

client_address
Contiene una tupla con el formato (host, port) que hace referencia a la dirección del cliente.

server
Contiene la instancia del servidor.

close_connection
Booleano que se debe establecer antes de handle_one_request() retorna, que indica si se puede esperar otra solicitud o si la conexión debe cerrarse.

requestline
Contiene la representación de cadena de la línea de solicitud HTTP. Se elimina el CRLF de terminación. Este atributo debe establecerse mediante handle_one_request(). Si no se ha procesado ninguna línea de solicitud válida, debe establecerse en la cadena vacía.

command
Contiene el comando (tipo de petición). Por ejemplo, 'GET'.

path
Contiene la ruta de la solicitud. Si el componente de consulta de la URL está presente, path incluye la consulta. Usando la terminología de: rfc: 3986, path aquí incluye hier-part y query.

request_version
Contiene la versión de la cadena de caracteres para la petición. Por ejemplo, HTTP/1.0'.

headers
Contiene una instancia de la clase especificada por la variable de clase MessageClass. Esta instancia analiza y gestiona las cabeceras de la petición HTTP. La función parse_headers() de http.client se usa para parsear las cabeceras y requiere que la petición HTTP proporcione una cabecera válida de estilo RFC 2822.

rfile
Un flujo de entrada io.BufferedIOBase, listo para leer desde el inicio de los datos de entrada opcionales.

wfile
Contiene el flujo de salida para escribir una respuesta al cliente. Se debe utilizar la adherencia apropiada al protocolo HTTP cuando se escribe en este flujo para lograr una interoperación exitosa con los clientes HTTP.

Distinto en la versión 3.6: Este es un flujo de io.BufferedIOBase.

BaseHTTPRequestHandler tiene los siguientes atributos:

server_version
Especifica la versión del software del servidor. Es posible que desee anular esto. El formato es de múltiples cadenas separadas por espacio en blanco, donde cada cadena es de la forma nombre[/versión]. Por ejemplo, BaseHTTP/0.2'.

sys_version
Contiene la versión del sistema Python, en una forma utilizable por el método version_string y la variable de clase server_version. Por ejemplo, Python/1.4'.

error_message_format
Especifica una cadena de formato que debe ser usada por el método send_error() para construir una respuesta de error al cliente. La cadena se rellena por defecto con variables de responses basadas en el código de estado que pasó a send_error().

error_content_type
Especifica el encabezado HTTP Content-Type de las respuestas de error enviadas al cliente. El valor predeterminado es 'text/html'.

protocol_version
Esto especifica la versión del protocolo HTTP utilizada en las respuestas. Si se establece en 'HTTP/1.1', el servidor permitirá conexiones persistentes HTTP; sin embargo, el servidor debe incluir un encabezado exacto Content-Length (usando send_header()) en todas sus respuestas a los clientes. Para la compatibilidad con versiones anteriores, el valor predeterminado es 'HTTP/1.0'.

MessageClass
Especifica una email.message.Message-como clase para analizar los encabezados HTTP. Típicamente, esto no es anulado, y por defecto es http.client.HTTPMessage.

responses
Este atributo contiene una asignación de enteros de código de error a tuplas de dos elementos que contienen un mensaje corto y largo. Por ejemplo, {code (shortmessage, longmessage)}. El shortmessage se utiliza normalmente como la clave message en una respuesta de error, y longmessage como la clave explain. Es utilizado por send_response_only() y send_error() métodos.

Una instancia BaseHTTPRequestHandler tiene los siguientes métodos:

handle()
Llama handle_one_request() una vez (o, si las conexiones persistentes están habilitadas, varias veces) para manejar las peticiones HTTP entrantes. Nunca debería necesitar anularlo; en su lugar, implemente los métodos apropiados de do_*().

handle_one_request()
Este método analizará y enviará la solicitud al método apropiado do_*(). Nunca deberías necesitar anularlo.

handle_expect_100()
Cuando un servidor compatible con HTTP/1.1 recibe un encabezado de solicitud Expect: 100-continue, responde con un 100 Continue seguido de encabezados 200 OK. Este método se puede anular para generar un error si el servidor no desea que el cliente continúe. Por ejemplo, el servidor puede optar por enviar 417 Expectation Failed como encabezado de respuesta y return False.

Nuevo en la versión 3.2.

send_error(code, message=None, explain=None)
Envía y registra una respuesta de error completa al cliente. El code numérico especifica el código de error HTTP, con message como una descripción opcional, corta y legible por el ser humano del error. El argumento explain puede ser usado para proporcionar información más detallada sobre el error; será formateado usando el atributo error_message_format y emitido, después de un conjunto completo de encabezados, como el cuerpo de la respuesta. El atributo responses contiene los valores por defecto para message y explain que se usarán si no se proporciona ningún valor; para los códigos desconocidos el valor por defecto para ambos es la cadena ???. El cuerpo estará vacío si el método es HEAD o el código de respuesta es uno de los siguientes: 1xx, 204 No Content, 205 Reset Content, 304 Not Modified.

Distinto en la versión 3.4: La respuesta de error incluye un encabezado de longitud de contenido. Añadido el argumento explain.

send_response(code, message=None)
Agrega un encabezado de respuesta al búfer de encabezados y registra la solicitud aceptada. La línea de respuesta HTTP se escribe en el búfer interno, seguido de los encabezados Server y Date. Los valores de estos dos encabezados se recogen de los métodos version_string() y date_time_string(), respectivamente. Si el servidor no tiene la intención de enviar ningún otro encabezado utilizando el método send_header(), entonces send_response() debe ir seguido de una llamada end_headers().

Distinto en la versión 3.3: Los encabezados se almacenan en un búfer interno y end_headers() debe llamarse explícitamente.

send_header(keyword, value)
Agrega el encabezado HTTP a un búfer interno que se escribirá en la secuencia de salida cuando se invoca end_headers() o flush_headers(). keyword debe especificar la palabra clave header, con value especificando su valor. Tenga en cuenta que, después de que se realizan las llamadas send_header, end_headers() DEBE llamarse para completar la operación.

Distinto en la versión 3.2: Los encabezados se almacenan en un búfer interno.

send_response_only(code, message=None)
Envía el encabezado de respuesta solamente, usado para los propósitos cuando la respuesta 100 Continue es enviada por el servidor al cliente. Los encabezados no se almacenan en el buffer y envían directamente el flujo de salida. Si no se especifica el message, se envía el mensaje HTTP correspondiente al code de respuesta.

Nuevo en la versión 3.2.

end_headers()
Añade una línea en blanco (indicando el final de las cabeceras HTTP en la respuesta) al buffer de cabeceras y llama a flush_headers().

Distinto en la versión 3.2: Los encabezados del buffer se escriben en el flujo de salida.

flush_headers()
Finalmente envía los encabezados al flujo de salida y limpia el buffer interno de los cabezales.

Nuevo en la versión 3.3.

log_request(code='-', size='-')
Registra una solicitud aceptada (exitosa). El code debe especificar el código numérico HTTP asociado a la respuesta. Si un tamaño de la respuesta está disponible, entonces debe ser pasado como el parámetro size.

log_error(...)
Registra un error cuando una solicitud no puede ser cumplida. Por defecto, pasa el mensaje a log_message(), por lo que toma los mismos argumentos (format y valores adicionales).

log_message(format, ...)
Registra un mensaje arbitrario en sys.stderr. Normalmente se anula para crear mecanismos personalizados de registro de errores. El argumento format es una cadena de formato estándar de estilo de impresión, donde los argumentos adicionales a log_message() se aplican como entradas al formato. La dirección ip del cliente y la fecha y hora actual son prefijadas a cada mensaje registrado.

version_string()
Retorna la cadena de versiones del software del servidor. Esta es una combinación de los atributos server_version y sys_version.

date_time_string(timestamp=None)
Retorna la fecha y la hora dadas por timestamp (que debe ser None o en el formato retornado por time.time`()), formateado para un encabezado de mensaje. Si se omite timestamp, utiliza la fecha y la hora actuales.

El resultado se muestra como Sun, 06 Nov 1994 08:49:37 GMT'.

log_date_time_string()
Retorna la fecha y la hora actuales, formateadas para el registro.

address_string()
Retorna la dirección del cliente.

Distinto en la versión 3.3: Anteriormente, se realizó una búsqueda de nombres. Para evitar retrasos en la resolución del nombre, ahora siempre retorna la dirección IP.

class http.server.SimpleHTTPRequestHandler(request, client_address, server, directory=None)
Esta clase sirve archivos del directorio directory e inferior, o del directorio actual si no se proporciona directory, mapeando directamente la estructura del directorio a las solicitudes HTTP.

Nuevo en la versión 3.7: El parámetro directory.

Distinto en la versión 3.9: El parámetro directory acepta un path-like object.

La carga de trabajo, como el análisis de la solicitud, lo hace la clase base BaseHTTPRequestHandler. Esta clase implementa las funciones do_GET() y do_HEAD().

Los siguientes se definen como atributos de clase de SimpleHTTPRequestHandler:

server_version
Esto sería "SimpleHTTP/" + __version__, donde __version__ se define a nivel de módulo.

extensions_map
Un diccionario que asigna sufijos a tipos MIME contiene sobreescrituras personalizadas para las asignaciones predeterminadas del sistema. El mapeo se usa sin distinción entre mayúsculas y minúsculas, por lo que solo debe contener claves en minúsculas.

Distinto en la versión 3.9: Este diccionario ya no contiene las asignaciones predeterminadas del sistema, sino que solo contiene anulaciones.

Una instancia SimpleHTTPRequestHandler tiene los siguientes métodos:

do_HEAD()
Este método sirve para el tipo de petición: 'HEAD' envía los encabezados que enviaría para la petición equivalente GET. Ver el método do_GET() para una explicación más completa de los posibles encabezados.

do_GET()
La solicitud se asigna a un archivo local interpretando la solicitud como una ruta relativa al directorio de trabajo actual.

Si la solicitud fue mapeada a un directorio, el directorio se comprueba para un archivo llamado index.html or index.htm (en ese orden). Si se encuentra, se retorna el contenido del archivo; de lo contrario, se genera un listado del directorio llamando al método list_directory(). Este método utiliza os.listdir() para escanear el directorio, y retorna una respuesta de error 404 si falla el listdir().

Si la solicitud fue asignada a un archivo, se abre. Cualquier excepción OSError al abrir el archivo solicitado se asigna a un error 404, 'File not found'. Si había un encabezado 'If-Modified-Since' en la solicitud, y el archivo no fue modificado después de este tiempo, se envía una respuesta 304, 'Not Modified'. De lo contrario, el tipo de contenido se adivina llamando al método guess_type(), que a su vez utiliza la variable extensions_map, y se retorna el contenido del archivo.

Un encabezado de 'Content-type:' con el tipo de contenido adivinado, seguido de un encabezado de 'Content-Length:' con el tamaño del archivo y un encabezado de 'Last-Modified:' con el tiempo de modificación del archivo.

Luego sigue una línea en blanco que significa el final de los encabezados, y luego se imprime el contenido del archivo. Si el tipo MIME del archivo comienza con text/ el archivo se abre en modo de texto; en caso contrario se utiliza el modo binario.

For example usage, see the implementation of the test function in Lib/http/server.py.

Distinto en la versión 3.7: Soporta la cabecera 'If-Modified-Since'.

La clase SimpleHTTPRequestHandler puede ser usada de la siguiente manera para crear un servidor web muy básico que sirva archivos relativos al directorio actual:

import http.server
import socketserver

PORT = 8000

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("serving at port", PORT)
    httpd.serve_forever()
http.server can also be invoked directly using the -m switch of the interpreter. Similar to the previous example, this serves files relative to the current directory:

python -m http.server
The server listens to port 8000 by default. The default can be overridden by passing the desired port number as an argument:

python -m http.server 9000
By default, the server binds itself to all interfaces. The option -b/--bind specifies a specific address to which it should bind. Both IPv4 and IPv6 addresses are supported. For example, the following command causes the server to bind to localhost only:

python -m http.server --bind 127.0.0.1
Nuevo en la versión 3.4: Se introdujo el argumento --bind .

Nuevo en la versión 3.8: El argumento --bind se ha mejorado para soportar IPv6

By default, the server uses the current directory. The option -d/--directory specifies a directory to which it should serve the files. For example, the following command uses a specific directory:

python -m http.server --directory /tmp/
Nuevo en la versión 3.7: --directory argument was introduced.

class http.server.CGIHTTPRequestHandler(request, client_address, server)
Esta clase se utiliza para servir tanto a los archivos como a la salida de los scripts CGI del directorio actual y del siguiente. Note que el mapeo de la estructura jerárquica de HTTP a la estructura del directorio local es exactamente como en SimpleHTTPRequestHandler.

Nota Los scripts CGI ejecutados por la clase CGIHTTPRequestHandler no pueden ejecutar redirecciones (código HTTP 302), porque el código 200 (la salida del script sigue) se envía antes de la ejecución del script CGI. Esto adelanta el código de estado.
La clase, sin embargo, ejecutará el script CGI, en lugar de servirlo como un archivo, si adivina que es un script CGI. Sólo se usan CGI basados en directorios — la otra configuración común del servidor es tratar las extensiones especiales como denotando los scripts CGI.

Las funciones do_GET() y do_HEAD() se modifican para ejecutar scripts CGI y servir la salida, en lugar de servir archivos, si la petición lleva a algún lugar por debajo de la ruta cgi_directories.

La CGIHTTPRequestHandler define el siguiente miembro de datos:

cgi_directories
Esto por defecto es ['/cgi-bin', '/htbin'] y describe los directorios a tratar como si contuvieran scripts CGI.

La CGIHTTPRequestHandler define el siguiente método:

do_POST()
Este método sirve para el tipo de petición 'POST', sólo permitido para scripts CGI. El error 501, «Can only POST to CGI scripts», se produce cuando se intenta enviar a una url no CGI.

Tenga en cuenta que los scripts CGI se ejecutarán con UID de usuario nobody, por razones de seguridad. Los problemas con el script CGI serán traducidos al error 403.
 
