# Security Lab

Laboratorio personal de ciberseguridad donde practico **ataque (Red Team) y defensa (Blue Team)** en un entorno aislado, usando plataformas y máquinas educativas y legales.

Documento cada ejercicio para mostrar cómo razono, no solo el resultado final.

## Enfoque

- **Entorno:** máquina virtual Kali Linux como equipo atacante, aislada del sistema principal y con instantáneas (snapshots) antes de cada ejercicio.
- **Plataformas:** **Hack The Box** (usuario LexRoot) como plataforma principal; TryHackMe, VulnHub y Blue Team Labs Online como complemento.
- **Método:** primero atacar (reconocimiento con Nmap, explotación, escalada de privilegios) y después analizar qué rastro habría delatado el ataque (logs y tráfico de red con Wireshark).

## Estructura

- **`writeups/`**: documentación de cada laboratorio. Incluye `nuevo_reto.sh`, que crea la carpeta, la subcarpeta de evidencias y la plantilla de un nuevo reto de Hack The Box (ver [`writeups/README.md`](writeups/README.md)).
- **`notas/`**: apuntes de estudio (redes y Linux).
- **`docs/`**: [guía de configuración del laboratorio](docs/guia-laboratorio.md).

## Cómo documento cada ejercicio

1. Objetivo
2. Reconocimiento
3. Explotación
4. Qué no funcionó primero
5. Resultado
6. Análisis defensivo (Blue Team)
7. Qué he aprendido

## Privacidad y ética

Solo documento laboratorios autorizados e investigaciones dentro de su marco legal. Las capturas se publican redactadas, sin datos personales ni de terceros.

## Estado

En curso. Mi formación se apoya en Hack The Box y la complemento con la ruta Pre Security de TryHackMe. Iré publicando aquí los writeups y mis apuntes a medida que los termine.

## Contacto

[LinkedIn](https://www.linkedin.com/in/guillermo-gonzalez-callero/) | [Hack The Box](https://profile.hackthebox.com/profile/01a1777c-1c79-7096-8ac5-04f72f35780a)
