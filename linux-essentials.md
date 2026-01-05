# Linux Essentials: Supervivencia en la Terminal

**Kevin Rojas**

**Promarketing**

`https://github.com/NivekNK/linux-essentials-lab`

---

## Bloque 0: SSH - La Puerta de Entrada

* Shell Seguro. Sustituto cifrado de Telnet.
* Estándar para administración remota y túneles de datos.
* `~/.ssh/known_hosts` valida la identidad del servidor mediante llaves criptográficas.
* **Ejemplo:** `ssh admin@10.0.0.50`

---

## Practica 0: El Primer Salto

1. Abre tu terminal local.
2. Accede al servidor asignado:
   `ssh usuario@ip-del-servidor`
3. Confirma el Fingerprint escribiendo **yes**.
4. **Verificación de entorno:**
   * `whoami`: Confirma tu identidad de usuario.
   * `pwd`: Muestra la ruta absoluta de trabajo.

---

## Paso Intermedio: Obtención de Recursos

Antes de iniciar, descarga el entorno de pruebas en el servidor.

1. **Clonación del repositorio:**
   `git clone https://github.com/tu-usuario/linux-essentials-lab.git`
2. **Acceso al directorio:**
   `cd linux-essentials-lab`

---

## Bloque 1: Exploración y Arquitectura

* **ls -la (list):** Lista contenido. `-l` (long) detalla permisos y dueño; `-a` (all) incluye archivos ocultos.
* **tree (árbol):** Representación gráfica de la jerarquía de directorios.
* `tree` permite auditar la estructura de un repositorio (ubicación de `src`, `logs`, `config`) sin navegar manualmente.

---

## Practica 1: Entendiendo la Estructura

1. Ejecuta `ls -la`.
   * Identifica el archivo `setup.sh`.
   * Observa que carece de la letra `x` en la columna de permisos.
2. Ejecuta `tree`.
   * Visualiza la distribución de carpetas en el repositorio.
   * Si no está instalado: `sudo apt install tree`.

---

## Bloque 2: Privilegios y Permisos

### Conceptos: chmod y sudo
* **chmod (change mode):** Modifica los bits de permisos (rwx).
* **sudo (superuser do):** Ejecución de procesos con privilegios de administrador (root).
* En Linux, la seguridad se basa en el bit de ejecución; un script no es un programa hasta que se activa dicho bit.
* **Ejemplo:** `chmod +x script.sh`

---

## Practica 2: Habilitación del Laboratorio

1. Intenta ejecutar el script de inicialización:
   `./setup.sh`
   *Resultado esperado: Permission denied.*
2. Otorga permisos de ejecución:
   `chmod +x setup.sh`
3. Ejecuta el script para generar los datos de prueba:
   `./setup.sh`
4. Verifica los nuevos archivos creados con el comando `tree`.

---

## Bloque 3: Manipulación y Despliegue

* **mkdir -p (make directory -parents):** Crea rutas completas sin errores de "directorio no existe".
* **mv (move):** Mueve o renombra. En Linux, renombrar es mover el puntero del archivo.
* **cp -r (copy -recursive):** Duplica directorios completos y su contenido.
* **Ejemplo:** `mkdir -p logs/archive/2025`

---

## Practica 3: Organización de Entornos

1. Crea una estructura para simular un despliegue:
   `mkdir -p deploy/config`
2. Mueve los archivos de configuración `.conf` al nuevo directorio:
   `mv *.conf deploy/config/`
3. Crea un respaldo del log principal:
   `cp app.log app.log.bak`

---

## Bloque 4: Monitoreo y Edición

* **tail -f (follow):** Muestra el final de un archivo y se mantiene a la espera de nuevas líneas.
* **nano:** Editor de texto simple y directo (modeless).
* `tail -f` es la herramienta estándar para debugging de flujos de datos y logs de aplicaciones en tiempo real.
* **Ejemplo:** `tail -f /var/log/syslog`

---

## Practica 4: Debugging y Hotfix

1. Inicia el monitoreo del log:
   `tail -f app.log`
   *(Observa la actividad y finaliza con Ctrl+C)*.
2. Edita la configuración del laboratorio:
   `nano deploy/config/settings.conf`
3. Cambia un parámetro (ej: `DEBUG=true`), guarda con **Ctrl+O** (Enter) y sal con **Ctrl+X**.

---

## Bloque 5: Búsqueda y Tuberías

* **find:** Localiza archivos por nombre o atributos en el sistema de archivos.
* **grep (Global Regular Expression Print):** Filtra texto basado en patrones.
* **| (Pipe):** Canaliza la salida de un comando como entrada al siguiente.
* **Ejemplo:** `grep "ERROR" app.log`

---

## Practica 5: Localización de Errores

1. Busca el archivo de base de datos generado por el setup:
   `find . -name "users.db"`
2. Filtra todos los eventos críticos del log:
   `grep "CRITICAL" app.log`
3. **Encadenamiento técnico:** Lista el historial y busca solo comandos de tipo `chmod`:
   `history | grep "chmod"`

---

## Bloque 6: Gestión de Crisis y Recursos

* **htop:** Monitor interactivo de recursos (CPU, Memoria, SWAP).
* **kill -9 (SIGKILL):** Señal de terminación forzosa de un proceso.
* Necesario cuando una instancia de backend se bloquea y consume el 100% de los recursos del sistema.
* **Ejemplo:** `kill -9 1234` (donde 1234 es el PID).

---

## Practica 6: Terminación de Procesos

1. Lanza el proceso de carga en segundo plano:
   `./scripts/process_loop.sh &`
2. Abre `htop` (o `top`) e identifica el script.
3. Observa el **PID** (Process ID) del script.
4. Termina el proceso manualmente:
   `kill -9 [TU_PID]`

---

## Bloque 7: Diagnóstico de Red

* **ss (socket statistics):** Analiza sockets abiertos y puertos en escucha.
* **curl -I:** Realiza peticiones HTTP devolviendo únicamente las cabeceras.
* `ss -tunlp` es fundamental para verificar si una App ha bindeado correctamente su puerto de red.
* **Ejemplo:** `ss -tunlp | grep :80`

---

## Practica 7: Verificación de Puertos

1. Inspecciona las interfaces y direcciones IP:
   `ip addr`
2. Verifica si hay servicios escuchando en el puerto 8080:
   `ss -tunlp | grep :8080`
3. Valida la conectividad externa:
   `curl -I https://www.google.com`

---

## Bloque 8: Auditoría y Salida

* **history:** Registro de comandos del usuario actual. Permite trazabilidad.
* **exit:** Cierra la shell actual o la conexión SSH.
* El historial permite recuperar comandos complejos sin necesidad de reescribirlos.
* **Ejemplo:** `!45` (Ejecuta el comando número 45 del historial).

---

## Practica 8: Auditoría y Desconexión

1. Visualiza los comandos ejecutados en el laboratorio:
   `history`
2. Limpia el búfer visual de la terminal:
   `clear`
3. Finaliza la sesión segura:
   `exit`
