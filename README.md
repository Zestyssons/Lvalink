# Lavalink Server for Glizh Music (Render Ready)

Servidor Lavalink optimizado para ser desplegado en Render.com usando Docker. Incluye soporte para Spotify, YouTube y SoundCloud mediante plugins.

## 🚀 Despliegue en Render.com

1. Crea un nuevo **Web Service** en Render.
2. Conecta este repositorio de GitHub.
3. Configura el **Runtime** como `Docker`.
4. En **Environment Variables**, añade las siguientes:
   - `SPOTIFY_CLIENT_ID`: Tu Client ID de Spotify.
   - `SPOTIFY_CLIENT_SECRET`: Tu Client Secret de Spotify.
   - `PORT`: 2333 (Render lo asigna automáticamente, pero puedes forzarlo).
5. Selecciona el plan **Free** (o superior).

## 🛠️ Variables de Entorno Necesarias

| Variable | Descripción |
|----------|-------------|
| `SPOTIFY_CLIENT_ID` | Obtener en [Spotify Developer Dashboard](https://developer.spotify.com/dashboard). |
| `SPOTIFY_CLIENT_SECRET` | Obtener en el mismo panel de Spotify. |

## 🔗 Configuración en el Bot (Vocard)

Para conectar tu bot a este servidor, edita el archivo `settings.json` de tu bot y añade este nodo:

```json
"Lavalink_Render": {
    "identifier": "Render Node",
    "host": "tu-app.onrender.com",
    "port": 443,
    "password": "glizhmusicpassword123",
    "secure": true,
    "heartbeat": 30
}
```

> **Nota:** Render usa HTTPS (puerto 443) por defecto para aplicaciones externas.

## 🛡️ Mantener 24/7

Usa **UptimeRobot** para hacer un ping cada 5 minutos a la URL de tu servidor (ej. `https://tu-app.onrender.com`) para evitar que el plan gratuito de Render entre en modo reposo.
