# Security Lab

**Guillermo González Callero** · [LexRoot en Hack The Box](https://profile.hackthebox.com/profile/01a1777c-1c79-7096-8ac5-04f72f35780a) · [LinkedIn](https://www.linkedin.com/in/guillermo-gonzalez-callero/)

Portfolio de mi aprendizaje práctico en ciberseguridad: write-ups de laboratorios de **Hack The Box**, apuntes de estudio y la automatización que uso para documentarlo todo con el mismo formato.

## Quién soy

Graduado en Derecho, cursando un doble máster en Abogacía y Procura y en Derecho Digital (UNIR). Me muevo entre el derecho, la automatización y la IA, y aprendo ciberseguridad con un enfoque práctico, con interés en cumplimiento y privacidad (RGPD).

Autor de todo el contenido de este repositorio: investigación, pruebas, capturas y redacción.

## Qué encontrarás aquí

| Carpeta | Contenido | Estado |
|---|---|---|
| [`writeups/`](writeups/) | Write-ups de Hack The Box y el script `nuevo_reto.sh` que genera su estructura. | 1 publicado |
| [`notas/`](notas/) | Apuntes de estudio sobre redes y Linux. | Próximamente |
| [`docs/`](docs/guia-laboratorio.md) | Cómo está montado mi laboratorio: Kali en una máquina virtual aislada, con instantáneas. | Disponible |

## Write-ups publicados

| Fecha | Informe | Tema |
|---|---|---|
| 2026-11-03 | [Checkout de HTB Academy (Recurly): IVA y NIF para consumidores de Canarias](writeups/htb/2026-11-03-htb-recurly-billing-bug/htb-recurly-billing-bug.md) | Fallo de lógica de negocio y validación fiscal, con evidencias y comunicación con el soporte. |

## Cómo trabajo

- **Entorno:** máquina virtual Kali Linux aislada del sistema principal y con instantáneas antes de cada ejercicio.
- **Plataformas:** Hack The Box como plataforma principal; TryHackMe, VulnHub y Blue Team Labs Online como complemento.
- **Método:** primero atacar (reconocimiento con Nmap, explotación, escalada de privilegios) y después analizar qué rastro habría delatado el ataque (logs y tráfico de red con Wireshark).
- **Formato de cada write-up:** Enumeración → Explotación → Escalada de Privilegios → Remediación.

## Privacidad y ética

Solo documento laboratorios autorizados e investigaciones dentro de su marco legal. Las capturas se publican redactadas, sin datos personales míos ni de terceros.

## Próximos pasos

- [x] Laboratorio Kali aislado y acceso por SSH configurado.
- [x] Script para crear la estructura de cada write-up.
- [x] Primer informe publicado (checkout de HTB Academy).
- [ ] Publicar los primeros write-ups de máquinas de Hack The Box.
- [ ] Completar la ruta Pre Security de TryHackMe.
- [ ] Escribir los apuntes de redes y Linux.
