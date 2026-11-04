#!/usr/bin/env bash
# nuevo_reto.sh — Crea la carpeta de un laboratorio con sus carpetas de
# evidencias y la plantilla Markdown del write-up.
#
# Uso:
#   ./nuevo_reto.sh "Nombre del reto"                      (Hack The Box)
#   ./nuevo_reto.sh --plataforma thm "Nombre de la sala"   (htb | thm | vulnhub | btlo)
#   ./nuevo_reto.sh                                        (te pregunta el nombre)
#
# Resultado (dentro de <plataforma>/, junto a este script):
#   <plataforma>/YYYY-MM-DD-<plataforma>-<nombre>/
#   ├── <plataforma>-<nombre>.md   plantilla del write-up
#   ├── evidencias/                capturas ya redactadas (lo único que se publica)
#   └── evidencias-originales/     capturas sin redactar (nunca se suben a Git)

set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

PLAT="htb"
NOMBRE=""
while [ $# -gt 0 ]; do
    case "$1" in
        -p|--plataforma)
            [ $# -ge 2 ] || { echo "Error: --plataforma necesita un valor (htb, thm, vulnhub o btlo)." >&2; exit 1; }
            PLAT="$(printf '%s' "$2" | tr '[:upper:]' '[:lower:]')"; shift 2 ;;
        -h|--help) sed -n '2,13p' "$0"; exit 0 ;;
        *) NOMBRE="$1"; shift ;;
    esac
done

case "$PLAT" in
    htb)     PLAT_NOMBRE="Hack The Box" ;;
    thm)     PLAT_NOMBRE="TryHackMe" ;;
    vulnhub) PLAT_NOMBRE="VulnHub" ;;
    btlo)    PLAT_NOMBRE="Blue Team Labs Online" ;;
    *) echo "Error: plataforma '$PLAT' no reconocida. Usa htb, thm, vulnhub o btlo." >&2; exit 1 ;;
esac

# Nombre del reto: argumento o pregunta interactiva
if [ -z "$NOMBRE" ]; then
    read -r -p "Nombre del reto: " NOMBRE
fi
if [ -z "${NOMBRE//[[:space:]]/}" ]; then
    echo "Error: el nombre no puede estar vacío." >&2
    exit 1
fi

# Slug seguro para carpetas y ficheros: sin tildes, minúsculas, guiones.
# Las tildes se quitan con reemplazos de Bash (iconv de macOS falla con ñ/acentos).
SLUG="$NOMBRE"
for par in á:a é:e í:i ó:o ú:u ü:u ñ:n Á:a É:e Í:i Ó:o Ú:u Ü:u Ñ:n; do
    SLUG="${SLUG//${par%%:*}/${par#*:}}"
done
SLUG="$(printf '%s' "$SLUG" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')"

if [ -z "$SLUG" ]; then
    echo "Error: el nombre no contiene caracteres válidos." >&2
    exit 1
fi

FECHA="$(date +%Y-%m-%d)"
LAB_DIR="$BASE_DIR/${PLAT}/${FECHA}-${PLAT}-${SLUG}"
EVID_DIR="$LAB_DIR/evidencias"
ORIG_DIR="$LAB_DIR/evidencias-originales"
MD_FILE="$LAB_DIR/${PLAT}-${SLUG}.md"

if [ -e "$LAB_DIR" ]; then
    echo "Error: ya existe $LAB_DIR. No se sobrescribe nada." >&2
    exit 1
fi

mkdir -p "$EVID_DIR" "$ORIG_DIR"

cat > "$MD_FILE" <<EOF
# ${NOMBRE} — ${PLAT_NOMBRE}

- **Fecha:** ${FECHA}
- **Plataforma:** ${PLAT_NOMBRE}
- **Dificultad:**
- **Sistema operativo:**
- **Dirección IP:**

---

## 1. Enumeración

Herramientas utilizadas y servicios/puertos descubiertos.

<!-- Ejemplo de captura: ![Escaneo Nmap](evidencias/${FECHA}-${PLAT}-${SLUG}-nmap.png) -->

## 2. Explotación

Vulnerabilidad aprovechada, cómo se explotó y comandos utilizados.

<!-- Ejemplo de captura: ![Acceso inicial](evidencias/${FECHA}-${PLAT}-${SLUG}-explotacion.png) -->

## 3. Escalada de Privilegios

Cómo se pasó del usuario inicial a root/SYSTEM.

<!-- Ejemplo de captura: ![Root](evidencias/${FECHA}-${PLAT}-${SLUG}-root.png) -->

## 4. Remediación

Cómo corregir las vulnerabilidades encontradas (parches, configuración, buenas prácticas).
EOF

echo "Laboratorio creado (${PLAT_NOMBRE}):"
echo "  Carpeta:               $LAB_DIR"
echo "  Write-up:              $MD_FILE"
echo "  Evidencias (públicas): $EVID_DIR"
echo "  Originales (privadas): $ORIG_DIR"
