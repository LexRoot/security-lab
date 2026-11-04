#!/usr/bin/env bash
# nuevo_reto.sh — Crea la carpeta de un laboratorio de Hack The Box con sus
# carpetas de evidencias y la plantilla Markdown del write-up.
#
# Uso:
#   ./nuevo_reto.sh "Nombre de la máquina"
#   ./nuevo_reto.sh            (te lo pregunta)
#
# Resultado (dentro de htb/, junto a este script):
#   htb/YYYY-MM-DD-htb-<nombre>/
#   ├── htb-<nombre>.md        plantilla del write-up
#   ├── evidencias/            capturas ya redactadas (lo único que se publica)
#   └── evidencias-originales/ capturas sin redactar (nunca se suben a Git)

set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Nombre del reto: argumento o pregunta interactiva
NOMBRE="${1:-}"
if [ -z "$NOMBRE" ]; then
    read -r -p "Nombre de la máquina: " NOMBRE
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
LAB_DIR="$BASE_DIR/htb/${FECHA}-htb-${SLUG}"
EVID_DIR="$LAB_DIR/evidencias"
ORIG_DIR="$LAB_DIR/evidencias-originales"
MD_FILE="$LAB_DIR/htb-${SLUG}.md"

if [ -e "$LAB_DIR" ]; then
    echo "Error: ya existe $LAB_DIR. No se sobrescribe nada." >&2
    exit 1
fi

mkdir -p "$EVID_DIR" "$ORIG_DIR"

cat > "$MD_FILE" <<EOF
# ${NOMBRE} — Hack The Box

- **Fecha:** ${FECHA}
- **Plataforma:** Hack The Box
- **Dificultad:**
- **Sistema operativo:**
- **Dirección IP:**

---

## 1. Enumeración

Herramientas utilizadas y servicios/puertos descubiertos.

<!-- Ejemplo de captura: ![Escaneo Nmap](evidencias/${FECHA}-htb-${SLUG}-nmap.png) -->

## 2. Explotación

Vulnerabilidad aprovechada, cómo se explotó y comandos utilizados.

<!-- Ejemplo de captura: ![Acceso inicial](evidencias/${FECHA}-htb-${SLUG}-explotacion.png) -->

## 3. Escalada de Privilegios

Cómo se pasó del usuario inicial a root/SYSTEM.

<!-- Ejemplo de captura: ![Root](evidencias/${FECHA}-htb-${SLUG}-root.png) -->

## 4. Remediación

Cómo corregir las vulnerabilidades encontradas (parches, configuración, buenas prácticas).
EOF

echo "Laboratorio creado:"
echo "  Carpeta:               $LAB_DIR"
echo "  Write-up:              $MD_FILE"
echo "  Evidencias (públicas): $EVID_DIR"
echo "  Originales (privadas): $ORIG_DIR"
