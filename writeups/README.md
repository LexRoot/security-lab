# Security Lab — Writeups & Documentation Portfolio

Repositorio de documentación técnica de laboratorios de seguridad: write-ups de máquinas de **Hack The Box**, investigaciones **OSINT** y sus evidencias asociadas.

> **Propósito:** dejar constancia reproducible y profesional de cada reto resuelto o investigación realizada, con su metodología, hallazgos, evidencias y recomendaciones de remediación.

---

## Índice

- [Contenido del repositorio](#contenido-del-repositorio)
- [Automatización: `nuevo_reto.sh`](#automatización-nuevo_retosh)
  - [Requisitos](#requisitos)
  - [Sintaxis](#sintaxis)
  - [Ejemplos prácticos](#ejemplos-prácticos)
  - [Estructura generada](#estructura-generada)
  - [Reglas de nombrado](#reglas-de-nombrado)
  - [Comportamiento ante errores](#comportamiento-ante-errores)
- [Convenciones de documentación](#convenciones-de-documentación)
- [Flujo de trabajo recomendado](#flujo-de-trabajo-recomendado)

---

## Contenido del repositorio

| Elemento | Descripción |
|----------|-------------|
| `nuevo_reto.sh` | Script de automatización que crea la estructura de un nuevo laboratorio HTB. |
| `YYYY-MM-DD-htb-<nombre>/` | Carpeta de un laboratorio de Hack The Box (generada por el script). |
| `YYYY-MM-DD-htb-<nombre>/htb-<nombre>.md` | Nota principal (write-up) del laboratorio. |
| `YYYY-MM-DD-htb-<nombre>/evidencias/` | Capturas de pantalla y pruebas del laboratorio. |
| `*.md` en la raíz | Informes independientes (por ejemplo, investigaciones OSINT). |
| `evidencias/` | Evidencias de los informes que no pertenecen a una carpeta de laboratorio. |

---

## Automatización: `nuevo_reto.sh`

`nuevo_reto.sh` crea, en un solo paso, la carpeta de un laboratorio de Hack The Box con su subcarpeta de evidencias y una plantilla Markdown de write-up ya estructurada. Así cada reto se documenta con el mismo formato.

### Requisitos

- macOS o Linux con **Bash**.
- Permiso de ejecución sobre el script (`chmod +x nuevo_reto.sh` si hiciera falta).
- Ejecutarlo desde la carpeta `writeups/`, donde se generan los laboratorios.

### Sintaxis

```bash
./nuevo_reto.sh "Nombre de la máquina"
./nuevo_reto.sh            # el script pregunta el nombre
```

| Modo | Comportamiento |
|------|----------------|
| Con argumento | Usa el nombre indicado y finaliza sin preguntar nada más. |
| Sin argumento | Muestra el prompt `Nombre de la máquina:` y espera la entrada. |

### Ejemplos prácticos

**1. Crear un laboratorio con nombre sencillo**

```bash
./nuevo_reto.sh miau
```

Resultado:

```text
Laboratorio creado:
  Carpeta:     .../writeups/2026-11-03-htb-miau
  Write-up:    .../writeups/2026-11-03-htb-miau/htb-miau.md
  Evidencias:  .../writeups/2026-11-03-htb-miau/evidencias
```

**2. Crear un laboratorio con espacios y tildes**

```bash
./nuevo_reto.sh "Máquina Ñandú"
```

Genera la carpeta `2026-11-03-htb-maquina-nandu/` (sin tildes, en minúsculas y con guiones). El título dentro del write-up conserva el nombre original: `# Máquina Ñandú — Hack The Box`.

**3. Usar el modo interactivo**

```bash
./nuevo_reto.sh
# Nombre de la máquina: Forest
```

**4. Guardar un laboratorio y empezar a documentar**

```bash
./nuevo_reto.sh Forest
cd 2026-11-03-htb-forest
nano htb-forest.md                  # rellenar el write-up
mv ~/Desktop/captura.png evidencias/2026-11-03-htb-forest-nmap.png
```

### Estructura generada

Para el nombre `miau`, el script produce:

```text
2026-11-03-htb-miau/
├── htb-miau.md          # Nota principal (write-up)
└── evidencias/          # Capturas y pruebas del reto
```

**Nota principal (`htb-<nombre>.md`).** Incluye una cabecera con los metadatos del laboratorio (fecha, plataforma, dificultad, sistema operativo y dirección IP, pendientes de rellenar) y cuatro secciones:

| Sección | Contenido esperado |
|---------|--------------------|
| 1. Enumeración | Herramientas utilizadas y servicios/puertos descubiertos. |
| 2. Explotación | Vulnerabilidad aprovechada, método y comandos empleados. |
| 3. Escalada de Privilegios | Paso del usuario inicial a root/SYSTEM. |
| 4. Remediación | Correcciones propuestas (parches, configuración, buenas prácticas). |

Cada sección incluye un comentario HTML con un ejemplo de captura, que se activa quitando los delimitadores `<!-- -->`. Las rutas de ejemplo apuntan a `evidencias/`:

```markdown
![Escaneo Nmap](evidencias/2026-11-03-htb-miau-nmap.png)
```

**Subcarpeta de evidencias (`evidencias/`).** Almacena todas las imágenes y ficheros de prueba del laboratorio. Se recomienda usar rutas relativas desde la nota principal, como en el ejemplo anterior, para que el write-up siga funcionando al moverlo o publicarlo.

### Reglas de nombrado

| Elemento | Regla | Ejemplo (`Máquina Ñandú`) |
|----------|-------|---------------------------|
| Prefijo de fecha | `YYYY-MM-DD` de la fecha de creación | `2026-11-03` |
| Plataforma | Fijo: `htb` | `htb` |
| Slug | Sin tildes (`á é í ó ú ü ñ`), minúsculas, espacios y símbolos convertidos en guiones | `maquina-nandu` |
| Carpeta | `YYYY-MM-DD-htb-<slug>` | `2026-11-03-htb-maquina-nandu/` |
| Nota | `htb-<slug>.md` | `htb-maquina-nandu.md` |
| Evidencias | Recomendado: `YYYY-MM-DD-htb-<slug>-<descripcion>.png` | `2026-11-03-htb-maquina-nandu-root.png` |

### Comportamiento ante errores

| Situación | Resultado |
|-----------|-----------|
| Nombre vacío o solo espacios | Error: `el nombre no puede estar vacío.` Código de salida `1`. |
| Nombre sin caracteres válidos (por ejemplo, solo símbolos) | Error: `el nombre no contiene caracteres válidos.` Código de salida `1`. |
| La carpeta del laboratorio ya existe | Error: `ya existe ... No se sobrescribe nada.` Código de salida `1`. Ningún fichero se modifica. |

> **Importante:** si se ejecuta dos veces el mismo nombre el mismo día, el script **no** sobrescribe el laboratorio existente. Para crear otro, cambia el nombre o espera al día siguiente.

---

## Convenciones de documentación

- **Idioma:** español, con los términos técnicos en su forma habitual (por ejemplo, *Escalada de Privilegios*, *write-up*).
- **Nombres de archivo:** en minúsculas, sin tildes ni espacios, con el prefijo de fecha `YYYY-MM-DD`.
- **Evidencias:** cada captura debe referenciarse desde la nota con una ruta relativa y tener un texto alternativo descriptivo.
- **Datos sensibles:** no incluir contraseñas reales, tokens, datos personales de terceros ni información que permita atacar sistemas en producción. Enmascarar lo necesario antes de publicar capturas.
- **Alcance:** documentar únicamente laboratorios autorizados (Hack The Box) e investigaciones realizadas dentro de su marco legal y ético.

---

## Flujo de trabajo recomendado

1. **Crear** la estructura del laboratorio con `./nuevo_reto.sh "<nombre>"`.
2. **Documentar** durante el proceso: anota comandos y resultados en la sección correspondiente.
3. **Guardar evidencias** en `evidencias/` con nombres estandarizados.
4. **Revisar** que todas las rutas de imagen existan y que no haya datos sensibles.
5. **Confirmar** cambios con un commit descriptivo en Git.

```bash
git add writeups/YYYY-MM-DD-htb-<nombre>/
git commit -m "Documenta laboratorio HTB <nombre>"
```

---

*Documentación mantenida como parte del Security Lab personal.*
