# Writeups

Documentación técnica de mis laboratorios de ciberseguridad, principalmente de **Hack The Box**: cada reto se documenta con la misma estructura (enumeración, explotación, escalada de privilegios y remediación) y con sus evidencias.

## Contenido

| Elemento | Descripción |
|----------|-------------|
| `nuevo_reto.sh` | Script que crea la estructura de un nuevo laboratorio. |
| `htb/`, `thm/`, `vulnhub/`, `btlo/` | Laboratorios por plataforma: Hack The Box, TryHackMe, VulnHub y Blue Team Labs Online. |
| `<plataforma>/YYYY-MM-DD-<plataforma>-<nombre>/` | Un laboratorio (lo genera el script). |
| `<plataforma>/…/<plataforma>-<nombre>.md` | Write-up del laboratorio. |
| `<plataforma>/…/evidencias/` | Capturas del laboratorio, ya revisadas y redactadas. |

## `nuevo_reto.sh`

Crea en un solo paso la carpeta del laboratorio, las carpetas de evidencias y la plantilla del write-up.

**Requisitos:** macOS o Linux con Bash. Si hace falta, `chmod +x nuevo_reto.sh`.

```bash
./nuevo_reto.sh "Nombre de la máquina"                    # Hack The Box (por defecto)
./nuevo_reto.sh --plataforma thm "Nombre de la sala"      # htb | thm | vulnhub | btlo
./nuevo_reto.sh                                           # sin argumento, pregunta el nombre
```

Ejemplo con espacios y tildes:

```bash
./nuevo_reto.sh "Máquina Ñandú"
```

Genera:

```text
htb/2026-11-03-htb-maquina-nandu/
├── htb-maquina-nandu.md      # write-up (plantilla)
├── evidencias/               # capturas redactadas: lo único que se publica
└── evidencias-originales/    # capturas sin redactar: nunca se suben a Git
```

El título del write-up conserva el nombre original (`# Máquina Ñandú — Hack The Box`); los nombres de carpeta y fichero van sin tildes, en minúsculas y con guiones.

### Plantilla del write-up

Cabecera con fecha, plataforma, dificultad, sistema operativo y dirección IP, más cuatro secciones:

1. **Enumeración**: herramientas usadas y servicios o puertos descubiertos.
2. **Explotación**: vulnerabilidad aprovechada, método y comandos.
3. **Escalada de Privilegios**: paso del usuario inicial a root/SYSTEM.
4. **Remediación**: correcciones propuestas (parches, configuración, buenas prácticas).

Cada sección incluye un comentario HTML con un ejemplo de captura que se activa quitando `<!-- -->`:

```markdown
![Escaneo Nmap](evidencias/2026-11-03-htb-maquina-nandu-nmap.png)
```

### Comportamiento ante errores

| Situación | Resultado |
|-----------|-----------|
| Nombre vacío o solo espacios | Error y código de salida `1`. |
| Nombre sin caracteres válidos (solo símbolos) | Error y código de salida `1`. |
| Plataforma no reconocida | Error y código de salida `1`. |
| La carpeta ya existe | Error y código de salida `1`; no se sobrescribe nada. |

## Convenciones

- **Idioma:** español, con los términos técnicos en su forma habitual (*write-up*, *Escalada de Privilegios*).
- **Nombres de archivo:** minúsculas, sin tildes ni espacios, con prefijo de fecha `YYYY-MM-DD`.
- **Evidencias:** cada captura se referencia con ruta relativa y texto alternativo descriptivo.
- **Datos sensibles:** nunca se publican contraseñas, tokens, datos personales propios o de terceros, ni información que permita atacar sistemas en producción.
- **Alcance:** solo laboratorios autorizados e investigaciones dentro de su marco legal y ético.

## Flujo de trabajo

1. Crear el laboratorio con `./nuevo_reto.sh "<nombre>"`.
2. Documentar durante el proceso: comandos y resultados en cada sección.
3. Guardar las capturas sin editar en `evidencias-originales/`.
4. Antes de publicar, crear la versión redactada en `evidencias/` (ocultar o recortar datos personales, correos, direcciones, pestañas del navegador y barras de direcciones) y comprobar que las rutas de imagen existen.
5. Subir a Git solo el write-up y `evidencias/`.
