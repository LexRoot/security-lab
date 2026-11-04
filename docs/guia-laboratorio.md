# Mi laboratorio Red Team / Blue Team

Cómo tengo montado mi entorno para practicar ataque (red team) y defensa (blue team) de forma **aislada**, con máquinas vulnerables diseñadas para ello. No escribo malware: uso plataformas educativas con máquinas legales y controladas.

## 1. Aislamiento del entorno

- **Virtualizador:** UTM en Apple Silicon (motor "Virtualización de Apple"). En Intel serviría VirtualBox o VMware.
- **Máquina atacante:** VM con **Kali Linux** (oficial, con herramientas de pentesting).
- **Red:** las plataformas que se conectan por OpenVPN (Hack The Box, TryHackMe) necesitan salida normal a internet, así que uso red compartida (NAT). El modo "Host-only" aislado lo reservo para trabajar offline con VulnHub o con software potencialmente peligroso.
- **Instantáneas:** antes de cada ejercicio guardo una *snapshot* del estado limpio de la VM; si algo sale mal, restauro en segundos.
- **Comodidad:** SSH activado en Kali (`sudo systemctl enable --now ssh`) y conexión desde la Terminal nativa del Mac, para copiar y pegar y trabajar con texto grande.

## 2. Plataformas de práctica

| Plataforma | Para qué sirve | Nivel |
|---|---|---|
| **Hack The Box** | Máquinas y módulos estilo CTF, menos guiados | Principiante-Intermedio |
| **TryHackMe** | Salas guiadas paso a paso | Principiante |
| **VulnHub** | Máquinas descargables para montar en local, 100 % offline | Intermedio |
| **Blue Team Labs Online** | Ejercicios de defensa (análisis de logs, detección de intrusiones) | Principiante-Intermedio |

## 3. Red Team y Blue Team

- **Red Team (ataque):** desde la VM Kali, contra una máquina vulnerable. Reconocimiento (Nmap), explotación y escalada de privilegios.
- **Blue Team (defensa):** analizar qué rastro deja un ataque (logs, tráfico de red con Wireshark), detectar el comportamiento sospechoso y entender cómo se habría bloqueado.

Practico ambos lados de la misma máquina: primero la ataco y después analizo qué habría delatado el ataque. Es la forma más rápida que he encontrado de aprender a pensar como defensor.

## 4. Documentación

Cada reto de Hack The Box se crea con [`writeups/nuevo_reto.sh`](../writeups/README.md), que genera la carpeta, las subcarpetas de evidencias y una plantilla con esta estructura:

1. **Enumeración**: herramientas usadas y servicios descubiertos.
2. **Explotación**: vulnerabilidad aprovechada y comandos.
3. **Escalada de Privilegios**: del usuario inicial a root/SYSTEM.
4. **Remediación**: cómo corregir lo encontrado.

## 5. Datos sensibles

Antes de publicar cualquier captura o texto reviso:

- La barra del navegador, las pestañas abiertas y los campos de formularios.
- Que no aparezcan datos personales (DNI, direcciones, correos), ni míos ni de terceros.
- Que las capturas originales queden fuera del repositorio: solo subo las versiones redactadas.

## 6. Hoja de ruta de especialización

Cuando termine la base (redes, Linux y Windows), estas son las ramas que me interesan:

- **Red Team / Pentesting:** OSCP (OffSec Certified Professional).
- **Blue Team / SOC:** CompTIA Security+ y BTL1 (Blue Team Level 1).
- **AppSec / DevSecOps:** eWPT, OSWE, CSSLP/GSSP. OWASP no tiene certificación propia: el OWASP Top 10 es un estándar de referencia, no un examen.
