# Linux Essentials: Guía de Referencia Rápida
### Resumen Técnico para el Equipo de Desarrollo

---

## 0. Acceso y Ubicación
* **ssh [user]@[ip]**: (Secure Shell). Inicia una sesión cifrada en un servidor remoto.
* **whoami**: (Who am I). Devuelve el nombre del usuario actual. Útil para verificar privilegios.
* **pwd**: (Print Working Directory). Muestra la ruta absoluta desde la raíz (/) hasta la carpeta actual.

---

## 1. Exploración de Estructuras
* **ls -la**: (List). Lista archivos en formato extendido (-l) incluyendo ocultos (-a). Permite ver permisos, dueños y tamaños.
* **tree**: (Árbol). Genera una representación gráfica de la jerarquía de directorios. Utilizado para entender la arquitectura de un repositorio.

---

## 2. Gestión de Permisos
* **chmod +x [archivo]**: (Change Mode). Otorga permisos de ejecución al archivo especificado. Indispensable para ejecutar scripts (.sh).
* **sudo [comando]**: (Superuser Do). Ejecuta un comando con los privilegios del administrador del sistema (root).
* **chown [user]:[group]**: (Change Owner). Cambia el propietario y el grupo de un archivo o directorio.

---

## 3. Manipulación de Archivos y Directorios
* **mkdir -p [ruta]**: (Make Directory). Crea carpetas. La opción -p crea directorios padres si no existen, evitando errores de ruta.
* **mv [origen] [destino]**: (Move). Mueve archivos o cambia su nombre.
* **cp -r [origen] [destino]**: (Copy). Duplica archivos. La opción -r (recursive) es obligatoria para copiar carpetas completas.
* **rm -rf [ruta]**: (Remove). Borra archivos o directorios de forma recursiva (-r) y forzada (-f). Usar con extrema precaución.

---

## 4. Visualización y Edición de Datos
* **cat [archivo]**: (Concatenate). Despliega el contenido completo de un archivo en la terminal.
* **tail -f [archivo]**: (Tail Follow). Muestra las últimas líneas de un archivo y se mantiene a la espera de nuevas entradas. Estándar para monitoreo de logs.
* **nano [archivo]**: Editor de texto en terminal, ligero y directo para modificaciones rápidas de configuración.

---

## 5. Búsqueda y Filtrado (Pipes)
* **find [ruta] -name "[patrón]"**: Localiza archivos por nombre exacto o extensiones mediante comodines (*).
* **grep "[texto]" [archivo]**: (Global Regular Expression Print). Busca y extrae líneas que contengan el patrón de texto especificado.
* **[comando] | [comando]**: (Pipe). Tubería que redirige la salida del primer comando como entrada del segundo, permitiendo el filtrado de datos complejo.

---

## 6. Monitoreo del Sistema y Procesos
* **htop**: Monitor interactivo de recursos del sistema. Permite visualizar el consumo de CPU, Memoria y gestionar procesos de forma visual.
* **ps aux**: (Process Status). Muestra una instantánea de todos los procesos en ejecución en el sistema.
* **kill -9 [PID]**: Envía una señal de terminación forzosa (SIGKILL) a un proceso mediante su identificador numérico.

---

## 7. Diagnóstico de Red
* **ip addr**: Muestra las interfaces de red y las direcciones IP asignadas a la máquina.
* **ss -tunlp**: (Socket Statistics). Lista los puertos abiertos y los procesos que los están utilizando (sockets en escucha).
* **curl -I [url]**: Realiza una petición a una dirección y devuelve únicamente las cabeceras HTTP para verificar el estado del servicio.

---

## 8. Auditoría y Finalización
* **history**: Despliega el registro de comandos ejecutados anteriormente por el usuario.
* **clear**: Limpia el búfer visual de la terminal sin borrar el historial.
* **exit**: Finaliza la sesión actual de la shell y cierra la conexión SSH si corresponde.

