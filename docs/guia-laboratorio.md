# Guía de configuración del laboratorio Red Team / Blue Team

Objetivo: practicar ataque (red team) y defensa (blue team) en un entorno **aislado**, usando máquinas vulnerables diseñadas para ello, y documentar cada ejercicio.

No se escribe malware real. Se usan plataformas educativas con máquinas legales y controladas.

## 1. Aislamiento del entorno

1. Instala un virtualizador. En Apple Silicon: **UTM** (gratuito, motor "Virtualización de Apple"). En Intel: VirtualBox o VMware.
2. Para practicar en plataformas que se conectan por OpenVPN (Hack The Box, TryHackMe) la VM necesita **salida normal a internet** (red compartida/NAT). El modo "Host-only" aislado se reserva para trabajar offline con VulnHub o con software potencialmente peligroso.
3. Antes de cada ejercicio, haz una **snapshot** del estado limpio de la VM si tu virtualizador lo permite. Si algo sale mal, restauras en segundos.
4. Usa una VM **Kali Linux** (oficial, con herramientas de pentesting) como máquina atacante.
5. Para trabajar cómodo (copiar/pegar, texto grande): activa SSH dentro de Kali (`sudo systemctl enable --now ssh`) y conéctate desde la Terminal nativa del Mac.

## 2. Plataformas de práctica

| Plataforma | Para qué sirve | Nivel |
|---|---|---|
| **Hack The Box** | Máquinas y módulos estilo CTF, menos guiados | Principiante-Intermedio |
| **TryHackMe** | Salas guiadas paso a paso | Principiante |
| **VulnHub** | Máquinas descargables para montar en local, 100 % offline | Intermedio |
| **Blue Team Labs Online** | Ejercicios de defensa (análisis de logs, detección de intrusiones) | Principiante-Intermedio |

## 3. Red Team vs Blue Team

- **Red Team (ataque):** desde la VM Kali, contra una máquina vulnerable. Reconocimiento (Nmap), explotación y escalada de privilegios.
- **Blue Team (defensa):** analizar qué rastro deja un ataque (logs, tráfico de red con Wireshark), detectar el comportamiento sospechoso y entender cómo se habría bloqueado.

Practicar ambos lados de la misma máquina, primero atacarla y luego analizar qué habría delatado el ataque, enseña a pensar como defensor.

## 4. Documentación de cada ejercicio

Cada reto de Hack The Box se crea con el script [`writeups/nuevo_reto.sh`](../writeups/README.md), que genera la carpeta, la subcarpeta `evidencias/` y una plantilla con esta estructura:

1. **Enumeración**: herramientas usadas y servicios descubiertos.
2. **Explotación**: vulnerabilidad aprovechada y comandos.
3. **Escalada de privilegios**: del usuario inicial a root/SYSTEM.
4. **Remediación**: cómo corregir lo encontrado.

Para otros ejercicios se puede usar el esquema del [README principal](../README.md#cómo-documento-cada-ejercicio), que incluye también los intentos fallidos y el análisis defensivo: demuestran cómo se razona, no solo el resultado final.

## 5. Datos sensibles

Antes de publicar cualquier captura o texto:

- Revisa la barra del navegador, las pestañas abiertas y los campos de formularios.
- Oculta o recorta datos personales (DNI, direcciones, correos) y los de terceros.
- Guarda las capturas originales fuera del repositorio y sube solo las versiones redactadas.

## 6. Hoja de ruta de especialización

Cuando termine la base (redes, Linux y Windows), estas son las ramas que me interesan:

- **Red Team / Pentesting:** OSCP (OffSec Certified Professional).
- **Blue Team / SOC:** CompTIA Security+ y BTL1 (Blue Team Level 1).
- **AppSec / DevSecOps:** eWPT, OSWE, CSSLP/GSSP. OWASP no tiene certificación propia: el OWASP Top 10 es un estándar de referencia, no un examen.
